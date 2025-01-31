#ifndef ASSORTMENT_h
#define ASSORTMENT_h

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Bublesort
void bubbleSort(int arr[], int n);

// Radixsort
int getMax(int arr[], int n);
void countSort(int arr[], int n, int exp);
void radixsort(int arr[], int n);

// Quicksort
int partition(int arr[], int low, int high);
void quickSort(int arr[], int low, int high);

// Heapsort
void heapify(int arr[], int n, int i);
void heapSort(int arr[], int n);

// HeapSort Otimizado
void build_max_heap (int *arr, int length);
void heap_sort (int v[], int n); 


// Common functions
void printArray(int arr[], int size);
void swap(int *a, int *b);

#endif