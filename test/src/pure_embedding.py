#!/usr/bin/python
#-*- coding: UTF-8 -*-

def test(a,b):
    print "[OK] Running pure_embedding.py"
    print "      Arguments:     ", a, " and ", b
    c = a+b
    print "      Return:        ", a, "+", b, "=", c
    return c

if __name__=='__main__':
    print('     Ejecutado como programa')
else:
    print('     Ejecutado como modulo ' + __name__)

