/*
 * =====================================================================================
 *
 *       Filename:  10.c
 *
 *    Description:  Problem 10
 *
 *        Version:  1.0
 *        Created:  08/21/2011 02:47:40
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Matt Simpson (Maui Threv), mr.threv@gmail.com
 *        Company:
 *
 * =====================================================================================
 */

#include <stdio.h>
#include <stdlib.h>

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  sieve
 *  Description:  Sieve of Eratosthenes
 * =====================================================================================
 */
int* sieve ( int limit, int* size )
{
  int i = 0;
  int j = 0;
  int count = 0;
  int* array = malloc(limit*sizeof(int));

  if (array == NULL) {
    return NULL;
  }

  for (i = 0; i < limit; i++) {
    array[i] = i;
  }

  array[1] = 0;

  for (i = 0; i < limit; i++) {
    if (array[i] == 0) {
      continue;
    }
    if (i*i > limit) {
      break;
    }
    for (j = i*i; j < limit; j += i) {
      array[j] = 0;
    }
  }

  for (i = 0; i < limit; i++) {
    if (array[i] != 0) {
      count++;
    }
  }

  int* result = malloc(count*sizeof(int));

  if (result == NULL) {
    return NULL;
  }

  j = 0;
  for (i = 0; i < limit; i++) {
    if (array[i] != 0) {
      result[j] = array[i];
      j++;
    }
  }

  free(array);

  *size = count;

  return result;
}

int main(int argc, const char *argv[])
{
  int i = 0;
  long sum = 0;
  int size = 0;
  int limit = 2000000;

  int* primes = sieve(limit, &size);

  for (i = 0; i < size; i++) {
    sum += primes[i];
  }

  printf("The sum of all primes up to %d is %ld\n", limit, sum);
  return 0;
}
