#include <stdio.h>

void swap(int *a, int *b) {
  *a = *a + *b;
  *b = *a - *b;
  *a = *a - *b;
}

void bubbleSort(int *arr, int size) {
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size - 1 - i; j++) {
      if (arr[j] > arr[j + 1]) {
        swap(&arr[j], &arr[j + 1]);
      }
    }
  }
}

void printArray(int *arr, int size) {
  for (int i = 0; i < size; i++) {
    printf("%d ", arr[i]);
  }
  printf("\n");
}

int main() {
  int arr[] = {4, 3, 2, 5, 1};
  int n = sizeof(arr) / sizeof(arr[0]);
  printf("The original array: \n");
  printArray(arr, n);
  bubbleSort(arr, n);
  printf("The sorted array: \n");
  printArray(arr, n);
  return 0;
}
