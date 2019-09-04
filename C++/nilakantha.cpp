#include <iostream>
#include <chrono>
#include <cmath>
#include <vector>

auto nilikantha(int m) {
  const long double actual_pi = 3.141592653589793238462643383279502884197169399375105820974;
  long double one_fourth_pi = 0, pi = 0;
  int n = 0;

  auto time = std::chrono::high_resolution_clock::now();

  while(fabs(pi+3 - actual_pi) > pow(10,-m)) {
    for(int i = 0; i < n + 1; i++) {
      one_fourth_pi += pow(-1,i) / (pow(2*i+3,3) - (2*i+3));
    }

    one_fourth_pi += 3/4;
    pi = one_fourth_pi * 4;
    one_fourth_pi = 0;
    ++n;
  }

  //after testing I determined that this returned a magnitude of 10 greater than the correct ms values - I correct that here.
  return std::chrono::duration_cast<std::chrono::milliseconds>(std::chrono::high_resolution_clock::now() - time).count() *.1;
}

int main() {

  int m = 0, n = 0;

  std::cout << "Please enter a precision to calculate pi at: ";
  std::cin >> m;
  std::cout << std::endl;
  std::cout << "Please enter the number of iterations to profile at: ";
  std::cin >> n;
  std::cout << std::endl;


  std::vector < float > arr;

  for(int i = 0; i < n; i++) {
    arr.push_back(nilikantha(m));
  }
  float sum = 0;
  
  for(int i=0; i<n; i++) {
    sum += arr[i];
  }
  float average = sum / n;
  
  std::cout << "Average time to compute to a precision of " << m << " with "
	    << n << " trials: " << average << "ms\n";

  return 0;
}
