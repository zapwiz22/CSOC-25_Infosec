#!/bin/bash

function bubbleSort() {
  local -n arr=$1
  local n=${#arr[@]}
  for ((i = 0; i < n; i++)); do
    for ((j = 0; j < n - 1 - i; j++)); do
      if [ ${arr[j]} -gt ${arr[j + 1]} ]; then
        temp=${arr[j]}
        arr[j]=${arr[j + 1]}
        arr[j + 1]=${temp}
      fi
    done
  done
}

nums=(4 3 2 5 1)
echo "The original array: "
echo ${nums[@]}
bubbleSort nums
echo "The sorted array: "
echo ${nums[@]}
