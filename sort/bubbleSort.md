## Bubble sort

Problem: Given an array of integers, sort the array.

const arr = [-6, 20, 8, -2, 4]

bubbleSort(arr) => Should return [-6, -2, 4, 8, 20];

```javascript
const bubbleSort = (arr) => {
  let swapped;
  do {
    swapped = false;
    for (let i = 0; i < arr.length; i++) {
      if (arr[i] > arr[i + 1]) {
        const temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;
        swapped = true;
      }
    }
  } while (swapped);
};

const arr = [-6, 20, 8, -2, 4];

bubbleSort(arr); // [ -6, -2, 4, 8, 20 ]

console.log(arr);
```

Big(O) = O(n^2)