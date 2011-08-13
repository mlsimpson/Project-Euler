/*
 * =====================================================================================
 *
 *       Filename:  3.c
 *
 *    Description:  Problem 3
 *
 *        Version:  1.0
 *        Created:  08/13/2011 18:25:47
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
#include <stdint.h>

int main(int argc, const char *argv[])
{
  int answer;
  int factor;
  uint64_t n = 600851475143;

  if (n%2 == 0) {
    answer = 2;
    n = (n / 2);
    while (n%2 == 0) {
      n = (n / 2);
    }
  } else {
    answer = 1;
  }

  factor = 3;

  answer = sqrt(n);
  while (n > 1 && factor <= answer) {
    if (n%factor == 0) {
      n = (n/factor);
      answer = factor;
      while (n%factor == 0) {
        n = (n/factor);
      }
      answer = sqrt(n);
    }
    factor += 2;
  }

  if (n==1) {
    printf("%d\n", answer);
  } else {
    printf("%llu\n", n);
  }

  return 0;
}
