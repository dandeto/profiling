#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

double nilakantha(int m) {
  long double actual_pi = 3.141592653589793238462643383279502884197169399375105820974;
  long double one_fourth_pi = 0, pi = 0;
  int n = 0;

  clock_t init = clock();


  while(fabs(pi+3 - actual_pi) > pow(10,-m)) {
    for(int i = 0; i < n + 1; i++) {
      one_fourth_pi += pow(-1,i) / (pow(2*i+3,3) - (2*i+3));
    }

    one_fourth_pi += 3/4;
    pi = one_fourth_pi * 4;
    one_fourth_pi = 0;
    ++n;
  }

  clock_t end = clock();

  return (end-init)/(double)CLOCKS_PER_SEC * 1000; //seconds to miliseconds
}


int main(void) {

  int m=0, n=0;
  
  printf("Enter a precision to calculate pi at: ");
  scanf("%d", &m);
  printf("\nEnter the number of trials: ");
  scanf("%d", &n);

  double arr[200];//be careful lol

  for (int i = 0; i < n; ++i) {
    arr[i] = nilakantha(m);
  }

  double sum = 0.0;

  for (int i = 0; i < n; ++i) {
    sum += arr[i];
  }

  double average = sum/n;

  FILE *file;
  file = fopen("out.part", "a");
  fprintf(file, "Average time to compute to a precision of %d with %d trials: %.2fms\n", m, n, average);
  fclose(file);

  printf("\nAverage time to compute to a precision of %d with %d trials: %.2fms\n", m, n, average);

  return 0;
}
