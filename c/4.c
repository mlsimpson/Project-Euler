/*
 * =====================================================================================
 *
 *       Filename:  4.c
 *
 *    Description:  Problem 4
 *
 *        Version:  1.0
 *        Created:  08/15/2011 16:31:25
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Matt Simpson (Maui Threv), mr.threv@gmail.com
 *        Company:
 *
 * =====================================================================================
 */

#include <stdio.h>


/*
 * ===  FUNCTION  ======================================================================
 *         Name:  palindrome
 *  Description:  Determines if an integer is a palindrome
 *                http://www.cprogrammingreference.com/ShortNotes/ShortNote4.php
 * =====================================================================================
 */
int palindrome ( int number  )
{
  int isPalindrome = 0;
  int remainder = 0;
  int sum = 0;
  int temp = number;

  while (number > 0) {
    remainder = number % 10; // Gets last digit
    number /= 10; // Truncates last digit
    sum = sum * 10 + remainder; // Builds value of reversed number
  }

  if (sum == temp) {
    isPalindrome = 1;
  }
  return isPalindrome;
}

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 * =====================================================================================
 */
int main(int argc, const char *argv[])
{
  int a = 999;
  int b = 0;
  int deltab = 0;
  int result = 0;
  int max = 0;

  while (a >= 100) {
    if (a%11 == 0) {
      b = 999;
      deltab = 1;
    } else {
      b = 990;
      deltab = 11;
    }

    while (b >= a) {
      result = a*b;
      if (result <= max) {
        break;
      }
      if (palindrome(result) == 1) {
        max = result;
      }
      b = b - deltab;
    }
    a -= 1;
  }

  printf("%d is the largest palindrome made from 3 digit numbers.\n", max);
  return 0;
}
