##########################################################
## COP4610 – Principles of Operating Systems – Summer C 2015
## Prof. Jose F. Osorio
## Group: group name
## Group Members:       Robert Hertzbach – 2676397
##                      Matthew Saunders – 2403246
## Project: Multithreaded Programming
## Specs:
## Due Date: 07/08/2015 by 11:55pm
## Module Name: task2_4c.c
##
## We Certify that this program code has been written by us
## and no part of it has been taken from any sources.
##########################################################
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>                
 
#define M 500
#define N 500
 
int main(int argc, char *argv) {
//set number of threads here
omp_set_num_threads(8);
 
int i, j, k;
double sum;
double **A, **B, **C;
 
A = malloc(M*sizeof(double *));
B = malloc(M*sizeof(double *));
C = malloc(M*sizeof(double *));
 
for (i = 0; i < M; i++) {
  A[i] = malloc(N*sizeof(double));
  B[i] = malloc(N*sizeof(double));
  C[i] = malloc(N*sizeof(double));
}
 
double start, end;
 
for (i = 0; i < M; i++) {
   for (j = 0; j < N; j++) {
     A[i][j] = j*1;
     B[i][j] = i*j+2;
     C[i][j] = j-i*2;
   }
}
 
start = omp_get_wtime();
 
#pragma omp parallel for private(j,k,sum) 
for (i = 0; i < M; i++) {
  #pragma omp parallel for private(k,sum)
  for (j = 0; j < N; j++) {
     sum = 0;
     for (k=0; k < M; k++) {
        sum += A[i][k]*B[k][j];
     }
     C[i][j] = sum;
 }
}
 
end = omp_get_wtime();
 
printf("Time of computation: %f\n", end-start);
 
         }
