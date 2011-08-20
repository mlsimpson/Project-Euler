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

