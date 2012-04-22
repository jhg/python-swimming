
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
	cd ./test && $(RM) -f *.bin *.pyc *.so *.py

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

