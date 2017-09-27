typedef int Elem;

typedef enum {
  ColSet, ColBag
} CollectionType;

typedef struct {
  CollectionType colType;
  Elem* elemArr;
  int elemCount, colSize;
} Collection;

void makeSet(Collection* col);
void makeBag(Collection* col);
int bagFind(Collection* col, Elem elem);
int setFind(Collection* col, Elem elem);
int colFind(Collection* col, Elem elem);
void reallocIfFull(Collection* col);
void colInsert(Collection* col, Elem elem);
int colSize(Collection* col);
