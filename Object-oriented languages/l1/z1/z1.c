#include <stdio.h>
#include <stdlib.h>
#include "z1.h"

void makeCol(Collection* col) {
  col->elemCount = 0;
  col->colSize = 1;
  col->elemArr = malloc(col->colSize * sizeof(Elem));
}

void makeSet(Collection* col) {
  makeCol(col);
  col->colType = ColSet;
}

void makeBag(Collection* col) {
  makeCol(col);
  col->colType = ColBag;
}

int bagFind(Collection* col, Elem elem) {
  int result = 0;
  for(int i = 0; i < col->colSize; i++) {
    if(col->elemArr[i] == elem) {
      result++;
    }
  }
  return result;
}

int setFind(Collection* col, Elem elem) {
  for(int i = 0; i < col->colSize; i++) {
    if(col->elemArr[i] == elem) {
      return 1;
    }
  }
  return 0;
}

int colFind(Collection* col, Elem elem) {
  if(col->colType == ColBag) {
    return bagFind(col, elem);
  }else {
    return setFind(col, elem);
  }
}

void reallocIfFull(Collection* col) {
  if(col->elemCount < col->colSize) {
    return;
  }
  col->colSize *= 2;
  col->elemArr = realloc(col->elemArr, col->colSize);
}

void colInsert(Collection* col, Elem elem) {
  if(col->colType == ColSet && setFind(col, elem) > 0) {
    return;
  }
  col->elemArr[col->elemCount] = elem;
  col->elemCount += 1;
  reallocIfFull(col);
}

int colSize(Collection* col) {
  return col->elemCount;
}
