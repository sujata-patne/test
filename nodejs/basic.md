<details>
<summary><b>What is libuv, how does it works?</b></summary>
libuv is a multi-platform C library that provides support for asynchronous I/O based on event loops. It is an integral part of the Node.js runtime and is responsible for handling I/O operations, timers, networking, and other low-level functionalities.

The library enforces an asynchronous, event-driven style of programming and offers core utilities like timers, non-blocking networking support, asynchronous file system access, child processes and more.

In terms of how it works, libuv uses an event loop to manage I/O operations. The event loop waits for events to occur and then executes the corresponding callbacks. This allows for non-blocking I/O operations and efficient use of system resources.

libuv is used by several software projects including Node.js, Luvit, Julia, uvloop and others.
</details>
<details>
<summary><b>Explain event loop.</b></summary>
The event loop is a programming construct that is used to handle asynchronous events in a non-blocking manner. It is a constantly running process that monitors both the callback queue and the call stack.

When an event occurs, it is added to the callback queue. The event loop then waits until the call stack is empty and places the next function from the callback queue to the call stack. This allows for non-blocking I/O operations and efficient use of system resources.

The event loop is an essential part of JavaScript’s runtime model and is responsible for executing the code, collecting and processing events, and executing queued sub-tasks. It offers some nice properties when reasoning about your program, including the fact that whenever a function runs, it cannot be preempted and will run entirely before any other code runs (and can modify data the function manipulates)
</details>
<details>
<summary><b>What is process.nextTick(), setTimeout(), setImmediate(), In which order it will execute and why?</b></summary>
process.nextTick(), setTimeout(), and setImmediate() are all used to schedule callbacks to be executed at a later time. However, they have different execution orders and use cases.

process.nextTick() is used to schedule a callback to be executed immediately after the current operation completes, but before the event loop continues. It has the highest priority among the three and is executed before any other I/O events or timers.

setTimeout() is used to schedule a callback to be executed after a specified delay in milliseconds. It is added to the timer queue and executed after all I/O events have been processed.

setImmediate() is used to schedule a callback to be executed in the next iteration of the event loop, immediately after I/O events have been processed. It has a lower priority than process.nextTick() but higher than setTimeout().

Therefore, the order of execution would be:

* process.nextTick()
* setImmediate()
* setTimeout()

However, it’s important to note that the exact order of execution can vary depending on the number of callbacks queued up for each method and their respective priorities.
</details>
<details>
<summary><b>Difference between spawn() and fork() methods.</b></summary>
In node.js, spawn() and fork() are two methods used to create child processes. While both methods are used to create child processes, they have different use cases and execution orders.

spawn() is used to initiate a command in a new process. It returns a child process instance that implements the EventEmitter API. Handlers for events can be attached or registered to the child instance created. Some of the events that can be attached or registered on that child instances are disconnect, error, close, and message, etc.

fork() is used to create a new Node.js process and execute a specified module in that process. It is a special case of the spawn() method where the new Node.js process runs the same code as the parent process, but with a different environment.

The main difference between the two methods is that spawn() creates a new process through command rather than running on the same node process, while fork() creates a new V8 instance and runs on the same node process as the parent.

Therefore, if you want to create a new Node.js process that runs the same code as the parent process, but with a different environment, you should use fork(). If you want to initiate a command in a new process, you should use spawn().
</details>

<details>
<summary><b>How does Node.js handle child threads?</b></summary>

Node.js is single-threaded, which means it executes one operation at a time in a single sequence or thread. However, Node.js is built on the V8 JavaScript engine, which is multi-threaded. It uses multiple threads in the background for certain tasks like asynchronous I/O operations, but your JavaScript code runs in a single thread in the event loop.

For CPU-intensive tasks, Node.js provides the `child_process` module that allows you to create new processes. Each child process runs on its own thread and has its own memory space. Here's an example of how you can use the `child_process` module to create a new process:

```js
const { spawn } = require('child_process');
const child = spawn('ls', ['-lh', '/usr']);

child.stdout.on('data', (data) => {
  console.log(`stdout: ${data}`);
});

child.stderr.on('data', (data) => {
  console.error(`stderr: ${data}`);
});

child.on('close', (code) => {
  console.log(`child process exited with code ${code}`);
});
```

In this code, `spawn` creates a new process that runs the `ls -lh /usr` command. The `stdout` and `stderr` events allow you to read data from the child process, and the `close` event is emitted when the child process ends.

In addition, Node.js also provides the `worker_threads` module that allows you to run JavaScript in parallel via threads, each with their own event loop.

Remember, while multi-threading can be powerful, it can also make your code more complex and harder to reason about. It's often better to stick with the single-threaded model unless you have a good reason to use child processes or worker threads.
</details>

<details>
<summary><b>How would you handle exceptions in Node.js? Can you explain the process domains in error handling?</b></summary>

In Node.js, error handling can be done in several ways:

1. **Try/Catch**: This is used for synchronous code. Any errors that are thrown in a try block are immediately caught in the catch block and can be handled there.

```js
try {
  // Code that may throw an error
} catch (error) {
  // Handle the error
}
```

2. **Error-first Callbacks**: This is a common pattern for asynchronous code. The first argument of the callback function is reserved for an error object. If an error occurred, it will be passed as the first argument to the callback.

```js
fs.readFile('/foo.txt', function(err, data) {
  if (err) {
    // Handle the error
  } else {
    // No error occurred, process the data
  }
});
```

3. **Event Listeners**: Certain Node.js objects (called "emitters") emit named events that cause function objects ("listeners") to be called. When an `error` event is emitted, the listeners for that event get called with the error object.

```js
const server = http.createServer();
server.on('error', (error) => {
  // Handle the error
});
```

4. **Promises**: Promises are a pattern that can be used with asynchronous code. They represent a value that may not be available yet. Promises can be in one of three states: pending, fulfilled, or rejected. If a promise is rejected, the error can be handled in a `catch` block.

```js
doSomethingAsync()
  .then(result => {
    // Process the result
  })
  .catch(error => {
    // Handle the error
  });
```

5. **Async/Await**: This is a new pattern for handling asynchronous operations that makes it possible to use try/catch with asynchronous code.

```js
async function foo() {
  try {
    const result = await doSomethingAsync();
    // Process the result
  } catch (error) {
    // Handle the error
  }
}
```

6. **Domains**: Domains are a feature of Node.js that allow you to group different I/O operations together and handle their errors at once. Domains provide a way to handle multiple different I/O operations as a single group. Domains can be used to handle uncaught exceptions and other unexpected errors more gracefully.

```js
const domain = require('domain');
const serverDomain = domain.create();

serverDomain.run(() => {
  // Server logic here
});

serverDomain.on('error', (error) => {
  // Handle the error
});
```

Remember, unhandled errors often result in the Node.js process terminating. Therefore, it's important to handle all errors appropriately in your Node.js applications to ensure they continue running smoothly.
</details>

<details>
<summary><b>How does the V8 engine work and how does Node.js use it?</b></summary>

The V8 engine is a JavaScript engine developed by Google. It's designed to interpret JavaScript code and execute it. Here's a simplified explanation of how it works:

1. **Parsing**: The V8 engine parses the JavaScript code into an Abstract Syntax Tree (AST).
2. **Compilation**: The AST is then converted into bytecode.
3. **Execution**: The bytecode is executed.
4. **Optimization**: While the bytecode is being executed, the V8 engine collects information about the code's execution. This information is used to optimize the code, making it run faster.
5. **Deoptimization**: If the assumptions made during the optimization step are violated, the V8 engine will deoptimize the code, reverting it back to the original bytecode.

As for Node.js, it uses the V8 engine to run JavaScript code. Node.js is essentially a C++ program that embeds the V8 engine. It adds additional features to the V8 engine, such as the ability to perform I/O operations, handle HTTP requests, and more. This allows Node.js to use JavaScript for server-side programming, which was traditionally done with languages like PHP, Python, or Ruby. The V8 engine enables Node.js to execute JavaScript code at high speed, making it suitable for real-time applications.
</details>

<details>
<summary><b>What is the event loop in Node.js and how does it work?</b></summary>

The event loop in Node.js is a mechanism that allows Node.js to perform non-blocking I/O operations, despite JavaScript being single-threaded. It works by offloading operations to the system kernel whenever possible. Here's a simplified explanation of how it works:

1. **Initialization**: When Node.js starts, it initializes the event loop and processes the provided input script, which may make async API calls, schedule timers, or call `process.nextTick()`, then begins processing the event loop.

2. **Phases**: The event loop consists of several phases, each with a FIFO queue of callbacks to execute. When the event loop enters a given phase, it will perform any operations specific to that phase, then execute callbacks in that phase's queue until the queue has been exhausted or the maximum number of callbacks has executed. After that, the event loop will move to the next phase.

3. **Task Execution**: The event loop executes tasks from the event queue only when the call stack is empty, i.e., there is no ongoing task. This allows us to use callbacks and promises.

4. **Task Scheduling**: If an operation is completed, the kernel tells Node.js, and the respective callback assigned to that operation is added to the event queue, which will eventually be executed.

5. **Endless Loop**: The event loop is an endless loop, which waits for tasks, executes them, and then sleeps until it receives more tasks.

This mechanism allows Node.js to handle multiple operations in the background, making it memory efficient and suitable for non-blocking, asynchronous programming.
</details>

<details>
<summary><b>Can you explain how `require()` function works in Node.js?</b></summary>

The `require()` function in Node.js is used to include modules in your application. It's a built-in function that's part of the CommonJS module system. Here's how it works:

1. **Resolving and Loading**: When Node invokes the `require()` function with a file path as its only argument, it decides which module to load. It first tries to load a core module. If the path in the `require()` function begins with `./` or `../`, it will try to load a developer module. If no file is found, it will try to find a folder with `index.js` in it. If the file is still not found, then an error is thrown.

2. **Wrapping**: Once the module is loaded, the module code is wrapped in a special function which gives it a private scope or local scope. This is done to prevent the loaded file from being accessed globally.

3. **Execution**: The code of the module or the code inside the wrapper function is run by the Node.js runtime.

4. **Returning Exports**: The `require()` function returns the exports of the required module. These exports are stored in `module.exports`. If you want to export multiple functions or variables, you can use `exports`.

5. **Caching**: All modules are cached after the first time they are loaded. This means that if you `require()` the same module multiple times, you will get the same result. The code and modules are executed in the first call, and in subsequent calls, results are retrieved from the cache.

Here's an example:

```js
// utils.js
const getFullName = (firstname, lastName) => {
  return `My fullname is ${firstname} ${lastName}`;
};
module.exports = getFullName;

// index.js
const getFullName = require('./utils.js');
console.log(getFullName('John', 'Doe')); // My fullname is John Doe
```

In this example, the `getFullName` function is exported from the `utils.js` module and then included in the `index.js` file using the `require()` function.
</details>

<details>
<summary><b>What is `Buffer` in Node.js and when do you use it?</b></summary>

In Node.js, `Buffer` is a class that is used to handle binary data. It refers to a specific location in memory that temporarily stores binary data. Buffers are similar to arrays, but they only deal with binary data and are not resizable. Each integer in a buffer represents a byte.

Buffers are particularly useful when dealing with TCP streams or performing read-write operations on the file system. This is because JavaScript is great with Unicode-encoded strings, but it does not handle binary data very well. 

Here are some methods to perform operations on Buffer:
- `Buffer.alloc(size)`: Creates a buffer and allocates size to it.
- `Buffer.from(initialization)`: Initializes the buffer with given data.
- `Buffer.write(data)`: Writes the data on the buffer.
- `toString()`: Reads data from the buffer and returns it.
- `Buffer.isBuffer(object)`: Checks whether the object is a buffer or not.
- `Buffer.length`: Returns the length of the buffer.
- `Buffer.copy(buffer,subsection size)`: Copies data from one buffer to another.
- `Buffer.slice(start, end=buffer.length)`: Returns the subsection of data stored in a buffer.
- `Buffer.concat([buffer,buffer])`: Concatenates two buffers.

Here's an example of how to use Buffer in Node.js:

```js
const buffer1 = Buffer.alloc(100);
const buffer2 = new Buffer('GFG');
const buffer3 = Buffer.from([1, 2, 3, 4]);
buffer1.write("Happy Learning");
const a = buffer1.toString('utf-8');
console.log(a); // Happy Learning
console.log(Buffer.isBuffer(buffer1)); // true
console.log(buffer1.length); // 100
const bufferSrc = new Buffer('ABC');
const bufferDest = Buffer.alloc(3);
bufferSrc.copy(bufferDest);
const Data = bufferDest.toString('utf-8');
console.log(Data); // ABC
const bufferOld = new Buffer('GeeksForGeeks');
const bufferNew = bufferOld.slice(0, 4);
console.log(bufferNew.toString()); // Geek
const bufferOne = new Buffer('Happy Learning ');
const bufferTwo = new Buffer('With GFG');
const bufferThree = Buffer.concat([bufferOne, bufferTwo]);
console.log(bufferThree.toString()); // Happy Learning With GFG
```
</details>

<details>
<summary><b>What is the purpose of module.exports in Node.js?</b></summary>

In Node.js, `module.exports` is used to export any literal, function, or object as a module. It defines the values that the module exports. "Exporting" is simply making objects or values available for other modules to import and use. Therefore, we can export any value or function or other object we would like to export by attaching it as a property of the `module.exports` object.

When you declare a `module.exports` object in a file, you specify the values to be exported from that file. When exported, another module can import these values with the `require` global method. Here's an example:

```js
// utility.js
const replaceStr = (str, char, replacer) => {
  const regex = new RegExp(char, "g");
  const replaced = str.replace(regex, replacer);
  return replaced;
};
module.exports = { replaceStr }; // exporting the function

// app.js
const { replaceStr } = require('./utility.js'); // importing the function
console.log(replaceStr("Hello, world!", "world", "Node.js")); // "Hello, Node.js!"
```

In this example, the `replaceStr` function is exported from the `utility.js` module and then included in the `app.js` file using the `require()` function. This allows the `replaceStr` function to be used in `app.js`.
</details>

<details>
<summary><b>What are some security mechanisms you can implement in a Node.js application?</b></summary>

There are several security mechanisms that you can implement in a Node.js application:

1. **Choosing Dependencies**: Be careful when choosing third-party dependencies. Always prefer packages that are actively maintained, have a large number of downloads, and a good reputation in the community.

2. **Managing Access and Content**: Manage the access and content of public and private data stores such as npm and GitHub.

3. **Writing Defensive Code**: Always assume that inputs are malicious. Validate and sanitize all inputs to your application.

4. **Limiting Required Execution Privileges**: Run your application with the least privileges necessary.

5. **Support for Logging and Monitoring**: Implement logging and monitoring to detect and respond to security incidents quickly.

6. **Externalizing Secrets**: Never hard-code sensitive information. Use environment variables or other secure means to store and access sensitive data.

7. **Maintaining a Secure and Up-to-date Foundation**: Regularly update your Node.js version, dependencies, and operating system to the latest stable versions.

8. **Maintaining Individual Modules**: Regularly update and check individual modules for security vulnerabilities.

9. **Use Flat Promise Chains**: Asynchronous callback functions are one of the strongest features of Node.js. However, increasing layers of nesting within callback functions can become a problem. Any multistage process can become nested 10 or more levels deep. This problem is referred to as a "Pyramid of Doom" or "Callback Hell. In such code, the errors and results get lost within the callback. Promises are a good way to write asynchronous code without getting into nested pyramids.

Remember, security is a continuous process and should be incorporated into every stage of application development and deployment.
</details>

<details>
<summary><b>What are streams in Node.js and how do you use them?</b></summary>

Streams are one of the fundamental concepts of Node.js. They are a type of data-handling method and are used to read or write input into output sequentially. Streams are used to handle reading/writing files, network communications, or any kind of end-to-end information exchange in an efficient way.

There are four types of streams in Node.js:
- **Readable**: Streams from which data can be read. Example: `fs.createReadStream()`.
- **Writable**: Streams to which data can be written. Example: `fs.createWriteStream()`.
- **Duplex**: Streams that are both readable and writable. Example: `net.socket`.
- **Transform**: Streams that can modify or transform the data as it is written and read. Example: `zlib.createDeflate()`.

Here's an example of how to use streams in Node.js:

```js
const fs = require('fs');
const readStream = fs.createReadStream('input.txt');
const writeStream = fs.createWriteStream('output.txt');

readStream.on('data', (chunk) => {
  writeStream.write(chunk);
});

readStream.on('end', () => {
  console.log('Finished reading and writing.');
});
```

In this example, a readable stream is created from the file `input.txt` and a writable stream is created for the file `output.txt`. The `data` event is emitted whenever there is data available to read. The `end` event is emitted when there is no more data to read.
</details>

<details>
<summary><b>How do you debug a Node.js application?</b></summary>

Debugging a Node.js application can be done in several ways:

1. **Node.js Inspector**: Node.js has a built-in debugging client. When started with the `--inspect` switch, a Node.js process listens for a debugging client. By default, it will listen at host and port `127.0.0.1:9229`. Each process is also assigned a unique UUID. Inspector clients must know and specify host address, port, and UUID to connect. A full URL will look something like `ws://127.0.0.1:9229/0f2c936f-b1cd-4ac9-aab3-f63b0f33d55e`.

2. **Visual Studio Code**: Visual Studio Code has built-in debugging support for the Node.js runtime. You can use auto attach to debug processes you run in VS Code's integrated terminal. You can also use a launch config to start your program, or attach to a process launched outside of VS Code.

3. **Chrome DevTools**: You can also use Chrome DevTools to debug your Node.js application. Open `chrome://inspect` in a Chromium-based browser. Then, click on the "Open dedicated DevTools for Node" link.

4. **npm debug**: You can use the `debug` module from npm. To install debug, run `npm install debug --save`. Then, in your code, you can require the debug module and use it to log debugging information. For example:
```js
var debug = require('debug')('your module');
debug('msg', 'more details');
```
To start debugging all the application run the following: `DEBUG=* node myApp.js`.

Remember, it's important to understand the security implications of exposing the debugger port on public and private networks.
</details>

<details>
<summary><b>What is event-driven programming in Node.js and how does it work?</b></summary>

Event-driven programming in Node.js is a logical pattern that allows Node.js to handle user interaction, I/O operations, and real-time data processing in a non-blocking manner. This results in enhanced performance and a smoother experience for the user. Here's how it works:

1. **Initialization**: Once a Node.js server starts, it initializes its variables and functions, then waits for an event to occur.

2. **Event Handler**: A callback function, also known as an event handler, is called when an event is triggered. This function is responsible for handling the event.

3. **Event Loop**: An event loop listens for event triggers and calls the corresponding event handler for that event. This loop continues to poll for new events and calls the matching event handlers.

4. **EventEmitter**: The EventEmitter is a Node.js module that allows objects to communicate with one another. Many of Node's built-in modules inherit from EventEmitter. An emitter object emits named events, which trigger listeners that have already been registered.

Here's an example of how to use event-driven programming in Node.js:

```js
const events = require('events');
const eventEmitter = new events.EventEmitter();

const connectHandler = function connected() {
  console.log('Connection established.');
  eventEmitter.emit('data_received');
}

eventEmitter.on('connection', connectHandler);

eventEmitter.on('data_received', function() {
  console.log('Data Transfer Successful.');
});

eventEmitter.emit('connection');

console.log("Finish");
```

In this example, the handler named `connectHandler` is bound with the event `connection`. The callback function is triggered when the event is emitted. This allows Node.js to handle real-time data in a highly efficient manner.
</details>

<details>
<summary><b>What is the difference between `spawn()`, `exec()`, and `fork()` methods in Node.js?</b></summary>

In Node.js, `spawn()`, `exec()`, and `fork()` are methods provided by the `child_process` module to create new child processes. Here's how they differ:

1. **spawn()**: The `spawn()` method launches a new process with a given command. It returns a stream with `data`, `error` and `end` events¹. This method is best suited for processes that produce large amounts of data and can be used to read or write data sequentially.

2. **exec()**: The `exec()` method is similar to `spawn()`, but it runs a shell command in a new process. It buffers the command's generated output and passes the whole output value to a callback function (if one was provided) or returns a promise if no callback was provided. This method is best suited for processes that produce a limited amount of data.

3. **fork()**: The `fork()` method is a special case of `spawn()` that creates a new instance of the V8 engine. It creates a new Node.js process and invokes a specified module with an IPC communication channel established that allows sending messages between parent and child.

Remember, the choice between `spawn()`, `exec()`, and `fork()` depends on the specific needs of your application.
</details>

<details>
<summary><b>Difference between promise and async/await.</b></summary>

In JavaScript, **Promises** and **async/await** are both used to handle asynchronous operations. Promises are a pattern for handling async operations, while async/await is a syntax sugar built on top of Promises to make it easier to handle async operations. 

Promises are objects that represent the eventual completion (or failure) of an asynchronous operation and allow you to handle the result of that operation when it's ready. Promises have three states: `pending`, `fulfilled`, and `rejected`. You can use `.then()` method to handle a fulfilled promise and `.catch()` method to handle a rejected promise. 

Async/await is used to work with Promises in asynchronous functions. It is basically syntactic sugar for Promises and makes asynchronous code look more like synchronous/procedural code, which is easier to understand. The `await` keyword can only be used in async functions. It is used for calling an async function and waits for it to resolve or reject. `await` blocks the execution of the code within the async function in which it is located.

Here's a summary of the differences between Promises and async/await:

| **Promises** | **Async/Await** |
|--------------|-----------------|
| A pattern for handling async operations | Syntactic sugar built on top of Promises |
| Uses `.then()` method to handle a fulfilled promise and `.catch()` method to handle a rejected promise | Uses `try` block for a successfully resolved promise and `catch` block for a rejected promise |
| Can be used with any function that returns a Promise | Can only be used with functions that return Promises |
| Can be difficult to read and understand | Makes asynchronous code look more like synchronous/procedural code, which is easier to understand |
</details>
<details>
<summary><b>What is micro-service?</b></summary>

In the field of software application development, **microservices** are a form of service-oriented architecture that involves building a single application with lightweight protocols by interconnecting small services. 

**Node.js** is a popular choice for developing microservices because it uses an event-driven architecture and enables efficient, real-time application development. 

Here are some benefits of using microservices with Node.js:

- Scalability: Microservices allow you to scale only what is required, saving time and effort and, as a result, money.
- Modularity: The integration of smaller services improves the modularity of the single monolithic app.
- Flexibility: Microservices are loosely coupled, also referred to as distributed applications. A fault in one component won’t affect the functionality of the entire software product.
</details>
<details>
<summary><b>How micro-service communicate with each others?</b></summary>

In a microservice architecture, communication between services is made possible through an inter-service communication protocol like HTTP (s), gRPC, or message brokers.

Node.js provides easy and fast integration with most of the latest message brokers such as RabbitMQ and Kafka. Microservices can communicate with each other via various communication mechanisms. We can use either a synchronous, request-response-based communication strategy or an asynchronous, event-based communication strategy for inter-microservice communication.

For synchronous requests, we can use a proxy such as Nginx, Amazon API Gateway, etc.

For asynchronous requests, we can use queues such as RabbitMQ, Amazon SQS, etc4.
</details>
<details>
<summary><b>Events is nodejs.</b></summary>
Node.js is a JavaScript runtime that is designed to be event-driven. In Node.js, every action on a computer is an event, such as when a connection is made or a file is opened. Objects in Node.js can fire events, and the events module in Node.js allows you to create, fire, and listen for your own events.

For example, you can create an EventEmitter object and assign event handlers to your own events with it. When a specific event is fired, the assigned event handler function will be executed.

Here’s an example of how to use the events module in Node.js:

```js
// Import the events module
var events = require('events');

// Create an EventEmitter object
var eventEmitter = new events.EventEmitter();

// Create an event handler function
var myEventHandler = function() {
  console.log('Hello World!');
}

// Assign the event handler function to an event
eventEmitter.on('hello', myEventHandler);

// Fire the 'hello' event
eventEmitter.emit('hello');
```
When you run this code, it will output Hello World! to the console because the myEventHandler function was executed when the hello event was fired.
</details>
