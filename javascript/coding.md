# Basic javascript question asked in interview

### Get the non-repeated element from below array

```javascript
const arr = [2, 3, 4, 3, 3, 2, 4, 9, 1, 2, 5, 5];

const nonRepeatedEle = arr.filter(num => arr.indexOf(num) === arr.lastIndexOf(num))

console.log(nonRepeatedEle); // [9, 1]
```

### Get unique element from array

#### Method: 1
```javascript
const arr = [2, 3, 4, 3, 3, 2, 4, 9, 1, 2, 5, 5];

let uniqueArray = [];

for (const element of arr) {
  if (!uniqueArray.includes(element)) {
    uniqueArray.push(element);
  }
}
console.log(uniqueArray); // [ 2, 3, 4, 9, 1, 5 ]
```

#### Method: 2
```javascript
const arr = [2, 3, 4, 3, 3, 2, 4, 9, 1, 2, 5, 5];

const uniqueArray = [...new Set(arr)];

console.log(uniqueArray); // [ 2, 3, 4, 9, 1, 5 ]
```

### Sort below array based on grades

```javascript
let students = [
  { name: "ram", grade: "a", age: 31 },
  { name: "Arjaun", grade: "B+", age: 59 },
  { name: "shyam", grade: "A+", age: 40 },
  { name: "Vishnu", grade: "B", age: 90 },
  { name: "Shiva", grade: "C", age: 12 },
  { name: "Krishana", grade: "C", age: 3 },
];
```

#### Solution
```javascript
const grades = ['A+', 'A', 'B+', 'B', 'C+', 'C'];

function compareGrades(studentA, studentB) {
  const gradeAIndex = grades.indexOf(studentA.grade.toUpperCase());
  const gradeBIndex = grades.indexOf(studentB.grade.toUpperCase());
  return gradeAIndex - gradeBIndex;
}

students.sort(compareGrades);

console.log(students);

output:

[
  { name: 'shyam', grade: 'A+', age: 40 },
  { name: 'ram', grade: 'A', age: 31 },
  { name: 'Arjaun', grade: 'B+', age: 59 },
  { name: 'Vishnu', grade: 'B', age: 90 },
  { name: 'Shiva', grade: 'C', age: 12 },
  { name: 'Krishana', grade: 'C', age: 3 }
]
```

#### You can also create utility function which will sort array based on order you pass like desc, default is ascending

```javascript
let sortedStudent = (type) => {
  return students.slice().sort((a, b) => {
    let grades = ["A+", "A", "B+", "B", "C+", "C", "D+", "D", "E+", "E", "F"];
    let aEl = grades.indexOf(a.grade.toUpperCase());
    let bEl = grades.indexOf(b.grade.toUpperCase());
    let comparison = 0;
    if (aEl > bEl) {
      comparison = 1;
    }
    if (aEl < bEl) {
      comparison = -1;
    }
    return type === "desc" ? comparison * -1 : comparison;
  });
};

console.log(sortedStudent('desc'));

Output:
[
  { name: 'Shiva', grade: 'C', age: 12 },
  { name: 'Krishana', grade: 'C', age: 3 },
  { name: 'Vishnu', grade: 'B', age: 90 },
  { name: 'Arjaun', grade: 'B+', age: 59 },
  { name: 'ram', grade: 'A', age: 31 },
  { name: 'shyam', grade: 'A+', age: 40 }
]
```

### Get element with their total count of occurances

#### Method: 1
```Javascript
const arr = [5, 5, 5, 2, 2, 2, 2, 2, 9, 4];
const counts = {};

for (const num of arr) {
  counts[num] = counts[num] ? counts[num] + 1 : 1;
}

console.log(counts);
// Output
{ '2': 5, '4': 1, '5': 3, '9': 1 }
```

#### Method: 2
```Javascript
const arr = [5, 5, 5, 2, 2, 2, 2, 2, 9, 4];

const counts = arr.reduce((acc, value) => {
  if (!acc[value]) {
    acc[value] = 0;
  }
  acc[value]++;
  return acc;
}, {});

console.log(counts);
// Output
{ '2': 5, '4': 1, '5': 3, '9': 1 }
```

#### Extract unique properties from two objects
```js
function getUnique(object1, object2) {
  let result = {};
  for (let key in object2) {
    if (!object1.hasOwnProperty(key)) {
      result[key] = object2[key];
    }
  }
  return result;
}

let obj1 = { a: 1, b: 34 };
let obj2 = { a: 1, b: 34, c: 1, d: 6 };

console.log(getUnique(obj1, obj2)); // Output: {c: 1, d: 6}
```

### Create a function which will convert string from 'today is friday' to 'friday is today'. Condition can't use inbuild function, you can use length property or for loop.

```Javascript
let str = "today is friday";

function reverseWord(str) {
  let result = "";
  let word = "";

  for (let i = 0; i < str.length; i++) {
    if (str[i] === " " || i === str.length - 1) {
      if (i === str.length - 1) {
        word += str[i];
      }
      result = word + " " + result;
      word = "";
    } else {
      word += str[i];
    }
  }

  return result;
}

console.log(reverseWord(str));
// output: friday is today
```

### create a function to flatten an array


The flat() method of Array instances creates a new array with all sub-array elements concatenated into it recursively up to the specified depth. The depth level specifying how deep a nested array structure should be flattened. Defaults to 1.

```js
const arr4 = [1, 2, [3, 4, [5, 6, [7, 8, [9, 10]]]]];
arr4.flat(Infinity);
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```
Example below without using flat
```js
function flattenArray(nestedArray) {
    let flatArray = [];
    for (let i = 0; i < nestedArray.length; i++) {
        if (Array.isArray(nestedArray[i])) {
            flatArray = flatArray.concat(flattenArray(nestedArray[i]));
        } else {
            flatArray.push(nestedArray[i]);
        }
    }
    return flatArray;
}

const arr = [1,2,[3,[4,5,[6]]]];
console.log(flattenArray(arr)); // [ 1, 2, 3, 4, 5, 6 ]

```

### Remove duplicates id of object from array

```js
let users = [
  { id: 1, name: "Jitendra" },
  { id: 2, name: "Jittu" },
  { id: 2, name: "Ram" },
  { id: 3, name: "Shyam" },
  { id: 3, name: "Laxman" },
];
```

### Method 1: Time complexity of O(n^2) and a space complexity of O(n).
```js
let uniqArr = [];
for(let i = 0; i < users.length; i++) {
  let user = users[i];
  let found = false;
  for(let j = 0; j < uniqArr.length; j++) {
    let user1 = uniqArr[j];
    if(user1.id === user.id) {
      found = true;
      break;
    }
  }
  if(!found) {
    uniqArr.push(user);
  }
}
```

### Method 2: Time complexity of O(n^2) and a space complexity of O(n)
```js
let uniqArr = users.reduce((acc, current) => {
  const x = acc.find(item => item.id === current.id);
  if (!x) {
    return acc.concat([current]);
  } else {
    return acc;
  }
}, []);
```

### Method 3: Best approach, Time complexity of O(n) and a space complexity of O(n)
```js
let userMap = new Map();
users.forEach(user => {
  userMap.set(user.id, user);
});

let uniqArr = Array.from(userMap.values());

console.log(uniqArr);
// output
[
  { id: 1, name: 'Jitendra' },
  { id: 2, name: 'Jittu' },
  { id: 3, name: 'Shyam' }
]
```