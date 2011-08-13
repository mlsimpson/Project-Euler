/*
 * =====================================================================================
 *
 *       Filename:  1.c
 *
 *    Description:  Project Euler Problem 1
 *
 *        Version:  1.0
 *        Created:  08/13/2011 07:01:27
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Matt Simpson (Maui Threv), mr.threv@gmail.com
 *        Company:
 *
 * =====================================================================================
 */

#include <stdio.h>
#include <math.h>

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
}		/* -----  end of function gcd  ----- */


/*
 * ===  FUNCTION  ======================================================================
 *         Name:  lcm
 *  Description:  Least Common Multiple
 * =====================================================================================
 */
int lcm ( int x, int y )
{
  return (x * y) / gcd(x, y);
}		/* -----  end of function lcm  ----- */


/*
 * ===  FUNCTION  ======================================================================
 *         Name:  sumdivisiblebyn
 *  Description:  Returns the number of values up to max that are divisible by n.
 * =====================================================================================
 */
int sumdivisiblebyn ( int n, int max)
{
  int p = max / n;
  return n*(p*(p+1))/2;
}		/* -----  end of function sumdivisiblebyn  ----- */


/* If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
 * Find the sum of all the multiples of 3 or 5 below 1000.
 */
int main(int argc, const char *argv[])
{
  int x = 3;
  int y = 5;
  int xy = lcm(3, 5);
  int max = 999;

  int sum = sumdivisiblebyn(x, max) + sumdivisiblebyn(y, max) - sumdivisiblebyn(xy, max);

  printf("The sum of all multiples of %d or %d that are below %d is %d.\n", x, y, max, sum);

  return 0;
}
