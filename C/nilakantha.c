#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void nilakantha(int m) {
  long double actual_pi = 3.141592653589793238462643383279502884197169399375105820974;
  long double one_fourth_pi = 0, pi = 0;
  int n = 0;

  while(fabs(pi+3 - actual_pi) > pow(10,-m)) {
    for(int i = 0; i < n + 1; i++) {
      one_fourth_pi += pow(-1,i) / (pow(2*i+3,3) - (2*i+3));
    }

    one_fourth_pi += 3/4;
    pi = one_fourth_pi * 4;
    one_fourth_pi = 0;
    ++n;
  }

  printf("number of trials: %d", n);
}


int main(void) {

  int m=0, n=0;
  
  printf("Enter a precision to calculate pi at: ");
  scanf("%d", &m);
  printf("Enter the number of trials: ");
  scanf("%d", &n);
  printf("\n m: %d n: %d", m,n);

  nilakantha(m);

  return 0;
}
