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

#### Create a function which will convert string from 'today is friday' to 'friday is today'. Condition can't use inbuild function, you can use length property or for loop.

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