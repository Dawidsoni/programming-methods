#include <stdio.h>
#include <stdlib.h>
#include "z1.c"

void insertTest(Collection* col) {
  colInsert(col, 2);
  colInsert(col, 1);
  colInsert(col, 2);
  colInsert(col, 3);
  colInsert(col, 4);
}

void colTest(Collection* col) {
  insertTest(col);
  printf("%d\n", colFind(col, 2));
  printf("%d\n", colFind(col, 5));
  printf("%d\n\n", colSize(col));
}

void setTest() {
  Collection col;
  makeSet(&col);
  colTest(&col);
}

void bagTest() {
  Collection col;
  makeBag(&col);
  colTest(&col);
}

int main() {
  setTest();
  bagTest();
}
