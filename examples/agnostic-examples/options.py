import getopt
import os
import sys
import glob

class PlannerOptions :

	def __init__( self, args ) :
		try:
			opts, args = getopt.getopt(	args,
							"P:d:p:ht:m:",
							["planner=",
							"domain=",
							"problem=",
							"help",
							"max-time=",
							"max-memory=" ] )
		except getopt.GetoptError :
			print >> sys.stderr, "Missing or incorrect parameters specified!"
			self.usage()
			sys.exit(1)

		self.planner = None
		self.domain = None
		self.problem = None
		self.planner = None	
		self.max_time = 1800
		self.max_memory = 1024

		for opcode, oparg in opts :
			if opcode in ( '-h', '--help' ) :
				print >> sys.stderr, "Help invoked!"
				self.usage()
				sys.exit(0)
			elif opcode in ( '-P', '--planner' ) :
				self.planner = os.path.abspath(os.path.join( oparg, 'planner' ))
				if not os.path.exists( self.planner ) :
					print >> sys.stderr, "Folder %s does not contain a planner binary"%oparg
					print >> sys.stderr, "Aborting"
					sys.exit(1)
			elif opcode in ( '-d', '--domain' ) :
				self.domain = oparg
				if not os.path.exists( self.domain ) :
					print >> sys.stderr, "File", self.domain, "does not exist"
					print >> sys.stderr, "Aborting"
					sys.exit(1)
			elif opcode in ('-p', '--problem' ) :
				self.problem = oparg
				if not os.path.exists( self.problem ) :
					print >> sys.stderr, "File", self.problem, "does not exist"
					print >> sys.stderr, "Aborting"
					sys.exit(1)
			elif opcode in ('-t', '--max-time' ) :
				try :
					self.max_time = int(oparg)
					if self.max_time <= 0 :
						print >> sys.stderr, "Maximum time must be greater than zero"
						sys.exit(1)
				except ValueError :
					print >> sys.stderr, "Time must be an integer"
					sys.exit(1)
			elif opcode in ('-m', '--max-memory' ) :
				try :
					self.max_memory = int(oparg)
					if self.max_memory <= 0 :
						print >> sys.stderr, "Maximum memory must be greater than zero"
						sys.exit(1)
				except ValueError :
					print >> sys.stderr, "Memory amount must be an integer"
					sys.exit(1)

		if self.planner is None :
			print >> sys.stderr, "No planner was specified!"
			self.usage()
			sys.exit(1)

		if self.domain is None :
			print >> sys.stderr, "No domain was specified!"
			self.usage()
			sys.exit(1)
	
		if self.problem is None :
			print >> sys.stderr, "No problem was specified!"
			self.usage()
			sys.exit(1)

	def usage( self ) :
		print >> sys.stderr, "Parameters:"
		print >> sys.stderr, "-P  --planner    <file>              Folder containing planner binary (binary must be called 'planner')"
		print >> sys.stderr, "-d  --domain     <file>              Planning problem domain definition in PDDL"
		print >> sys.stderr, "-p  --problem    <file>              Planning problem domain definition in PDDL"
		print >> sys.stderr, "-h  --help                           Get Help"
		print >> sys.stderr, "-t  --max-time   <time>              Maximum allowed execution time (defaults to 1800 secs)"
		print >> sys.stderr, "-m  --max-memory <time>              Maximum allowed memory consumption (defaults to 1Gb)"
		
	def print_options( self ) :
		def print_yes() : print >> sys.stdout, "Yes"
		def print_no() : print >> sys.stdout, "No"
		
		print >> sys.stdout, "Options set"
		print >> sys.stdout, "==========="
                print >> sys.stdout, "Arguments: ", self.args
		print >> sys.stdout, "Max. Time Allowed", self.max_time
		print >> sys.stdout, "Max. Memory Allowed", self.max_memory
		print >> sys.stdout, "Planner:", self.planner
		print >> sys.stdout, "Domain:", self.domain
		print >> sys.stdout, "Problem:", self.problem
