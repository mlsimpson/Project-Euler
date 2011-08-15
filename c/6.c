/*
 * =====================================================================================
 *
 *       Filename:  6.c
 *
 *    Description:  Problem 6
 *
 *        Version:  1.0
 *        Created:  08/15/2011 17:12:52
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

int main(int argc, const char *argv[])
{
  int max = 100;

  int sumsqrs = ((2*max+1)*(max+1)*max)/6;
  int sqrsums = pow((0.5*max*(max+1)), 2);

  int result = sqrsums - sumsqrs;

  printf("The difference between square of sum and sum of squares up to %d is %d.\n", max, result);
  return 0;
}
