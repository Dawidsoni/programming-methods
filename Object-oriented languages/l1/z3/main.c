#include <stdio.h>
#include <stdlib.h>
#include "z3.c"

void printComplex(Complex* complex) {
  printf("real: %f, imag: %f\n", complex->real, complex->imag);
}

int main() {
  Complex* n1 = createComplex(1.0, 2.0);
  Complex* n2 = createComplex(3.0, 4.0);
  printComplex(addComplex(n1, n2));
  printComplex(subComplex(n1, n2));
  printComplex(mulComplex(n1, n2));
  printComplex(divComplex(n1, n2));
}
