##########################################################################
## Makefile to build the software.                                      ##
##                                                                      ##
## Python swimming Copyright (C) 2012 Jesús Hernández Gormaz            ##
## This program is free software; you can redistribute it and/or        ##
##  modify it under the terms of the GNU General Public License as      ##
##  published by the Free Software Foundation; either version 3, or     ##
##  (at your option) any later version.                                 ##
## This program is distributed in the hope that it will be useful,      ##
##  but WITHOUT ANY WARRANTY; without even the implied warranty of      ##
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the        ##
##  GNU General Public License for more details.                        ##
## You should have received a copy of the GNU General Public License    ##
##  along with this program; if not, write to the Free Software         ##
##  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.           ##
##########################################################################

## General configuration (plugin and tests) ##
export VPYTHON=2.7
export VGTK=2.0
export CC=gcc
export CFLAGS=-Wall -DXP_UNIX=1 -DMOZ_X11=1 -fPIC -g
export PYTHONAPI=/usr/include/python$(VPYTHON)/
export NPAPI=./npapi-sdk
export LDFLAGS=-Xlinker -export-dynamic -lpython$(VPYTHON) -Bsymbolic-functions
export GFLAGS=`pkg-config --cflags gtk+-$(VGTK)`
export RM=rm

## Specified configuration ##
SRCDIR=./src
DESTDIR=.

INCLUDES=-I$(PYTHONAPI) -I$(NPAPI)

## Plugin ##
all: pythonswimming.so

pythonswimming.so: main.so
	mv $^ $@

## Tests ##
test:
	$(MAKE) -C ./test/

testclean:
	$(MAKE) -C ./test/ testclean

## Rules ##
%.o: $(SRCDIR)/%.c
	$(CC) $(GFLAGS) $(CFLAGS) $(INCLUDES) -c $^ -o $@

%.so: %.o
	$(CC) $(CFLAGS) -shared $^ $(LDFLAGS) -o $@

%.pyc: %.py
	../src/generate_bytecode.py $^

## Other ##
.PHONY: clean all test testclean

.SILENT:

clean:
	$(RM) -f *.o *~ \#*
	cd $(SRCDIR) && $(RM) -f *.o *~ \#*
	$(MAKE) -C ./test/ clean

