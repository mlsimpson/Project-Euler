/*
 * =====================================================================================
 *
 *       Filename:  12.c
 *
 *    Description:  Problem 12
 *
 *        Version:  1.0
 *        Created:  08/21/2011 23:27:29
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

/*
 * ===  FUNCTION  ======================================================================
 *         Name:  main
 *  Description:
 * =====================================================================================
 */
int main ( int argc, char *argv[] )
{
  int testfactors = 500; // Number of factors of a triangle number to test
  int primesize = 0; // Length of primes array
  int numprimes = 100000; // Number of primes to calculate in sieve
  int n = 3; // Base for calculating nth triangle number
  int m = 0; // Index for sweeping through primes array
  int x = 0; // Index for exponents array
  int z = 0; // Index for factors array
  int numexponents = 0; // Number of total exponents through equation
  int tri = 0; // Triangle number
  int tritest = 0; // Copy of triangle number
  int expcount = 0; // Number of exponents per prime
  int i = 0; // For loop indexing
  int oldprime = 0; // For testing Factors

  int* factors; // Array of factors for each triangle number
  int* exponents; // Array of exponents for each factor
  int* primes = sieve(numprimes, &primesize); // Array of primes up to numprimes
  if (primes == NULL) {
    printf("Could not allocate memory for primes, exiting.\n");
    return EXIT_FAILURE;
  }

  while (numexponents < testfactors) {

    numexponents = 1;

    tri = n*(n+1)/2;
    tritest = tri;

    expcount = 0;
    m = 0;
    x = 0;
    z = 0;

    oldprime = 0;

    factors = calloc(10, sizeof(int));
    if (factors == NULL) {
      printf("Could not allocate memory for factors[]\n");
      return EXIT_FAILURE;
    }
    exponents = calloc(10, sizeof(int));
    if (exponents == NULL) {
      printf("Could not allocate memory for exponents[]\n");
      return EXIT_FAILURE;
    }

    while (tritest > 1) {
      if (tritest % primes[m] == 0) {
        if (oldprime != primes[m]) {
          factors[z] = primes[m];
          z++;
        }
        expcount++;
        tritest /= primes[m];
        oldprime = primes[m];
        if (tritest == 1) {
          exponents[x] = expcount;
          x++;
        }
      } else {
        if (expcount > 0) {
          exponents[x] = expcount;
          x++;
        }
        expcount = 0;
        m++;
      }
    }

    // printf("Current triangle number:  %d\n", tri);
    // for (i = 0; i < x; i++) {
    //   printf("Factor:  %d, Exponent:  %d\n", factors[i], exponents[i]);
    // }
    // printf("\n");

    // numexponents = exponents.map{|i| i += 1}.reduce(1, :*) # Add 1 to each exponent, then multiply them all together
    for (i = 0; i < x; i++) {
      numexponents *= exponents[i] + 1;
    }

    n++;
    free(factors);
    free(exponents);
  }

  printf("The first triangle number with more than %d factors is %d.\n", testfactors, tri);

  return EXIT_SUCCESS;
}
