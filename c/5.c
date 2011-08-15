/*
 * =====================================================================================
 *
 *       Filename:  5.c
 *
 *    Description:  Problem 5
 *
 *        Version:  1.0
 *        Created:  08/15/2011 16:49:32
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Matt Simpson (Maui Threv), mr.threv@gmail.com
 *        Company:
 *
 * =====================================================================================
 */

#include <stdlib.h>
#include <stdio.h>

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  gcd
 *  Description:  Greatest Common Divisor
 * =====================================================================================
 */
int gcd (int x, int y )
{
  int t = 0;
  while ( y != 0 ) {
    t = y;
    y = (x%y);
    x = t;
  }
  return x;
}

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  lcm
 *  Description:  Least Common Multiple
 * =====================================================================================
 */
double lcm ( int x, int y )
{
  return (x * y) / gcd(x, y);
}		/* -----  end of function lcm  ----- */

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 *  Description:
 * =====================================================================================
 */
int main ( int argc, char *argv[] )
{
  int i = 1;
  double result = 1;
  int max = 20;

  for (i = 1; i < max; i++) {
    result = lcm(i, result);
    printf ("%d, %.0f\n", i, result);
  }

  printf("The smallest positive number that is evenly divisible by all integers from 1 to %d is %.0f.\n", max, result);
  return EXIT_SUCCESS;
}
