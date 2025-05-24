function bubbleSort(arr) {
  let n = arr.length;
  for (let i = 0; i < n; i++) {
    for (let j = 0; j < n - 1 - i; j++) {
      if (arr[j] > arr[j + 1]) {
        let temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

let arr = [4, 3, 2, 5, 1];
console.log("The original list: ");
console.log(arr);
bubbleSort(arr);
console.log("The sorted list: ");
console.log(arr);
