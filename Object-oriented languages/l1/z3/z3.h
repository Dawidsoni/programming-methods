
typedef struct {
  double real, imag;
} Complex;

Complex* createComplex(double real, double imag);

void addComplexInPlace(Complex* n1, Complex* n2);
void subComplexInPlace(Complex* n1, Complex* n2);
void mulComplexInPlace(Complex* n1, Complex* n2);
void divComplexInPlace(Complex* n1, Complex* n2);

Complex* addComplex(Complex* n1, Complex* n2);
Complex* subComplex(Complex* n1, Complex* n2);
Complex* mulComplex(Complex* n1, Complex* n2);
Complex* divComplex(Complex* n1, Complex* n2);
