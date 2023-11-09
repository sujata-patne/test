<h2>Javascript theoretical interview question</h2>

<details>
<summary><b>What is hoisting?</b></summary>

Hoisting is a term used in JavaScript that refers to the default behavior of moving all declarations to the top of the current scope (to the top of the current script or the current function). This means that a variable can be used before it has been declared. However, only declarations are hoisted, not initializations. Variables defined with let and const are hoisted to the top of the block, but not initialized. It is always a good practice to declare all variables at the beginning of every scope to avoid bugs in your program.
```Javascript
console.log(myVar); // Output: undefined
var myVar = 5;
console.log(myVar); // Output: 5
```

```Javascript
var myVar;
console.log(myVar); // Output: undefined
myVar = 5;
console.log(myVar); // Output: 5
```
In the above example, myVar is undefined when it’s logged the first time because only the declaration (var myVar), not the initialization (= 5), is hoisted to the top

And here’s an example of hoisting with a function:
```Javascript
hoistedFunction(); // Output: "This function has been hoisted."

function hoistedFunction() {
  console.log("This function has been hoisted.");
}
```
In the above example, the entire function declaration (including the body) is hoisted, so you can call it before its declaration in the code.

However, it’s important to note that only function declarations are hoisted. Function expressions (including those involving arrow functions) are not:

```js
notHoisted(); // Output: TypeError: notHoisted is not a function

var notHoisted = function() {
  console.log("This function expression will not be hoisted.");
};
```
In this case, because notHoisted is a function expression and not a declaration, it’s not hoisted and you get a TypeError when you try to call it before its declaration. The variable notHoisted is hoisted, but at the point where it’s called, it holds undefined, which is not callable as a function.

</details>

<details>
<summary><b>What is closure, what are the benefits of it?</b></summary>
Explanation 1:

Closure is a concept in JavaScript that allows a function to access variables from an outer function that has already returned. In other words, a closure is created when a function returns another function that has access to the parent function’s variables. 

The benefits of using closures include:

* Encapsulation: Closures allow you to encapsulate variables and functions, which can help you avoid naming collisions and keep your code organized.
* Data privacy: Closures can be used to create private variables and methods that are not accessible from outside the function.
* Function factories: Closures can be used to create functions with different sets of parameters or default values.
* Partial application: Closures can be used to create new functions with some of the arguments of the original function already set.

Here’s an example of how closures can be used to create private variables:
```Javascript
function counter() {
  let count = 0;
  return function() {
    count++;
    console.log(count);
  }
}

const increment = counter();
increment(); // logs 1
increment(); // logs 2
increment(); // logs 3
```

Explanation 2:

A closure in JavaScript is a feature that allows inner functions to access the outer scope of a function. It helps in binding a function to its outer boundary and is created automatically whenever a function is created. A closure is the combination of a function bundled together with references to its surrounding state (the lexical environment). In other words, a closure gives you access to an outer function’s scope from an inner function

Here’s an example of a closure in JavaScript:

```Javascript
function outerFunc() {
  const outerVar = "I'm a variable in the outer function";
  function innerFunc() {
    console.log(outerVar);
  }
  return innerFunc;
}

const closure = outerFunc();
closure(); // "I'm a variable in the outer function"
```
In this code, innerFunc has access to the variables and functions in the scope of outerFunc, even after outerFunc has completed execution.

Closures have several benefits in JavaScript:

1. Encapsulation: By encapsulating data and functionality within a closure, you can create self-contained units of code that are easy to understand and maintain.
```Javascript
function createBook(title, author) {
  let _title = title;
  let _author = author;
  return {
    getTitle: function() {
      return _title;
    },
    getAuthor: function() {
      return _author;
    },
    setTitle: function(newTitle) {
      _title = newTitle;
    },
    setAuthor: function(newAuthor) {
      _author = newAuthor;
    }
  }
}

const book1 = createBook('Clean Code', 'Robert Cecil Martin');
console.log(book1.getTitle()); // 'Clean Code'
console.log(book1.getAuthor()); // 'Robert Cecil Martin'
book1.setTitle('Code Complete');
console.log(book1.getTitle()); // 'Code Complete'
```
2. State Retention: Variables in closures can help you maintain a state that you can use later.
```Javascript
function createCounter() {
  let count = 0;
  return function() {
    count += 1;
    return count;
  }
}

const counter1 = createCounter();
const counter2 = createCounter();

console.log(counter1()); // 1
console.log(counter1()); // 2
console.log(counter2()); // 1
```
3. Currying: Closures allow you to bind some arguments of a function and create a new one.
```Javascript
function createFormatter(prefix) {
  return function(value) {
    return prefix + value;
  }
}

const formatCurrency = createFormatter('$');
const formatPercentage = createFormatter('%');

console.log(formatCurrency(123.45)); // $123.45
console.log(formatPercentage(0.1234)); // %0.1234

const price = 123.45;
console.log(`The price is ${formatCurrency(price)}`); // The price is $123.45

const percentage = 0.1234;
console.log(`The percentage is ${formatPercentage(percentage)}`); // The percentage is %0.1234
```
4. Memoization: Closures can be used to store computation results that can be reused later, improving performance.
```Javascript
function createFibonacciGenerator() {
  const cache = {};

  return function fibonacci(n) {
    if (n in cache) {
      return cache[n];
    } else {
      let a = 0, b = 1, c;
      for (let i = 0; i < n; i++) {
        c = a + b;
        a = b;
        b = c;
      }
      cache[n] = a;
      return a;
    }
  }
}

const fibonacciGenerator = createFibonacciGenerator();
console.log(fibonacciGenerator(10)); // 55
console.log(fibonacciGenerator(10)); // 55
```
5. Asynchronous Programming: Closures are useful in asynchronous programming as they help maintain the state between events.
```Javascript
function getData(url) {
  return new Promise((resolve, reject) => {
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        resolve(JSON.parse(xhr.responseText));
      } else if (xhr.readyState === 4) {
        reject(xhr.status);
      }
    }
    xhr.open('GET', url);
    xhr.send();
  });
}

getData('https://your-domain.com/api/users')
  .then(users => console.log(users))
  .catch(error => console.error(error));
```
6. Event Handling: Closures are useful in event handling as they provide an easy way to pass additional data to an event handler
```Javascript
function createMenu(items) {
  let currentItem = 0;

  return {
    next: function() {
      currentItem = (currentItem + 1) % items.length;
      return items[currentItem];
    },
    prev: function() {
      currentItem = (currentItem - 1 + items.length) % items.length;
      return items[currentItem];
    },
    handleKeydown: function(event) {
      if (event.keyCode === 37) {
        // left arrow key
        console.log(this.prev());
      } else if (event.keyCode === 39) {
        // right arrow key
        console.log(this.next());
      }
    }
  }
}

const menu = createMenu(['Home', 'About', 'Contact']);

document.addEventListener('keydown', menu.handleKeydown.bind(menu));
```
</details>

<details>
<summary>
<b>What is Reference Error, Type Error?</b>
</summary>

**ReferenceError**: In JavaScript, a `ReferenceError` is thrown when a variable that doesn't exist or hasn't yet been initialized in the current scope is referenced. For example:

```js
console.log(nonExistentVariable); // Throws "ReferenceError: nonExistentVariable is not defined"
```

**TypeError**: A `TypeError` is thrown when an operation could not be performed, typically when a value is not of the expected type. This can happen when an operand or argument passed to a function is incompatible with the type expected by that operator or function. For example:

```js
let a = 1;
console.log(a()); // Throws "TypeError: a is not a function"
```

In this example, `a` is a number, but we're trying to call it as if it were a function, which is not allowed, so a TypeError is thrown.
</details>

<details>
<summary>
<b>Array and Object destructuring</b>
</summary>

**Array Destructuring**: Array destructuring in JavaScript allows you to extract multiple items from an array and assign them to individual variables. Here's an example:

```javascript
const colorArr = ["red", "yellow", "blue", "green", "white", "black"];
const [first, second] = colorArr;
console.log(first, second); // Outputs: red, yellow
```

In this example, `first` and `second` are new variables that are assigned the first and second values of the `colorArr` array.

**Object Destructuring**: Object destructuring in JavaScript allows you to extract multiple properties from an object and assign them to individual variables. Here's an example:

```javascript
const obj = { a: 1, b: 2 };
const { a, b } = obj;
console.log(a, b); // Outputs: 1, 2
```

In this example, `a` and `b` are new variables that are assigned the values of the `a` and `b` properties of the `obj` object.

Destructuring is a powerful feature in JavaScript that makes it easier to work with arrays and objects.
</details>

<details>
<summary>
<b>How many ways objects can be created?</b>
</summary>
Here are the four main ways to create objects in JavaScript:

1. **Object Literals**: This is the simplest way to create an object. You define the property and values inside curly braces.

    ```javascript
    let car = {
      name: 'GT',
      maker: 'BMW',
      engine: '1998cc'
    };
    ```

2. **Constructor Function**: This is a way to create multiple objects of the same type. A constructor is a function, and with the help of the `new` keyword, it allows the creation of multiple objects.

    ```javascript
    function Vehicle(name, maker, engine) {
      this.name = name;
      this.maker = maker;
      this.engine = engine;
    }
    let car = new Vehicle('GT', 'BMW', '1998cc');
    ```

3. **Object.create() Method**: The `Object.create()` method creates a new object, using an existing object as the prototype of the newly created object.

    ```javascript
    let car = {
      name: 'GT',
      maker: 'BMW',
      engine: '1998cc'
    };
    let newCar = Object.create(car);
    ```

4. **Class Keyword**: ES6 introduced the `class` keyword to create objects. A class is a type of function, but instead of using the keyword `function`, you use the keyword `class`, and the properties are assigned inside a `constructor()` method.

    ```javascript
    class Vehicle {
      constructor(name, maker, engine) {
        this.name = name;
        this.maker = maker;
        this.engine = engine;
      }
    }
    let car = new Vehicle('GT', 'BMW', '1998cc');
    ```

Each of these methods has its own use cases and can be used depending on the specific requirements of your code.
</details>

<details>
<summary>
<b>How to create copy of object</b>
</summary>
There are several ways to create a copy of an object in JavaScript:

1. **Object.assign()**: This method can be used to copy the values of all enumerable own properties from one or more source objects to a target object.

    ```javascript
    const obj = { a: 1, b: 2 };
    const copy = Object.assign({}, obj);
    console.log(copy); // { a: 1, b: 2 }
    ```

2. **Spread Operator (`...`)**: The spread operator can be used to copy enumerable properties from a provided object onto a new object.

    ```javascript
    const obj = { a: 1, b: 2 };
    const copy = { ...obj };
    console.log(copy); // { a: 1, b: 2 }
    ```

3. **JSON.parse() and JSON.stringify()**: These methods can be used to create a deep copy of an object. However, they should be used with caution because they will not correctly copy object methods and certain other types of values.

    ```javascript
    const obj = { a: 1, b: 2 };
    const copy = JSON.parse(JSON.stringify(obj));
    console.log(copy); // { a: 1, b: 2 }
    ```

Please note that the first two methods create a shallow copy of the object, while the last method creates a deep copy. In a shallow copy, properties that are objects will still reference the same object, while in a deep copy, all properties are duplicated and the copy is completely independent of the original object.
</details>

<details>
<summary>
<b>Shallow copy, deep copy</b>
</summary>
In JavaScript, objects and arrays are copied by reference, not by value. This means that if you make a copy of an object or an array, changes to the original will affect the copy and vice versa. This is essentially a shallow copy.

Here's an example of a shallow copy in JavaScript:

```js
let original = { a: 1, b: 2 };
let copy = original;
copy.a = 5;
console.log(original.a); // Outputs: 5
```

In this example, changing `copy.a` also changes `original.a`, because `copy` and `original` refer to the same underlying object.

To create a deep copy in JavaScript, you can use the `JSON.parse()` and `JSON.stringify()` methods:

```js
let original = { a: 1, b: 2 };
let copy = JSON.parse(JSON.stringify(original));
copy.a = 5;
console.log(original.a); // Outputs: 1
```

In this example, changing `copy.a` does not change `original.a`, because `copy` and `original` are completely separate objects.

However, the `JSON.parse()`/`JSON.stringify()` method only works with JSON-safe objects, so it can't copy functions, dates, or other non-JSON data types. For more complex cases, you might need to use a library like Lodash's `_.cloneDeep()` function.

The structuredClone() method is a built-in JavaScript function that creates a deep clone of a given value using the structured clone algorithm. It’s efficient and works as expected. It also supports circular references. However, it’s a relatively new addition to JavaScript and may not be supported in all environments. Also, it can’t clone functions, methods, or DOM elements, and it doesn’t preserve some types of properties in the clone.

Here’s an example:
```js
// Create an object with a value and a circular reference to itself.
const original = { name: "MDN" };
original.itself = original;

// Clone it
const clone = structuredClone(original);

console.assert(clone !== original); // the objects are not the same (not same identity)
console.assert(clone.name === "MDN"); // they do have the same values
console.assert(clone.itself === clone); // and the circular reference is preserved
```
In this example, structuredClone() creates a deep copy of the original object. The original object has a property name with the value "MDN" and a property itself that references the original object itself. After cloning, the clone object has the same properties and values as the original object, but they are not the same object.
</details>

<details>
<summary>
<b>What is event bubbling?</b>
</summary>

Event bubbling is a concept in JavaScript where an event triggers at the deepest possible element, and triggers on parent elements in nesting order. As a result, an event is first captured and handled by the innermost element and then propagated to outer elements.

Here's a simple example of event bubbling:

```html
<!DOCTYPE html>
<html>
<body>

<div onclick="alert('div event handler')">DIV
  <button onclick="alert('button event handler')">BUTTON</button>
</div>

</body>
</html>
```

In this example, if you click on the "BUTTON", you'll first see an alert with the message "button event handler". After you close that alert, you'll see another alert with the message "div event handler". This is because the click event on the button bubbles up to its parent div element.

However, you can stop event bubbling by using the `stopPropagation()` method of the event object:

```html
<!DOCTYPE html>
<html>
<body>

<div onclick="alert('div event handler')">DIV
  <button onclick="event.stopPropagation(); alert('button event handler')">BUTTON</button>
</div>

</body>
</html>
```

In this second example, if you click on the "BUTTON", you'll only see an alert with the message "button event handler". The div's event handler won't be triggered because `event.stopPropagation()` prevents the event from bubbling up to the parent elements.

</details>

<details>
<summary>
<b>What is Generator function?</b>
</summary>
In JavaScript, a generator function is a special type of function that can be paused and resumed, allowing it to generate a sequence of values on demand. 

Generator functions are defined using the `function*` syntax. When called, they do not initially execute their code. Instead, they return a special type of iterator, called a Generator. When a value is consumed by calling the generator's `next` method, the Generator function executes until it encounters the `yield` keyword.

Here's an example of a simple generator function:

```javascript
function* idGenerator() {
  let id = 0;
  while (true) {
    yield id++;
  }
}

const gen = idGenerator();

console.log(gen.next().value); // 0
console.log(gen.next().value); // 1
console.log(gen.next().value); // 2
// ...
```

In this example, `idGenerator` is a generator function that produces a sequence of IDs. Each time its `next` method is called, it yields the next ID.

Generators are a powerful feature in JavaScript, especially when dealing with asynchronous programming and producing a sequence of values. They allow you to write asynchronous code that looks synchronous. For example, you can use generators to pause asynchronous tasks, wait for a promise to resolve, and then resume the asynchronous tasks.

Here's an example of how you might use a generator function with promises:

```js
function* myAsyncGenerator() {
  const data = yield fetch('https://api.example.com/data');
  console.log(data);
}

const gen = myAsyncGenerator();
const promise = gen.next().value;

promise.then(data => gen.next(data));
```

In this example, `myAsyncGenerator` is a generator function that fetches data from an API. It yields the promise returned by `fetch`, pauses its execution, and resumes when the promise is fulfilled.

</details>

<details>
<summary>
<b>What is currying function?</b>
</summary>
Currying is a technique in functional programming that transforms a function with multiple arguments into a sequence of functions, each with a single argument. This means that if you have a function that takes n arguments, currying would translate this into n functions, each taking one argument.

Here’s an example in JavaScript:
```js
// A function that takes two arguments, a and b, and returns their sum.
function add(a, b) {
  return a + b;
}
add(3, 4); // returns 7

// Now we curry this function:
function add(a) {
  return function(b) {
    return a + b;
  }
}
add(3)(4); // returns 7
```

In the curried version, the function add takes one argument, a, and returns a function that takes another argument, b. That function then returns their sum.

Currying is useful for creating higher-order functions, reducing errors by dividing a function into smaller functions, building modular and reusable code, avoiding passing the same variable multiple times, and making the code more readable.
</details>

<details>
<summary>
<b>Explain call, bind, apply</b>
</summary>

`call`, `apply`, and `bind` are all methods in JavaScript that can be used to change the context (`this`) of a function.

1. **call()**: The `call()` method calls a function with a given `this` value and arguments provided individually.

```js
function greet() {
  console.log(`Hello, my name is ${this.name}`);
}

let obj = {name: 'John Doe'};

greet.call(obj);  // Output: Hello, my name is John Doe
```

2. **apply()**: The `apply()` method calls a function with a given `this` value and arguments provided as an array (or an array-like object).

```js
function greet(greeting, lang) {
  console.log(`${greeting}, my name is ${this.name} and I speak ${lang}`);
}

let obj = {name: 'John Doe'};

greet.apply(obj, ['Hello', 'English']);  // Output: Hello, my name is John Doe and I speak English
```

3. **bind()**: The `bind()` method creates a new function that, when called, has its `this` keyword set to the provided value, with a given sequence of arguments preceding any provided when the new function is called.

```javascript
function greet() {
  console.log(`Hello, my name is ${this.name}`);
}

let obj = {name: 'John Doe'};

let boundGreet = greet.bind(obj);

boundGreet();  // Output: Hello, my name is John Doe
```

In summary, use `call()` or `apply()` when you want to invoke the function immediately with a modified context. Use `bind()` when you want to create a new function that can be executed later with a certain context.
</details>

<details>
<summary>
<b>Difference between Promise.any() and Promise.race()</b>
</summary>
Promise.any(iterable): This method takes an iterable of Promise objects and returns a promise that fulfills as soon as one of the promises in the iterable fulfills. If all of the given promises are rejected, then the returned promise is rejected with an AggregateError.

Promise.race(iterable): This method also takes an iterable of Promise objects, but it returns a promise that settles (either fulfills or rejects) as soon as one of the promises in the iterable settles

```js
let promise1 = new Promise((resolve, reject) => setTimeout(reject, 100, 'promise1'));
let promise2 = new Promise((resolve, reject) => setTimeout(resolve, 200, 'promise2'));
let promises = [promise1, promise2];

Promise.any(promises).then(console.log).catch(console.error); // Output: promise2
Promise.race(promises).then(console.log).catch(console.error); // Output: Uncaught (in promise) promise1
```
This demonstrates the key difference between Promise.any and Promise.race. Promise.any is only interested in fulfilled promises and ignores rejections if there is at least one fulfilled promise, while Promise.race settles as soon as any promise settles, regardless of whether it’s a fulfillment or rejection
</details>

<details>
<summary>
<b>What is the difference between `Object.freeze()` and `Object.seal()`?</b>
</summary>

`Object.freeze()` and `Object.seal()` are both used to create non-extensible objects in JavaScript, but they behave differently:

- **Object.freeze()**: This method makes an object completely immutable. It prevents you from adding new properties, removing existing properties, and modifying the values of existing properties. It also prevents changes to the object's prototype. If you try to modify the object in any way, it will be ignored without any error being thrown.

- **Object.seal()**: This method allows modifications to the values of existing properties, but it prevents adding or deleting properties. It makes every existing property non-configurable, meaning they cannot be converted from 'data descriptors' to 'accessor descriptors' (and vice versa), and no attribute of accessor descriptors can be modified at all. However, data descriptors can change their writable attribute, and their value attribute if writable is true. If you try to add or delete properties, it will be ignored without any error being thrown.

Here's a summary:

| Method | Adding Properties | Removing Properties | Modifying Existing Properties | Modifying Object's Prototype |
| --- | --- | --- | --- | --- |
| Object.freeze() | ❌ | ❌ | ❌ | ❌ |
| Object.seal() | ❌ | ❌ | ✅ | ✅ |

Please note that both `Object.freeze()` and `Object.seal()` are shallow, meaning property values that are objects can still be modified unless those objects are also frozen or sealed.

```js
let obj = { a: 1, b: 2 };

// Using Object.freeze()
let frozenObj = Object.freeze(Object.assign({}, obj));
frozenObj.a = 3; // This will not change the a property
console.log(frozenObj.a); // Outputs: 1

// Using Object.seal()
let sealedObj = Object.seal(Object.assign({}, obj));
sealedObj.a = 3; // This will change the a property
console.log(sealedObj.a); // Outputs: 3
```
In this example, frozenObj is a frozen object, which means its properties cannot be added, deleted, or changed. Any attempts to do so will be ignored without any error being thrown. sealedObj is a sealed object, which means its existing properties cannot be deleted, but they can be changed. Any attempts to delete properties will be ignored without any error being thrown.
</details>


<details>
<summary>
<b>There is an object named 'employee' that has several properties. I want to generate a new object called 'newEmployee' that contains all the properties of the 'employee' object. However, I want to ensure that the existing properties of the 'newEmployee' object cannot be modified or deleted.</b>
</summary>
If you want to create a new object that includes all properties of the existing object and prevents modification and deletion of these properties, but allows addition of new properties, you can use Object.seal().
Here’s an example:

```js
let employee = {
  name: 'John Doe',
  role: 'Software Engineer',
  age: 30
};

let newEmployee = Object.assign({}, employee); // This creates a copy of the employee object
Object.seal(newEmployee); // This prevents modification and deletion of existing properties

newEmployee.name = 'Jane Doe'; // This will not change the name property
delete newEmployee.role; // This will not delete the role property
newEmployee.department = 'Engineering'; // This will add a new property

console.log(newEmployee); // Outputs: { name: 'John Doe', role: 'Software Engineer', age: 30, department: 'Engineering' }
```
In this example, newEmployee is a sealed object, which means its existing properties cannot be deleted or changed, but new properties can be added. Any attempts to delete or change existing properties will be ignored without any error being thrown. However, new properties can be added to the object. Please note that Object.seal() is shallow, meaning property values that are objects can still be modified unless those objects are also sealed. If you need to deep seal an object (prevent modification of all nested objects), you’ll need to write a function that recursively seals each property that is an object.
</details>

<details>
<summary>
<b>Map and WeakMap</b>
</summary>

`Map` and `WeakMap` are both key-value data structures in JavaScript, but they have some differences:

1. **Key Types**: A `Map` accepts any data type (objects, primitive values such as strings, numbers, etc.) as keys. On the other hand, a `WeakMap` only accepts objects as keys.

2. **Garbage Collection**: In a `Map`, if a key is removed, the `Map` will still hold the key's reference. This means that the key is not eligible for garbage collection and will not be removed from memory. In contrast, a `WeakMap` holds weak references to the keys. If there are no other references to the object acting as a key, the garbage collector will remove the key from memory. This prevents memory leaks.

3. **Iterability**: `Map` objects are iterable, which means you can loop over them. `WeakMap` objects are not iterable.

4. **Size Property**: `Map` objects have a `size` property that returns the number of key-value pairs in the map. `WeakMap` does not have a `size` property.

Sure, let's start with an example of a `Map`:

```js
let map = new Map();

map.set('name', 'John');
map.set('age', 30);

console.log(map.get('name')); // John
console.log(map.get('age')); // 30
console.log(map.size); // 2

for (let [key, value] of map) {
  console.log(`${key} = ${value}`);
}
// name = John
// age = 30
```

In this example, we create a `Map` and set two key-value pairs. We then retrieve the values using the `get` method and log the size of the map. Finally, we iterate over the map and log each key-value pair.

Now, let's look at an example of a `WeakMap`:

```js
let weakmap = new WeakMap();

let obj1 = {};
let obj2 = {};

weakmap.set(obj1, 'John');
weakmap.set(obj2, 30);

console.log(weakmap.get(obj1)); // John
console.log(weakmap.get(obj2)); // 30

obj1 = null; // remove reference to object

// There's no way to verify this, but obj1 has now been removed from the WeakMap
```

In this example, we create a `WeakMap` and set two key-value pairs using objects as keys. We then retrieve the values using the `get` method. Finally, we remove the reference to `obj1`. The `WeakMap` will automatically remove `obj1` and its associated value from memory.
</details>