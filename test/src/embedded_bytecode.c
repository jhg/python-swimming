#include <Python.h>

int main (int argc, char *argv[])
  {
    Py_Initialize ();
    FILE* file_1 = fopen ("embedded_bytecode.pyc", "r");
    PyRun_SimpleFile (file_1, "embedded_bytecode.pyc");
    fclose (file_1);
    Py_Finalize ();
    return 0;
  }

