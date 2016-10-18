
<!-- --- -->
<!-- output: html -->
<!-- bibliography: references.bib -->
<!-- --- -->
<!-- README.md is generated from README.Rmd. Please edit that file -->
\[ \]

Demonstration
=============

``` r
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

microbenchmark(stepfun_c(c(1,5), c(1, 6, 0), 2))
#> Unit: microseconds
#>                               expr   min    lq    mean median    uq    max
#>  stepfun_c(c(1, 5), c(1, 6, 0), 2) 1.635 1.782 2.74312 1.8925 2.047 30.953
#>  neval
#>    100
microbenchmark(stepfun(c(1,5), c(1, 6, 0))(2))
#> Unit: microseconds
#>                             expr    min     lq     mean  median      uq
#>  stepfun(c(1, 5), c(1, 6, 0))(2) 47.781 49.361 59.75655 50.4565 58.0685
#>      max neval
#>  659.705   100
```
