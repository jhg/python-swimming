#!/usr/bin/python
import sys
import py_compile

# Try create a bytecode (pyc) of first argument
try: py_compile.compile(sys.argv[1])
except: print 'ERROR: pass a python script as an argument'

