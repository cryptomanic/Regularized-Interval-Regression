void qsort(double* A, int* f, int* l){
  if(f[0] >= l[0]) {
    return ;
  }
  
  int i = 0,j = 0;
  i = j = f[0] + 1;
  
  for( ;j <= l[0];j++) {
    if(A[j] < A[f[0]]) {
      double temp = A[i];
      A[i] = A[j];
      A[j] = temp;  		
      i++;					
    }
  }
  
  double temp = A[f[0]];
  A[f[0]] = A[i-1];
  A[i-1] = temp;  		

  int f1[1] = {i-2};
  int f2[1] = {i};

  qsort(A, f, f1);
  qsort(A, f2, l);
}
