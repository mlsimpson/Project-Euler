/*
 * =====================================================================================
 *
 *       Filename:  7.c
 *
 *    Description:  Problem 7
 *
 *        Version:  1.0
 *        Created:  08/15/2011 17:20:16
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
#include <stdbool.h>

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  isprime
 *  Description:
 * =====================================================================================
 */
int isprime ( int i )
{
  int r = 0;
  int f = 5;

  if (i <= 1) {
    return false;
  } else if (i < 4) {
    return true;
  } else if (i%2 == 0) {
    return false;
  } else if (i < 9) {
    return true;
  } else if (i%3 == 0) {
    return false;
  } else {
    r = floor(sqrt(i));
    while (f <= r) {
      if (i%f == 0) {
        return false;
      }
      if (i%(f+2) == 0) {
        return false;
      }
      f += 6;
    }
    return true;
  }
}

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 *  Description:
 * =====================================================================================
 */
int main ( int argc, char *argv[] )
{
  int num = 10001;

  int count = 1;
  int a = 1;

  while (count != num) {
    a += 2;
    if (isprime(a)) {
      count += 1;
    }
  }

  printf("The %d prime number is %d\n", num, a);
  return 0;
}
