#include "assortment.h"

void main()
{
    int arr[] = {10, 7, 8, 9, 1, 5};
    int n = sizeof(arr) / sizeof(arr[0]);

    int answer;
    printf("Digite (1) Buble, (2)Radix, (3)Quick e (4)Heap:");
    scanf("%d", &answer);
    switch (answer)
    {
    case 1:
        bubbleSort(arr, n);
        break;
    case 2:
        radixsort(arr, n);
        break;
    case 3:
        quickSort(arr, 0, n - 1);
        break;
    case 4:
        heapSort(arr, n);
        break;
    default:
        break;
    }

    printf("Sorted array: \n");
    printArray(arr, n);
}
