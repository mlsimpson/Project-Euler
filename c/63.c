/*
 * =====================================================================================
 *
 *       Filename:  63.c
 *
 *    Description:  Project Euler 63 in C
 *
 *        Version:  1.0
 *        Created:  08/13/2011 05:24:52
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Matt Simpson (Maui Threv), mr.threv@gmail.com
 *        Company:
 *
 * =====================================================================================
 */

// Without Big Integer support (like GMP Bignum), the power value gets wrong.

#include <stdio.h>
#include <math.h>
// #include <gmp.h>

int main(int argc, const char *argv[])
{
  int i = 0;
  int nomore = 0;
  int runningtotal = 0;
  int total = 0;
  int ndigits = 0;
  int x = 1;
  double power = 0;
  // mpz_t power;
  // mpz_init(power);

  while (nomore == 0) {
    runningtotal = 0;
    for (i = 1; i < 10; i++) {
      power = pow(i, x);
      // mpz_pow(power, i, x);
      ndigits = floor(log10(power)) + 1;
      // ndigits = mpz_sizeinbase(power, 10);
      if (ndigits == x) {
        printf("%d^%d = %.0f\n", i, x, power);
        // gmp_printf("%Z\n", power);
        runningtotal += 1;
        total += 1;
      }
    }
    if (runningtotal == 0) {
      nomore = 1;
    }
    x += 1;
  }

  printf("The total is: %d.\n", total);
  return 0;
}
