

/*********************************************************************
 * (C) Copyright 2002 Albert Ludwigs University Freiburg
 *     Institute of Computer Science
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 * 
 *********************************************************************/




/*
 * THIS SOURCE CODE IS SUPPLIED  ``AS IS'' WITHOUT WARRANTY OF ANY KIND, 
 * AND ITS AUTHOR AND THE JOURNAL OF ARTIFICIAL INTELLIGENCE RESEARCH 
 * (JAIR) AND JAIR'S PUBLISHERS AND DISTRIBUTORS, DISCLAIM ANY AND ALL 
 * WARRANTIES, INCLUDING BUT NOT LIMITED TO ANY IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, AND
 * ANY WARRANTIES OR NON INFRINGEMENT.  THE USER ASSUMES ALL LIABILITY AND
 * RESPONSIBILITY FOR USE OF THIS SOURCE CODE, AND NEITHER THE AUTHOR NOR
 * JAIR, NOR JAIR'S PUBLISHERS AND DISTRIBUTORS, WILL BE LIABLE FOR 
 * DAMAGES OF ANY KIND RESULTING FROM ITS USE.  Without limiting the 
 * generality of the foregoing, neither the author, nor JAIR, nor JAIR's
 * publishers and distributors, warrant that the Source Code will be 
 * error-free, will operate without interruption, or will meet the needs 
 * of the user.
 */










/*********************************************************************
 *
 * File: search.h
 *
 * Description: headers of routines that search the state space
 *
 *              ADL version, Enforced Hill-climbing enhanced with
 *                           Goal-adders deletion heuristic
 *
 * Author: Joerg Hoffmann 2000
 *
 *********************************************************************/ 






#ifndef _SEARCH_H
#define _SEARCH_H



Bool do_enforced_hill_climbing( void );



Bool search_for_better_state( State *S, int h, State *S_, int *h_ );
void add_to_ehc_space( State *S, int op, EhcNode *father );
int expand_first_node( int h );



void hash_ehc_node( EhcNode *n );
Bool ehc_state_hashed( State *S );
Bool superior_ehc_state_hashed( State *S );
Bool superior_state( State *S1, State *S2 );
void reset_ehc_hash_entrys( void );



void extract_plan_fragment( State *S );
PlanHashEntry *hash_plan_state( State *S, int step );
PlanHashEntry *plan_state_hashed( State *S );
Bool same_state( State *S1, State *S2 );



Bool do_best_first_search( void );
void add_to_bfs_space( State *S, int op, BfsNode *father );
float state_cost( State *S, BfsNode *father );
void extract_plan( BfsNode *last );



void hash_bfs_node( BfsNode *n );
Bool bfs_state_hashed( State *S );
Bool superior_bfs_state_hashed( State *S );
int state_sum( State *S );



Bool result_to_dest( State *dest, State *source, int op );
Bool determine_source_val( State *source, int fl, float *val );
void copy_source_to_dest( State *dest, State *source );
void source_to_dest( State *dest, State *source );



#endif /* _SEARCH_H */
