#!/usr/bin/python

import sys
import py_compile

if __name__=='__main__':
    # Try create a bytecode (pyc) of first argument (only of first)
    try: py_compile.compile(sys.argv[1])
    except: print 'ERROR: pass a python script as an argument'
else:
    print 'ERROR: Use generate_bytecode as script not is a module'

