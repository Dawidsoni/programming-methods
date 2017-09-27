#include <stdio.h>
#include <stdlib.h>
#include "z3.h"

Complex* createComplex(double real, double imag) {
  Complex* result = malloc(sizeof(Complex));
  result->real = real;
  result->imag = imag;
  return result;
}

void addComplexInPlace(Complex* n1, Complex* n2) {
  n2->real += n1->real;
  n2->imag += n1->imag;
}

void subComplexInPlace(Complex* n1, Complex* n2) {
  n2->real = n1->real - n2->real;
  n2->imag = n1->imag - n2->imag;
}

void mulComplexInPlace(Complex* n1, Complex* n2) {
  double real = n1->real * n2->real - n1->imag * n2->imag;
  double imag = n1->imag * n2->real + n1->real * n2->imag;
  n2->real = real;
  n2->imag = imag;
}

void divComplexInPlace(Complex* n1, Complex* n2) {
  double den = n2->real * n2->real + n2->imag * n2->imag;
  double real = (n1->real * n2->real + n1->imag * n2->imag) / den;
  double imag = (n1->imag * n2->real - n1->real * n2->imag) / den;
  n2->real = real;
  n2->imag = imag;
}

Complex* addComplex(Complex* n1, Complex* n2) {
  Complex* result = createComplex(n2->real, n2->imag);
  addComplexInPlace(n1, result);
  return result;
}

Complex* subComplex(Complex* n1, Complex* n2) {
  Complex* result = createComplex(n2->real, n2->imag);
  subComplexInPlace(n1, result);
  return result;
}

Complex* mulComplex(Complex* n1, Complex* n2) {
  Complex* result = createComplex(n2->real, n2->imag);
  mulComplexInPlace(n1, result);
  return result;
}

Complex* divComplex(Complex* n1, Complex* n2) {
  Complex* result = createComplex(n2->real, n2->imag);
  divComplexInPlace(n1, result);
  return result;
}
