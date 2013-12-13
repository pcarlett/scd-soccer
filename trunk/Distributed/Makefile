##############################################################################
# Purpose: Makefile for all storage related projects
##############################################################################

# The subdirectories of the project
subdirs = . Events Tasks Commons Remotes Programs

# The directives for compilation
GNATMAKE = gnatmake
GNATDIST = po_gnatdist
SOURCE_FILE = Server.adb
CONFIG_FILE = Dist_Soccer.cfg

INCLUDE_DIRS = $(subdirs:%=-I./%) 

all: 
	@echo ""
	@echo "Use directives for compilation:"
	@echo "    compile: for non distributed system"
	@echo "    distr: for distributed system"
	@echo "    clean: cleans copilation files"
	@echo ""
	@echo "Use specific directiver to execute:"
	@echo "    queue: for queue program"
	@echo "    server: for server program"
	@echo "    client: for client program"
	@echo ""
	
	
compile:
	$(GNATMAKE) -g $(INCLUDE_DIRS) $(SOURCE_FILE)
	
distr:
	$(GNATDIST) -g $(INCLUDE_DIRS) $(CONFIG_FILE)

queue:
	@./bin/queue_partition
	
server:
	@./bin/server_partition
	
client:
	@./bin/client1_partition

clean :
	@-rm -rf dsa/ bin/
	@-rm -f *.o *.ali core *~ b~* server
	@-for dir in $(subdirs); do \
	   echo Making clean in $$dir; \
	   (cd $$dir; rm -f *.o *.ali core *~ b~*); \
	done
	
tar: clean
	tar --exclude '.git' -zcvf ../archive/dist_soccer.tgz *
