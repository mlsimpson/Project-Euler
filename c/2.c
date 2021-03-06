/*
 * =====================================================================================
 *
 *       Filename:  2.c
 *
 *    Description:  Problem 2
 *
 *        Version:  1.0
 *        Created:  08/13/2011 07:25:58
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Matt Simpson (Maui Threv), mr.threv@gmail.com
 *        Company:
 *
 * =====================================================================================
 */

#include <stdio.h>

/* Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
 *
 * 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 *
 * By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
 */
int main(int argc, const char *argv[])
{
  int x = 1;
  int y = 1;
  int t = 0;
  int sum = 0;

  while ( sum < 4000000 )
  {
    sum = sum + (x + y);
    t = x;
    x = x + 2*y;
    y = 2*t + 3*y;
  }

  printf("The sum of even-valued terms in the Fibonacci sequence whose values do not exceed four million is %d.\n", sum);

  return 0;
}
