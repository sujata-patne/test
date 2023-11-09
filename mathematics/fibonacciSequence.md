## Fibonacci Sequence

Problem: Give a number 'n' find the first 'n' elements of the Fibonacci sequence

In Mathematics, the fabonacci sequence is a sequence in which each number is the sum of the two preceding ones.
The first two numbers in the sequence are 0 and 1.

```javascript
const fibonacci = (num) => {
  const fib = [0,1];
  for(let i = 2; i < num; i++) {
    fib[i] = fib[i-1] + fib[i-2]
  }
  return fib;
};

console.log(fibonacci(2)); // [0,1]
console.log(fibonacci(3)); // [0,1,1]
console.log(fibonacci(4)); // [0,1,1,2]
console.log(fibonacci(5)); // [0,1,1,2,3]
console.log(fibonacci(7)); // [0,1,1,2,3,5,8]
```

Time complexity of fibonacci is O(n)

## Recursive Fibonacci Sequence
The fibonacci sequence is a sequence in which each number is the sum of the two preceding ones.

if F represents a function to calculate the fibonacci number, then

Fn = Fn-1 + Fn-2

F0 = 0 and F1 = 1

F2 = F1 + F0

F2 = 1 + 0

F2 = 1

```javascript

```
Big O = O(2^n)