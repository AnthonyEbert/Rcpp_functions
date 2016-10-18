

library(Rcpp)
library(microbenchmark)

cppFunction('double stepfun_c(NumericVector x, NumericVector y, double z) {
  int n = x.size();
  for( int a = 0; a < n; ++a ) 
  {
      if (z <= x[a]) {
          double output = y[a];
          return output; 
      }
  }
  double output = y[n];
  return output;
  }')

