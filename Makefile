# Makefile for source rpm: java-1.8.0-oracle
NAME := java-1.8.0-oracle
SPECFILE = $(firstword $(wildcard *.spec))

define find-makefile-common
for d in common ../common ../../common ../../../common ../../../../common ; do if [ -f $$d/trunk/Makefile.common ] ; then if [ -f $$d/trunk/.svn -a -w $$/Makefile.common ] ; then cd $$d/trunk ; svn update --quiet ; fi ; echo "$$d/trunk/Makefile.common" ; break ; fi ; done
endef

MAKEFILE_COMMON := $(shell $(find-makefile-common))

include $(MAKEFILE_COMMON)
