/*
 * =====================================================================================
 *
 *       Filename:  sieve.c
 *
 *    Description:  Sieve of Eratosthenes
 *
 *        Version:  1.0
 *        Created:  08/20/2011 22:04:45
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
  int* result;
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

  result = malloc(count*sizeof(int));

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
  int limit = 1000000;
  int size = 0;

  int* placeholder = sieve(limit, &size);
  if (placeholder == NULL) {
    printf("Error:  Could not allocate memory.\n");
    return 0;
  }

  //int i = 0;

  //for (i = 0; i < size; i++) {
  //  printf("%d\n", placeholder[i]);
  //}
  free(placeholder);
  return 0;
}
