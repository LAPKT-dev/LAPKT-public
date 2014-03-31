#include <prop_h2.hxx>
#include <utility>
#include <iostream>
#include <fstream>
#include <map>

namespace aptk {

	Rule_Based_H2_Heuristic::Rule_Based_H2_Heuristic( const FOD_Problem& model ) 
	: m_model( model ), m_rules_fired( 0 ), m_noop_checks( 0 ), m_rules_footprint( 0.0 ), m_num_trigger_refs(0),
	m_verbose_computation( false ) {
		m_num_lits = Clause::num_lits();
		m_values.resize( m_num_lits*m_num_lits );
		std::cout << "Value Table entries = " << m_num_lits*m_num_lits;
		std::cout << " Size = " << (m_num_lits*m_num_lits*sizeof(float))/(1024*1024) << " MBytes" << std::endl;
		m_consequences.resize( m_num_lits );
		for ( auto v : m_consequences ) 
			v.reserve( m_num_lits );
		std::cout << "Consequences entries = " << m_num_lits*m_num_lits;
		std::cout << " Size = " << (m_num_lits*m_num_lits*sizeof(float))/(1024*1024) << " MBytes" << std::endl;
		m_updated_hash.resize( m_num_lits * m_num_lits );
	}
				
	Rule_Based_H2_Heuristic::~Rule_Based_H2_Heuristic() {
		for ( auto it = m_prop_rules.begin(); it != m_prop_rules.end(); it++ )
			delete *it;
		for ( auto it = m_triggers.begin(); it != m_triggers.end(); it++ )
			if ( *it != nullptr )
				delete *it;
	}

	void
	Rule_Based_H2_Heuristic::register_rule_triggers() {
		for ( unsigned k = 0; k < m_prop_rules.size(); k++ ) {
			Rule* r = m_prop_rules[k];
			int t0idx = k*3;
			int t1idx = t0idx + 1;
			int t2idx = t0idx + 2;

			for ( auto pi = r->m_condition.begin(); pi != r->m_condition.end(); pi++ ) {
				for ( auto pj = pi; pj != r->m_condition.end(); pj++ ) {
					m_num_trigger_refs++;
					//m_eff_idx_to_rule[ toInt(*pi) ].set( toInt(*pj)*m_triggers.size() + t0idx );
					Word_t index = (toInt(*pi)*m_num_lits + toInt(*pj) )*m_triggers.size() + t0idx;
					m_eff_idx_to_rule.set( index );
					m_num_trigger_refs++;
					index = (toInt(*pj)*m_num_lits + toInt(*pi) )*m_triggers.size() + t0idx;
					m_eff_idx_to_rule.set( index );
					//m_eff_idx_to_rule[ toInt(*pj) ].set( toInt(*pi)*m_triggers.size() + t0idx );				
				}
			}

			for ( int noop_idx = 0; noop_idx < m_num_lits; noop_idx++ ) {
				if ( !r->m_noop_mask.isset( noop_idx ) ) continue;
				// This is required because we want the rules which might update a certain 
				// noop, to be triggered
				for ( auto pi = r->m_condition.begin(); pi != r->m_condition.end(); pi++ ) {
					//m_eff_idx_to_rule[ noop_idx ].set( toInt(*pi)*m_triggers.size() + t1idx );
					Word_t index = (noop_idx*m_num_lits + toInt(*pi) )*m_triggers.size() + t1idx;
					m_eff_idx_to_rule.set( index );
					m_num_trigger_refs++;
					//m_eff_idx_to_rule[ toInt(*pi ) ].set( noop_idx*m_triggers.size() + t2idx );
					index = (toInt(*pi)*m_num_lits + noop_idx )*m_triggers.size() + t2idx;
					m_eff_idx_to_rule.set( index );
					m_num_trigger_refs++;
				}
			}

		}

	}

	void
	Rule_Based_H2_Heuristic::compute_from_model_invariants() {
		for ( auto p = m_values.begin(); p != m_values.end() ; p++ )
			*p = 0.0f;

		for ( int i = 0; i < m_num_lits; i++ ) {
			Lit li = toLit(i);
			int j = toInt(~li);
			m_values[ i * m_num_lits + j ] = infty;
		}

		for ( auto invariant : m_model.invariants ) {
			for ( unsigned k = 0; k < invariant.size(); k++ ) {
				Lit l1 = invariant[k];
				assert( atom(l1) < (int)m_model.n_atoms() );
				int base = toInt(l1) * m_num_lits;
				for ( unsigned j = k+1; j < invariant.size(); j++ ) {
					Lit l2 = invariant[j];
					assert( atom(l2) < (int)m_model.n_atoms() );
					m_values[ base + toInt(l2) ] =
					m_values[ toInt(l2) * m_num_lits + toInt(l1) ] = infty;	
				}
			}
		}	
		#ifdef DEBUG
		std::cout << "Mutexes: " << std::endl;
		for ( int i = 0; i < (int)m_values.size(); i++ ) {
			if ( m_values[i] == infty ) {
				std::cout << "\t";
				print_pair( i, std::cout );
				std::cout << std::endl;
			}
		}
		#endif

	}

	void
	Rule_Based_H2_Heuristic::setup( bool use_invariants ) {

		if ( use_invariants ) {
			std::cout << "Processing invariants..." << std::endl;
			compute_from_model_invariants();
			std::cout << "Extracting consequences..." << std::endl;
			extract_consequences_table();
			return;
		}

		build_propagation_rules();
		std::cout << "Propagation rules = " << m_prop_rules.size() << " Size = ";
		double rules_mem = m_rules_footprint / 1024.0;
		std::cout << rules_mem << " MBytes" << std::endl;
		std::cout << "Triggers = " << m_triggers.size() << " Size = ";
		double triggers_mem = (m_triggers.size()*sizeof(Trigger))/(1024.0*1024.0);
		std::cout << triggers_mem  << " MBytes" <<  std::endl;
		register_rule_triggers();
		std::cout << "Triggers Refs = " << m_num_trigger_refs << " Size = ";
		/*
		double count = 0.0;
		double avg = 0.0;
		int max = 0;
		int min = std::numeric_limits<int>::max();
		Lit min_lit, max_lit;
		std::map< int, int > histogram;
		for ( int i  = 0; i< m_eff_idx_to_rule.size(); i++ ) {
			count += m_eff_idx_to_rule[i].nbytes();
			avg += m_eff_idx_to_rule[i].size();
			histogram[ m_eff_idx_to_rule[i].size() ]++;
			if (  m_eff_idx_to_rule[i].size() < min ) {
				min = m_eff_idx_to_rule[i].size();
				min_lit = toLit( i );
			}
			if ( m_eff_idx_to_rule[i].size() > max  )  {
				max = m_eff_idx_to_rule[i].size();
				max_lit = toLit( i );
			}
		}
		std::cout << count / (1024.0*1024.0); 
		std::cout << " MBytes" << std::endl;
		std::cout << "Avg. Triggers per indices Pair is " << avg/(double)m_eff_idx_to_rule.size() << std::endl;
		std::cout << "Histogram " << std::endl;
		std::cout << "Size,#" << std::endl;
		for ( auto it = histogram.begin(); it != histogram.end(); it++ ) { 
			std::cout << "\t" << it->first << "," << it->second << std::endl;
		}
		std::cout << "Min Lit: " << (sign(min_lit) ? "NOT " : "" )<<  m_model.atoms[atom(min_lit)]->name << std::endl;
		std::cout << "Max Lit: " << (sign(max_lit) ? "NOT " : "" )<<  m_model.atoms[atom(max_lit)]->name << std::endl;
		*/
		double triggers_refs_mem = m_eff_idx_to_rule.nbytes() / (1024.0*1024.0);
		std::cout << triggers_refs_mem << " MBytes" << std::endl;
		initialize();
		compute();
		#ifdef DEBUG
		std::cout << "Mutexes: " << std::endl;
		for ( int i = 0; i < (int)m_values.size(); i++ ) {
			if ( m_values[i] == infty ) {
				std::cout << "\t";
				print_pair( i, std::cout );
				std::cout << std::endl;
			}
		}
		#endif
		extract_consequences_table();
		if ( triggers_refs_mem + triggers_mem + rules_mem > 128.0 )
			release_resources();
	}
	
	void
	Rule_Based_H2_Heuristic::release_resources( ) {
		for ( auto it = m_prop_rules.begin(); it != m_prop_rules.end(); it++ )
			delete *it;
		m_prop_rules.clear();
		for ( auto it = m_triggers.begin(); it != m_triggers.end(); it++ )
			delete *it;
		m_triggers.clear();
		m_eff_idx_to_rule.reset();	
	}

	Rule_Based_H2_Heuristic::Rule::Rule( const FOD_Problem::Action* a, const Clause& condition ) 
	: m_condition( condition ), m_cond_top( 0 ), m_value( infty ), m_action( a ) {
	}

	Rule_Based_H2_Heuristic::Rule::Rule( const FOD_Problem::Action* a ) 
	:  m_cond_top( 0 ), m_value( infty ), m_action( a ) {
	}

	double
	Rule_Based_H2_Heuristic::Rule::footprint_size() const {
		double bytes = sizeof(Rule_Based_H2_Heuristic::Rule);
		// condition clause
		bytes += m_condition.nbytes();
		bytes += m_prevail.nbytes();
		bytes += sizeof(m_cond_top);
		bytes += m_effect.nbytes();
		bytes += sizeof(m_value);
		bytes += sizeof(m_action);
		bytes += m_effects.size()*sizeof(int);
		bytes += m_noop_mask.nbytes();
		return bytes / 1024.0; // Returns # KBytes
	}

	void
	Rule_Based_H2_Heuristic::register_rule( Rule* r ) {
		
		// Register rule to relevant effect indices
		r->m_prevail.reserve( r->m_condition.size() );
		m_prop_rules.push_back( r );

		Trigger* t0 = new Trigger( r );
		m_triggers.push_back( t0 );

		for ( auto pi = r->m_condition.begin(); pi != r->m_condition.end(); pi++ ) {
			if ( !r->m_effect.entails( ~(*pi) ) ) 
				r->m_prevail.add( *pi );
			/*
			for ( auto pj = pi; pj != r->m_condition.end(); pj++ ) {
				m_num_trigger_refs++;
				m_eff_idx_to_rule[ index(*pi,*pj) ].set( t0idx );
				m_num_trigger_refs++;
				m_eff_idx_to_rule[ index(*pj,*pi) ].set( t0idx );				
			}
			*/			
		}

		r->m_noop_mask.resize( m_num_lits );
		Trigger* t1 = new Trigger( 1, r );
		m_triggers.push_back( t1 );
		Trigger* t2 = new Trigger( 2, r );
		m_triggers.push_back( t2 );

		for ( int noop_idx = 0; noop_idx < m_num_lits; noop_idx++ ) {
			Lit l_noop = toLit( noop_idx );
			if ( 	r->m_effect.entails( l_noop ) 
				|| r->m_effect.entails( ~l_noop ) 
				|| r->m_condition.entails( l_noop )
				|| r->m_condition.entails( ~l_noop ) ) {
				continue;
			}
			r->m_noop_mask.set( toInt( l_noop ) );
			// This is required because we want the rules which might update a certain 
			// noop, to be triggered
			/*
			for ( auto pi = r->m_condition.begin(); pi != r->m_condition.end(); pi++ ) {
				m_eff_idx_to_rule[ index(l_noop,*pi) ].set( t1idx );
				m_num_trigger_refs++;
				m_eff_idx_to_rule[ index(*pi, l_noop) ].set( t2idx );
				m_num_trigger_refs++;
			}
			*/
		}
		r->m_effects.reserve( (r->m_effect.size()*r->m_effect.size() + r->m_effect.size()) / 2 );
		// Make effect pairs
		for ( auto pi = r->m_effect.begin(); pi != r->m_effect.end(); pi++ ) {
			for ( auto pj = pi; pj != r->m_effect.end(); pj++ ) {
				r->m_effects.push_back( index(*pi,*pj) );
			}
				
		}
		
		m_rules_footprint += r->footprint_size();
	}

	void
	Rule_Based_H2_Heuristic::Rule::write( std::ostream& os, const FOD_Problem& model ) const {
		os << "Rule for action " << m_action->name << std::endl;
		os << "\tCondition: ";
		m_condition.write( os, model );
		os << std::endl;
		os << "\tTop = " << m_cond_top << std::endl;
		os << "\tEffect: ";
		m_effect.write( os, model );
		os << std::endl;
		os << "\tValue: " << m_value << std::endl;
	}

	void
	enumerate_dfs( const std::vector<unsigned>& v, unsigned idx, std::vector< bool >& context, std::vector< std::vector< unsigned > >& cases ) {

		if ( idx == v.size() ) {
			std::vector< unsigned > ce_case;
			ce_case.reserve( context.size() );
			for ( unsigned k = 0; k < context.size(); k++ )
				if ( context[k] ) ce_case.push_back( v[k] );
			if ( !ce_case.empty() ) cases.emplace_back( ce_case );
			return; 
		}	
		
		context[idx] = true;
		enumerate_dfs( v, idx + 1, context, cases );
		context[idx] = false;	
		enumerate_dfs( v, idx + 1, context, cases );
	}

	void
	enumerate_cases( const std::vector<unsigned>& v, std::vector< std::vector< unsigned > >& cases ) {
		std::vector< bool > context; 
		context.resize( v.size() );
		enumerate_dfs( v, 0, context, cases );
	}


	void
	Rule_Based_H2_Heuristic::build_propagation_rules() {
		m_rules_footprint = 0.0;
		for ( unsigned k = 0; k < m_model.actions.size(); k++ ) {
			const FOD_Problem::Action*	action = m_model.actions[k];
			
			// Make regular effect rules
			Clause	unconditional_effects;
			// Usually unconditional effects go in the first effect slot
			unconditional_effects.reserve( action->effects[0].effect.size() );
	
			for ( 	auto eff_it = action->effects.begin(); 
				eff_it != action->effects.end(); eff_it++ ) {
				if ( eff_it->condition.empty() )
					unconditional_effects.add( eff_it->effect );
			}
			// Account for conditional effects
			std::vector< unsigned > cond_eff_idxs;
			cond_eff_idxs.reserve( action->effects.size() );
			for ( unsigned i = 0; i < action->effects.size(); i++ ) {
				if ( !action->effects[i].condition.empty() )
					cond_eff_idxs.push_back( i );
			}

			Rule* uncond_rule = new Rule( action, action->precondition );

			if ( cond_eff_idxs.empty() ) {
				// let's convert the temporary into an rvalue, note
				// this is safe because if there are no conditional
				// effects further down the road, there's no point
				// in copying the vector	
				uncond_rule->m_effect = std::move( unconditional_effects );
				register_rule( uncond_rule );
				continue;
			}
			// We need to copy the effects
			uncond_rule->m_effect = unconditional_effects;
			register_rule( uncond_rule );
			
			std::vector< std::vector< unsigned > > cond_eff_cases;
			enumerate_cases( cond_eff_idxs, cond_eff_cases );
		
			for ( unsigned i = 0; i < cond_eff_cases.size(); i++ ) {
				Clause cond_i( action->precondition );
				Clause effect_i( unconditional_effects );
				for ( unsigned j = 0; j < cond_eff_cases[i].size(); j++ ) {
					cond_i.add( action->effects[cond_eff_cases[i][j]].condition );
					effect_i.add( action->effects[cond_eff_cases[i][j]].effect );
				}
				Rule* cond_rule = new Rule( action);
				// Here we convert the two temporaries into rvalues
				// since they're going to be destroyed anyways
				cond_rule->m_condition = std::move( cond_i );
				cond_rule->m_effect = std::move(effect_i);
				register_rule( cond_rule );
			}
		} 
	}

	void
	Rule_Based_H2_Heuristic::initialize() {
		#ifdef DEBUG
		std::ofstream out("h2-computation.log");
		#endif	
		for ( auto p = m_values.begin(); p != m_values.end() ; p++ )
			*p = infty;
	
		for ( auto pi = m_model.init.begin(); pi != m_model.init.end(); pi++ ) {
			for ( auto pj = pi; pj != m_model.init.end(); pj++ ) {
				int i1 = index( *pi, *pj ), i2 = index( *pj, *pi );
				m_values[ i1 ] = m_values[ i2 ] = 0.0f;
				#ifdef DEBUG
				if ( m_verbose_computation ) {
					out << "Updating (INIT): ";
					print_pair( i1, out );
					out << " <- " << 0.0f << std::endl; 
				}
				#endif
				notify_update( i1 );
			}	
		}
		#ifdef DEBUG
		out << "===================================================================================" << std::endl;	
		out << "Pairs updated by INIT: " << m_updated.size() << std::endl;
		#endif 
	}

	void
	Rule_Based_H2_Heuristic::print_pair( int i, std::ostream& os ) const {
		Clause pair;
		pair.add( first( i ) );
		pair.add( second( i ) );
		pair.write( os, m_model );
	}

	inline void
	Rule_Based_H2_Heuristic::Rule::update_reachability( const Rule_Based_H2_Heuristic& h, int pair_index ) {
		const unsigned cond_size = m_condition.size();
		unsigned&  top = m_cond_top;
		int i = h.first_index( pair_index );
		unsigned k;
		for ( k = 0; k < cond_size; k++ )
			if ( toInt( m_condition[k] ) == i )
				break;
			if ( k < cond_size && k >= top ) {
				std::swap( m_condition[k], m_condition[ top ] );
				top++;
			}
		if ( top < cond_size ) {
			int j = h.second_index( pair_index );
			if ( j != i ) {
				for ( k = 0; k < cond_size; k++ )
					if ( toInt( m_condition[k] ) == j )
						break;
				if ( k < cond_size && k >= top ) {
					std::swap( m_condition[k], m_condition[ top ] );
					top++;
				}
			}
		}
	}

	void
	Rule_Based_H2_Heuristic::compute() {
		m_rules_fired = 0;
		m_noop_checks = 0;
		while ( ! m_updated.empty() ) {
			int pair_index = m_updated.front();
			mark_as_processed( pair_index );

			#ifdef DEBUG
			std::ofstream out( "h2-computation.log", std::ofstream::out | std::ofstream::app );
			if ( m_verbose_computation ) {
				out << "===================================================================================" << std::endl;
				out << "Pairs to go: " << m_updated.size() << std::endl;	
				out << "Processing updated pair: ";
				print_pair( pair_index, out );
				out << std::endl; 
			}
			#endif

			int first_pair_idx = first_index(pair_index);
			int second_pair_idx = second_index(pair_index);
			Word_t base = (first_pair_idx*m_num_lits + second_pair_idx)*m_triggers.size();

			for ( Word_t offset = base; m_eff_idx_to_rule.next(offset); offset++ ) {
				
				Word_t trigger_index = offset - base;
				if ( trigger_index >= m_triggers.size() ) break;
				
				Trigger* t = m_triggers[trigger_index];
				Rule* r = t->rule();
		
				#ifdef DEBUG
				if ( m_verbose_computation ) {
					out << "Potentially firing rule due to "; 
					print_pair( pair_index, out );
					out << " being processed: " << std::endl;
					r->write( out, m_model );
					out << std::endl;
				}
				#endif
		
				// Check to avoid evaluating h2 over the precondition
				if ( /*!t->is_noop() &&*/ ( r->m_cond_top < r->m_condition.size() ) ) {
					r->update_reachability( *this, pair_index );

					#ifdef DEBUG
					if ( m_verbose_computation ) {
						out << "Rule state AFTER checking reachability: " << std::endl;
						r->write( out, m_model );
						out << std::endl;
					}
					#endif
				}

				float new_value = ( r->reachable() ? eval( r->m_condition ) : infty );
				if ( new_value == infty ) {
					if ( r->reachable() ) {
						#ifdef DEBUG
						if ( m_verbose_computation ) 
							out << "\tRule is reported as reachable, yet still has an infinite value!" << std::endl;
						#endif
						for ( auto pi = r->m_condition.begin(); pi != r->m_condition.end(); pi++ ) {
							int base = toInt(*pi) * m_num_lits;
							for ( auto pj = pi; pj != r->m_condition.end(); pj++ ) {
								float v_ij =  m_values[ base + toInt(*pj) ];
								#ifdef DEBUG
								if ( m_verbose_computation ) {
									out << "\t\t";
									print_pair( base + toInt(*pj), out );
									out << " -> " << v_ij;
									out << std::endl;
								}
								#endif
								if ( v_ij == infty ) {
									float v_ii = m_values[ base + toInt( *pi ) ];
									float v_jj = m_values[ toInt(*pj) * m_num_lits + toInt(*pj) ];
									if ( v_ii < infty && v_jj < infty ) {
										int i = index( *pi, *pj );
										if ( i != pair_index && i != symmetric_index(pair_index) ) {
											notify_update( i );
											#ifdef DEBUG
											if ( m_verbose_computation ) {
												out << "\t\tRequesting update as NOOP of: ";
												print_pair( i, out );
												out << std::endl;
											}
											#endif
										}
									}
								}
							}
						}
						continue;
					}
					#ifdef DEBUG
					if ( m_verbose_computation && !r->reachable() )
						out << "\tRule head fluents still unreachable" << std::endl;
					#endif
					continue;
				}
			
				#ifdef DEBUG
				if ( m_verbose_computation ) {
					out << "Rule has been fired! " << std::endl;
					r->write( out, m_model );
					out << std::endl;
				}
				#endif

				m_rules_fired++;

				float absdiff = (r->m_value != infty ? fabs( r->m_value - new_value ) : 1e7 );
				float diff = ( r->m_value != infty ? r->m_value - new_value  : 1e7 );
				#ifdef DEBUG
				if (m_verbose_computation)
					out << "Old rule value: " << r->m_value << " new value: " << new_value << " abs. diff: " << absdiff << std::endl;
				#endif
				
				if ( t->is_noop() ) { // it's a noop

					#ifdef DEBUG
					if ( m_verbose_computation ) {
						out << "Processed pair ";
						print_pair( pair_index, out );
						out << "is NOOP for rule " << std::endl;
					}
					#endif

					r->m_value = new_value;
					
					// no-op implicit rules
					m_noop_checks++;
					assert( t->noop_idx() != -1 );
					
					Lit l_noop = ( t->noop_idx() == 1 ? toLit(first_pair_idx) : toLit( second_pair_idx) );
					int noop_idx = toInt(l_noop);
					assert( r->m_noop_mask.isset( toInt( l_noop ) ) );
					
					int base = noop_idx * m_num_lits;
					float v_noop = m_values[ base + noop_idx ];
					v_noop = std::max( v_noop, r->m_value );
					for ( const Lit& cond : r->m_condition )
						v_noop = std::max( v_noop, m_values[ base + toInt(cond) ] );

					#ifdef DEBUG
					if ( m_verbose_computation )
						out << "Value of rule condition & noop is: " << v_noop << std::endl;
					#endif					

					if ( v_noop < infty ) {
					
						v_noop += r->m_action->cost;
						#ifdef DEBUG
						if ( m_verbose_computation )
							out << "\tPotential value updates (noop & effects) : " << std::endl;
						#endif
						for ( const Lit& eff_it : r->m_effect ) {
							assert( eff_it != ~l_noop );
							int i = index( eff_it, l_noop );
							#ifdef DEBUG
							if ( m_verbose_computation ) {
								out << "\t\tNew value for ";
								print_pair( i, out );
								out << " is " << v_noop << " current is " << m_values[i] << std::endl;
							}
							#endif
							if ( update_value( i, v_noop ) ) {
								#ifdef DEBUG
								if ( m_verbose_computation ) {
									out << "\t\t\t UPDATED:" << std::endl;
									out << "\t\t\t ";
									print_pair( i, out );
									out << " <- " << m_values[i] << std::endl;
									out << "\t\t\t ";
									print_pair( symmetric_index( i ), out );
									out << " <- " << m_values[ symmetric_index( i ) ] << std::endl;
								}
								#endif
								notify_update( i );
							}
						}

						#ifdef DEBUG
						if ( m_verbose_computation )
							out << "\tPotential value updates (noop & prevail) : " << std::endl;
						#endif

						for ( const Lit& cond_it : r->m_prevail ) {
							int i = index( cond_it, l_noop  );
							#ifdef DEBUG
							if ( m_verbose_computation ) {
								out << "\t\tNew value for ";
								print_pair( i, out );
								out << " is " << v_noop << " current is " << m_values[i] << std::endl;
							}
							#endif

							if ( update_value( i, v_noop ) ) {
								#ifdef DEBUG
								if ( m_verbose_computation ) {
									out << "\t\t\t UPDATED:" << std::endl;
									out << "\t\t\t ";
									print_pair( i, out );
									out << " <- " << m_values[i] << std::endl;
									out << "\t\t\t ";
									print_pair( symmetric_index( i ), out );
									out << " <- " << m_values[ symmetric_index( i ) ] << std::endl;
								}
								#endif

								notify_update( i );
							}
						}
					}
				}

				if ( absdiff < 1e-7 ) continue;
				
				assert( diff > 1e-7);
				r->m_value = new_value;
	
				float v = r->m_action->cost + r->m_value;
	
				#ifdef DEBUG
				if ( m_verbose_computation )
					out << "\tPotential value updates (effects) : " << std::endl;
				#endif

				for ( int eff_it : r->m_effects ) {
					#ifdef DEBUG
					if ( m_verbose_computation ) {
						out << "\t\tNew value for ";
						print_pair( eff_it, out );
						out << " is " << v << " current is " << m_values[eff_it] << std::endl;
					}
					#endif

					if ( update_value( eff_it, v ) ) {
						#ifdef DEBUG
						if ( m_verbose_computation ) {
							out << "\t\t\t UPDATED:" << std::endl;
							out << "\t\t\t ";
							print_pair( eff_it, out );
							out << " <- " << m_values[eff_it] << std::endl;
							out << "\t\t\t ";
							print_pair( symmetric_index( eff_it ), out );
							out << " <- " << m_values[ symmetric_index( eff_it ) ] << std::endl;
						}
						#endif

						notify_update( eff_it );
					}
				}

				// no-ops due to preconditions being preserved
				#ifdef DEBUG
				if ( m_verbose_computation )
					out << "\tPotential value updates (prevail & effects) : " << std::endl;
				#endif

				for ( const Lit& cond_it : r->m_prevail ) {
					for ( const Lit& eff_it : r->m_effect ) {
						m_noop_checks++;
						int i = index( cond_it, eff_it  );
						#ifdef DEBUG
						if ( m_verbose_computation ) {
							out << "\t\tNew value for ";
							print_pair( i, out );
							out << " is " << v << " current is " << m_values[i] << std::endl;
						}
						#endif

						if ( update_value( i, v ) ) {
							#ifdef DEBUG
							if ( m_verbose_computation ) {
								out << "\t\t\t UPDATED:" << std::endl;
								out << "\t\t\t ";
								print_pair( i, out );
								out << " <- " << m_values[i] << std::endl;
								out << "\t\t\t ";
								print_pair( symmetric_index( i ), out );
								out << " <- " << m_values[ symmetric_index( i ) ] << std::endl;
							}
							#endif

							notify_update( i );
						}
					}

				}
				/*
				for ( int noop_idx = 0; noop_idx < m_num_lits; noop_idx++ ) {
					Lit l_noop = toLit( noop_idx );
					if ( !r->m_noop_mask.isset( noop_idx ) ) continue;

					int base = noop_idx * m_num_lits;
					float v_l = m_values[ base + noop_idx ];
					if ( v_l == infty ) continue; 
					m_noop_checks++;
					float v_noop = r->m_value;
					v_noop = std::max( v_noop, v_l );
					for ( const Lit& cond_it : r->m_condition )
						v_noop = std::max( v_noop, m_values[ base + toInt(cond_it) ] );
					if ( v_noop == infty ) continue;
					v_noop += r->m_action->cost;
					for ( const Lit& eff_it : r->m_effect ) {
						int i = index( eff_it, l_noop );
						if ( update_value( i, v_noop ) ) {
							notify_update( i );
						}
					}	
				} 
				*/
			}
		}
	}

	void
	Rule_Based_H2_Heuristic::extract_consequences_table() {
		for ( int i = 0; i < m_num_lits; i++ ) {
			for ( int j = 0; j < m_num_lits; j++ ) {
				if ( i == j ) continue;
				if ( m_values[ index(i,j) ] < infty ) continue;
				Lit lj = ~ toLit( j );
				assert( atom(lj) < (int)m_model.n_atoms() );
				if ( std::find( m_consequences[i].begin(), m_consequences[i].end(), lj )
					!=  m_consequences[i].end() )
					continue;
				m_consequences[i].push_back( lj );

			}
		} 
	}

	void
	Rule_Based_H2_Heuristic::print_consequences( std::ostream& os ) const {
		for ( int i = 0; i < (int)Clause::num_lits(); i++ ) {
			Clause tmp;
			tmp.add( toLit( i ) );
			for ( Lit l : m_consequences[i] ) {
				tmp.add( l );
			}
			tmp.write( os, m_model );
			os << std::endl;
		}
	}

	void
	Rule_Based_H2_Heuristic::print( std::ostream& os ) const {
		for ( int i = 0; i < (int)Clause::num_lits(); i++ ) {
			Lit pi = toLit(i);
			Atom idx = atom( pi );
			assert( idx < (int)m_model.n_atoms() );
			const FOD_Problem::Atom& ai = *(m_model.atoms[idx]);
			for ( int j = 0; j < (int)Clause::num_lits(); j++ ) { 
				Lit pj = toLit(j);
				idx = atom(pj);
				assert( idx < (int)m_model.n_atoms() );
				const FOD_Problem::Atom& aj = *(m_model.atoms[idx]);
				if ( sign(pi) )
					os << "(not (" << ai.name <<  "))";
				else
					os << "(" << ai.name << ")";
				os << ",";
				if ( sign(pj) )
					os << "(not (" << aj.name << "))";
				else
					os << "(" << aj.name << ")";
				os << "," << value( pi, pj ) << std::endl;

			}
		}
		
	}

}
