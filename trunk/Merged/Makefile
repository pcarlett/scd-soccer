##############################################################################
# Purpose: Makefile for all storage related projects
##############################################################################

# The subdirectories of the project
subdirs = . Commons Events Games Programs Remotes Tasks Visor
INCLUDE_DIRS = $(subdirs:%=-I./%) 

### Directives for concurrent with Gtk+
####################################################
OS := $(shell uname)
OBJ = build
TARGET = Game.adb
RENAME = install_name_tool
GNATMAKE = gnatmake -D $(OBJ)
CARGS = -cargs -O3 -gnatp -gnatwu
BARGS = -bargs
LARGS = -largs
VERBOSE = -v
SHARED = libgnat-4.3.dylib
ADA_LIB ?= /usr/local/ada-4.3/lib
.PHONEY: clean tar
####################################################

# The directives for compilation
GNATDIST = po_gnatdist
CONFIG_FILE = Dist_Soccer.cfg

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
	
compile: $(OBJ)
compile: INCLUDE = $(shell gtkada-config --static --cflags)
compile: BARGS += -static
compile: LARGS += $(shell gtkada-config --static --libs)
compile: LARGS += -dead_strip
compile: *.ad[sb]
	$(GNATMAKE) -g $(INCLUDE_DIRS) $(TARGET) $(INCLUDE) $(CARGS) $(BARGS) $(LARGS) 

distr:
	$(GNATDIST) -g $(INCLUDE_DIRS) $(CONFIG_FILE)

$(OBJ):
	mkdir $(OBJ)

queue:
	@./bin/queue_partition
	
server:
	@./bin/server_partition
	
client:
	@./bin/client1_partition

clean :
	@-rm -rf dsa/ bin/ build/
	@-rm -f *.o *.ali core *~ b~* game
	@-for dir in $(subdirs); do \
	   echo Making clean in $$dir; \
	   (cd $$dir; rm -f *.o *.ali core *~ b~*); \
	done
	
tar: clean
	tar --exclude '.git' -zcvf ../archive/dist_soccer.tgz *
