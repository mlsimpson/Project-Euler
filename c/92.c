/*
 * =====================================================================================
 *
 *       Filename:  92.cpp
 *
 *    Description:  yeah
 *
 *        Version:  1.0
 *        Created:  08/19/2011 21:56:29
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Matt Simpson (Maui Threv), mr.threv@gmail.com
 *        Company:
 *
 * =====================================================================================
 */

#include <stdio.h>

int next(int n)
{
  int result = 0;
  while ( n )
    result += (n%10)*(n%10), n /= 10;
  return result;
}

int main()
{
  int result = 0;
  int start = 1;
  for ( start; start < 10000000; ++start )
  {
    int curr = start;
    while ( curr != 1 && curr != 89 )
      curr = next(curr);
    result += curr == 89;
  }
  printf("%d\n", result);
  return 0;
}
