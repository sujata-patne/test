https://www.interviewbit.com/node-js-interview-questions/?utm_source=midfunnel&utm_medium=email
https://www.interviewbit.com/rest-api-interview-questions/#can-we-implement-transport-layer-security-in-rest

-	Node.Js Interview Questions
-	Node.js is a virtual machine that uses JavaScript as its scripting language and runs Chrome’s V8 JavaScript engine. Basically, Node.js is based on an event-driven architecture where I/O runs asynchronously making it lightweight and efficient. It is being used in developing desktop applications as well with a popular framework called electron as it provides API to access OS-level features such as file system, network, etc.
LEARN MORE	
-	How do you manage packages in your node.js project?
	It can be managed by a number of package installers and their configuration file accordingly. Out of them mostly use npm or yarn. Both provide almost all libraries of javascript with extended features of controlling environment-specific configurations. To maintain versions of libs being installed in a project we use package.json and package-lock.json so that there is no issue in porting that app to a different environment.
-	How is Node.js better than other frameworks most popularly used?
Node.js provides simplicity in development because of its non-blocking I/O and even-based model results in short response time and concurrent processing, unlike other frameworks where developers have to use thread management.
It runs on a chrome v8 engine which is written in c++ and is highly performant with constant improvement.
Also since we will use Javascript in both the frontend and backend the development will be much faster.
And at last, there are ample libraries so that we don’t need to reinvent the wheel.
-	Explain the steps how “Control Flow” controls the functions calls?
Control the order of execution
Collect data
Limit concurrency
Call the following step in the program.
-	What is an event-loop in Node JS?
Whatever that is async is managed by event-loop using a queue and listener. We can get the idea using the following diagram:
Nodejs Event Loop
Node.js Event Loop
So when an async function needs to be executed(or I/O) the main thread sends it to a different thread allowing v8 to keep executing the main code. Event loop involves different phases with specific tasks such as timers, pending callbacks, idle or prepare, poll, check, close callbacks with different FIFO queues. Also in between iterations it checks for async I/O or timers and shuts down cleanly if there aren't any.
-	What is node.js streams?
Streams are instances of EventEmitter which can be used to work with streaming data in Node.js. They can be used for handling and manipulating streaming large files(videos, mp3, etc) over the network. They use buffers as their temporary storage.
There are mainly four types of the stream:
Writable: streams to which data can be written (for example, fs.createWriteStream()).
Readable: streams from which data can be read (for example, fs.createReadStream()).
Duplex: streams that are both Readable and Writable (for example, net.Socket).
Transform: Duplex streams that can modify or transform the data as it is written and read (for example, zlib.createDeflate()).
-	For Node.js, why Google uses V8 engine?
Well, are there any other options available? Yes, of course, we have Spidermonkey from Firefox, Chakra from Edge but Google’s v8 is the most evolved(since it’s open-source so there’s a huge community helping in developing features and fixing bugs) and fastest(since it’s written in c++) we got till now as a JavaScript and WebAssembly engine. And it is portable to almost every machine known.
Enhancing Node.js performance through clustering.
Node.js applications run on a single processor, which means that by default they don’t take advantage of a multiple-core system. Cluster mode is used to start up multiple node.js processes thereby having multiple instances of the event loop. When we start using cluster in a nodejs app behind the scene multiple node.js processes are created but there is also a parent process called the cluster manager which is responsible for monitoring the health of the individual instances of our application.
Clustering in Nodejs
Clustering in Node.js
-	What is WASI and why is it being introduced?
Web assembly provides an implementation of WebAssembly System Interface specification through WASI API in node.js implemented using WASI class. The introduction of WASI was done by keeping in mind its possible to use the underlying operating system via a collection of POSIX-like functions thus further enabling the application to use resources more efficiently and features that require system-level access.