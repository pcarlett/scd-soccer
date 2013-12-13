##############################################################################
# Purpose: Makefile for all storage related projects
##############################################################################

SHELL = /bin/sh

# otherdirs = Storage Streams Persistence Lock Transactions Memory Operations Recovery Utilities
subdirs = . Server Server/Objects Server/Tasks Client # Client/Auctions Client/User Client/Login
# subdirs = . Server Server/Interfaces Server/Objects Server/Tasks Server/Debug \
#           Client Client/Auctions Client/User Client/Login

# The subdirectories of the project

CC       = gcc
GNATMAKE = gnatmake
GNATDIST = po_gnatdist
GFLAGS   = -g -gnata -gnatf
LINKER_FLAGS = -t
CONFIG_FILE = Dist_Soccer.cfg
GTKADA_CONFIG = `gtkada-config`

INCLUDE_DIRS = $(subdirs:%=-I./%) 
# $(otherdirs:%=-I../%)
# defines the include directories

all: glade
	
.PHONY : all

glade:
	$(GNATDIST) $(GFLAGS) $(INCLUDE_DIRS) $(CONFIG_FILE) $(GTKADA_CONFIG) -largs $(LINKER_FLAGS)
.PHONY : glade

clean :
	@-rm -rf dsa/ bin/
	@-rm -f *.o *.ali core *~ b~*
	@-for dir in $(subdirs); do \
	   echo Making clean in $$dir; \
	   (cd $$dir; rm -f *.o *.ali core *~ b~*); \
	done
.PHONY : clean





