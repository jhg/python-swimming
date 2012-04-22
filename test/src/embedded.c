#include <Python.h>

int main (int argc, char *argv[])
  {
    Py_Initialize ();
    PyRun_SimpleString ("print '[OK] Embedded test'\n");
    Py_Finalize ();
    return 0;
  }

