#!/usr/bin/python

##########################################################################
## Python script to convert the python scripts to bytecode.             ##
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

import sys
import py_compile

if __name__=='__main__':
    # Try create a bytecode (pyc) of first argument (only of first)
    try: py_compile.compile(sys.argv[1])
    except: print 'ERROR: pass a python script as an argument'
else:
    print 'ERROR: Use generate_bytecode as script not is a module'

