/*
 * =====================================================================================
 *
 *       Filename:  58.c
 *
 *    Description:  Problem 58
 *
 *        Version:  1.0
 *        Created:  08/19/2011 22:42:15
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
int isprime ( unsigned int i )
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

int main(int argc, const char *argv[])
{
  int layer = 1;
  int sidelength = 3;
  unsigned int num = 1;
  float numdiags = 5;
  float numprimes = 0;
  float kill = 0.1;
  int i;

  while (1) {
    i = 0;
    while (i < 4) {
      num += layer *2;
      if (isprime(num)) {
        numprimes += 1;
      }
      i += 1;
    }
    // printf("numprimes / numdiags = %f\n", numprimes / numdiags);
    if (numprimes / numdiags < kill) {
      // printf("Breakin' 2, Electric Boogaloo\n");
      break;
    }
    sidelength += 2;
    layer += 1;
    numdiags += 4;
  }

  printf("numprimes = %d, numdiags = %d, num = %d\n", (int)numprimes, (int)numdiags, num);
  printf("sidelength = %d\n", sidelength);
  return 0;
}
