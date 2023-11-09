<h2> React.js interview question </h2>

<details>
<summary><b>Feature of react</b></summary>

* JSX (JavaScript Syntax Extension)
* Virtual DOM
* One-way data binding
* Performance
* Extensions
* Conditional statements
* Components
* Simplicity

</details>

<details>
<summary><b>Lifecycle of react.</b></summary>

In React, each component goes through a lifecycle from creation to deletion. This lifecycle can be divided into three main phases:

1. **Mounting**: This is the phase in which the component is being created and inserted into the DOM. The methods called in this phase are:
    - `constructor()`: This method is called before the component is mounted.
    - `static getDerivedStateFromProps()`: This method is called right before rendering the output.
    - `render()`: This method is required and will always be called, it returns the JSX to render.
    - `componentDidMount()`: This method is called after the component output has been rendered to the DOM.

2. **Updating**: This is the phase in which the component is re-rendered as a result of changes to either its props or state. The methods called in this phase are:
    - `static getDerivedStateFromProps()`: This method is the first method called during the update phase.
    - `shouldComponentUpdate()`: This method determines if the component should be updated.
    - `render()`: This method returns the updated JSX.
    - `getSnapshotBeforeUpdate()`: This method is called right before the updated output is committed to the DOM.
    - `componentDidUpdate()`: This method is called after the updated output is committed to the DOM.

3. **Unmounting**: This is the final phase in which the component is being removed from the DOM. The method called in this phase is:
    - `componentWillUnmount()`: This method is called immediately before the component is unmounted and destroyed.

In addition to these, there is one more phase called "Error Handling" for catching errors anywhere in the child component tree. The methods in this phase are:
- `static getDerivedStateFromError()`: This method is called during the "render" phase, so side-effects are not permitted.
- `componentDidCatch()`: This method is called during the "commit" phase, so side-effects are permitted.

These lifecycle methods provide hooks to run code at key times in a component's lifecycle.

In functional components, the lifecycle methods of class components are replaced by React Hooks. Here’s how you can think of them in terms of class lifecycle methods:

componentDidMount: This lifecycle method is replaced by the useEffect hook in functional components. If you pass an empty array [] as the second argument to useEffect, it acts like componentDidMount, meaning the effect function will run once after the initial render.

componentDidUpdate: This lifecycle method is also replaced by the useEffect hook. If you pass a value or values in the array as the second argument to useEffect, the effect function will run when those values change.

componentWillUnmount: This lifecycle method is replaced by the cleanup function in useEffect. The cleanup function will run when the component unmounts, similar to componentWillUnmount.

Here’s an example of how these hooks can be used in a functional component:
```js
import React, { useState, useEffect } from 'react';

function MyComponent() {
  const [count, setCount] = useState(0);

  // Similar to componentDidMount and componentDidUpdate:
  useEffect(() => {
    // Update the document title using the browser API
    document.title = `You clicked ${count} times`;

    // Similar to componentWillUnmount:
    return () => {
      document.title = 'React App';
    };
  }, [count]); // Only re-run the effect if count changes

  return (
    <div>
      <p>You clicked {count} times</p>
      <button onClick={() => setCount(count + 1)}>
        Click me
      </button>
    </div>
  );
}
```

In this example, useState is used to declare a new state variable count, and useEffect is used to perform side effects in the component. The effect updates the document title whenever count changes, and resets the title when the component unmounts.
</details>

<details>
<summary><b>Explain React.Component and React.PureComponent.</b></summary>

In React, there are two types of components: `React.Component` and `React.PureComponent`. The main difference between them lies in the way they handle updates and re-rendering.

- **React.Component**: This is the base class for React components. When state or props change, a component re-renders. However, `React.Component` does not implement `shouldComponentUpdate()`, so the component re-renders by default whenever `forceUpdate()` is called or when parent components pass new props.

```js
import React from 'react';

class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
  }

  incrementCount = () => {
    this.setState({ count: this.state.count + 1 });
  };

  render() {
    return (
      <div>
        <p>Count: {this.state.count}</p>
        <button onClick={this.incrementCount}>Increment</button>
      </div>
    );
  }
}
```
- **React.PureComponent**: This is similar to `React.Component`, but it implements `shouldComponentUpdate()` with a shallow prop and state comparison. This means `React.PureComponent` only re-renders if there are changes in state or props. It does a shallow comparison of the current props and state against the new set of props and state. If the props and state are the same, `React.PureComponent` prevents the re-render, potentially improving performance.

```js
import React from 'react';

class MyPureComponent extends React.PureComponent {
  constructor(props) {
    super(props);
    this.state = { count: 0 };
  }

  incrementCount = () => {
    this.setState({ count: this.state.count + 1 });
  };

  render() {
    return (
      <div>
        <p>Count: {this.state.count}</p>
        <button onClick={this.incrementCount}>Increment</button>
      </div>
    );
  }
}
```

In these examples, both MyComponent and MyPureComponent have a count state that increments when a button is clicked. The difference is that MyPureComponent (which extends React.PureComponent) will not re-render if the props and state are the same, potentially improving performance.


You might choose to use `React.PureComponent` over `React.Component` if:
- State/Props should be an immutable object.
- State/Props should not have a hierarchy.
- You should call `forceUpdate()` when data changes.

However, you should be aware that `React.PureComponent`'s shallow comparison only checks if the references have changed, not the actual data. So, if you have complex data structures, you might need to implement your own `shouldComponentUpdate()` method or use libraries like Immutable.js to create immutable data structures.

In summary, the choice between `React.Component` and `React.PureComponent` depends on the specific requirements of your component and the performance needs of your application.
</details>

<details>
<summary><b>Controlled component and Uncontrolled component</b></summary>

* Controlled Components:

  These are the components where the state and behaviors are controlled by Parent components.
  In React, Controlled Components are those in which form’s data is handled by the component’s state.
  It takes its current value through props and makes changes through callbacks like onClick, onChange, etc.
  A parent component manages its own state and passes the new values as props to the controlled component.

* Uncontrolled Components:

  Uncontrolled components are the ones having control of their own state and manage the behaviors on themselves.
  Uncontrolled Components are the components that are not controlled by the React state and are handled by the DOM (Document Object Model).
  So in order to access any value that has been entered we take the help of refs.

Here is an example of each:

Controlled Component:
```js
import { useState } from "react";
function App () {
    const [name, setName] = useState ("");
    function handleSubmit () {
        alert (`Name: $ {name}`);
    }
    return (
        <form onSubmit= {handleSubmit}>
            <label>Name:</label>
            <input type="text" name="name" value={name} onChange={e => setName(e.target.value)} />
            <button type="submit">Submit</button>
        </form>
    );
}
export default App;
```

Uncontrolled Component:
```js
import React, { useRef } from "react";
function App () {
    const inputRef = useRef (null);
    function handleSubmit () {
        alert (`Name: $ {inputRef.current.value}`);
    }
    return (
        <form onSubmit= {handleSubmit}>
            <label>Name :</label>
            <input type="text" name="name" ref= {inputRef} />
            <button type="submit">Submit</button>
        </form>
    );
}
export default App;
```

In summary, controlled and uncontrolled components are two different approaches to managing the state of React components. Controlled components are useful when you need to manage the state of a component from a parent component, while uncontrolled components are useful when you need to manage the state of a component internally.

</details>

<details>
<summary><b>What is useRef?</b></summary>
useRef is a React Hook that lets you reference a value that’s not needed for rendering. It returns a mutable ref object whose .current property is initialized to the passed argument (initialValue). The returned object will persist for the full lifetime of the component.

Here are some key points about useRef:

* It’s used to store a mutable value that does not cause a re-render when updated.
* It can be used to access a DOM element directly.
* Changing a ref does not trigger a re-render, making refs perfect for storing information that doesn’t affect the visual output of your component.
* You can mutate the ref.current property. However, if it holds an object that is used for rendering (for example, a piece of your state), then you shouldn’t mutate that object.
* When you change the ref.current property, React does not re-render your component. React is not aware of when you change it because a ref is a plain JavaScript object.
* Do not write or read ref.current during rendering, except for initialization.

Here’s an example of how to use useRef:
```js
import { useRef } from 'react';

function MyComponent() {
    const intervalRef = useRef(0);
    const inputRef = useRef(null);
    // ...
}
```
In this example, intervalRef and inputRef are references that can be used throughout the component.
</details>

<details>
<summary><b>What is useReducer?</b></summary>
useReducer is a React Hook that allows you to manage complex state logic in your components. It’s similar to useState but gives you more control over the state updates

The basic structure of useReducer is as follows

```js
const [state, dispatch] = useReducer(reducer, initialState);
```
Here, reducer is a function that determines how the state should be updated based on an action. It takes the current state and an action, and returns the new state.

initialState is the initial state of your component.

dispatch is a function that you can call to dispatch an action, which will trigger a state update.

Here’s an example of how you might use useReducer in a todo app:

```js
import { useReducer } from "react";

const initialTodos = [
  {
    id: 1,
    title: "Todo 1",
    complete: false,
  },
  {
    id: 2,
    title: "Todo 2",
    complete: false,
  },
];

const reducer = (state, action) => {
  switch (action.type) {
    case "COMPLETE":
      return state.map((todo) => {
        if (todo.id === action.id) {
          return { ...todo, complete: !todo.complete };
        } else {
          return todo;
        }
      });
    default:
      return state;
  }
};

function Todos() {
  const [todos, dispatch] = useReducer(reducer, initialTodos);

  const handleComplete = (todo) => {
    dispatch({ type: "COMPLETE", id: todo.id });
  };

  return (
    <>
      {todos.map((todo) => (
        <div key={todo.id}>
          <label>
            <input
              type="checkbox"
              checked={todo.complete}
              onChange={() => handleComplete(todo)}
            />
            {todo.title}
          </label>
        </div>
      ))}
    </>
  );
}
```
Here’s an example of how you might use useReducer in a counter app:
```js
import React, {useReducer} from 'react';

const initialState = { count: 0 };

function reducer(action, state) {
    switch(action.type) {
        case 'increment':
            return { count: state.count + 1};
        case 'decrement':
            return {count: state.count -1 };
        default:
            throw new Error('')
    }
}

function Counter() {
    const [state, dispatch] = useReducer(reducer, initialState);

    return (
        <>
            Counter Example
            Count: {state.count}
            <button onClick={() => dispatch({ type: 'increment'})}>+</button>
            <button onClick={() => dispatch({ type: 'decrement'})}>-</button>
        </>
    )
}

const rootElement = document.getElementById('root');

const root = createRoot(rootElement);

root.render(
    <StrictMode>
        <Counter />
    </StrictMode>
)
```

</details>

<details>
<summary><b>How to update an object state based on user input in React</b></summary>

Sure, you can update an object state based on user input in React. Here's an example:

```js
import React, { useState } from 'react';

function MyComponent() {
  const [state, setState] = useState({
    fName: '',
    lName: ''
  });

  const handleChange = e => {
    const { name, value } = e.target;
    setState(prevState => ({
      ...prevState,
      [name]: value
    }));
  };

  return (
    <div>
      <input value={state.fName} type="text" onChange={handleChange} name="fName" placeholder="First Name" />
      <input value={state.lName} type="text" onChange={handleChange} name="lName" placeholder="Last Name" />
    </div>
  );
}
```

In this example, `handleChange` function updates the state based on the input field's name and value. The `name` attribute in the input tag should match the key name in the state object. When you type into the input field, the `handleChange` function is called, and the state is updated with the input value. The component re-renders, and the new value is displayed in the input field.

</details>

<details>
<summary><b>useMemo vs React.memo</b></summary>

useMemo and React.memo are both features in React that use memoization to optimize performance, but they are used in different scenarios.

useMemo is a hook that returns a memoized value. It takes a function and dependencies as parameters. The function runs when the component renders. useMemo will only recompute the memoized value when one of the dependencies has changed. This optimization helps to avoid expensive calculations on every render.

Here’s an example of how you might use useMemo:
```js
import React, { useMemo } from 'react';

function Component({ value }) {
  const computedValue = useMemo(() => {
    // Perform expensive computation here
    return expensiveComputation(value);
  }, [value]);

  // ...
}
```

React.memo is a higher-order component that memoizes the result of a function component. It takes a component and returns a new component that will prevent re-renders if the props are the same. This can be useful when rendering of the component is expensive.

Here’s an example of how you might use React.memo:
```js
import React from 'react';

function Component({ value }) {
  // ...
}

export default React.memo(Component);
```

In this example, the Component will only re-render if the value prop changes.

In summary, useMemo is used to memoize values, while React.memo is used to prevent unnecessary re-renders of components

</details>

<details>
<summary><b>What is interceptors?</b></summary>
In ReactJS, Axios interceptors can be used to intercept HTTP requests or responses before they are handled by `then` or `catch`. This can be useful for a variety of tasks, such as setting common headers, logging, or handling errors globally.

Here's an example of how you can use an interceptor with Axios in a ReactJS application:

```javascript
import axios from 'axios';
import React from 'react';

class App extends React.Component {
  componentDidMount() {
    // Create an instance of Axios
    const axiosInstance = axios.create({
      baseURL: 'https://api.example.com',
    });

    // Add a request interceptor
    axiosInstance.interceptors.request.use((config) => {
      // Insert logic here to manipulate the config object, add headers, etc.
      config.headers['Authorization'] = 'Bearer ' + localStorage.getItem('token');
      return config;
    }, (error) => {
      // If there's an error during the request, this block will be executed
      return Promise.reject(error);
    });

    // Add a response interceptor
    axiosInstance.interceptors.response.use((response) => {
      // This block is executed if the response is successful
      return response;
    }, (error) => {
      // If there's an error in the response, this block will be executed
      return Promise.reject(error);
    });

    // Now you can use the custom Axios instance in your API calls
    axiosInstance.get('/data')
      .then((response) => {
        console.log(response.data);
      })
      .catch((error) => {
        console.log(error);
      });
  }

  render() {
    return (
      <div>
        <h1>My React App</h1>
      </div>
    );
  }
}

export default App;
```

In this example, we're creating an instance of Axios and adding a request interceptor to it. The interceptor adds an Authorization header to every request before it's sent. We're also adding a response interceptor, which currently just returns the response as is.

This is a simple example. In a real-world application, you might want to add more complex logic to your interceptors, such as error handling, retrying requests, or logging.
</details>

<details>
<summary><b>What is Context API in React?</b></summary>

The Context API in React is a way to essentially create global variables that can be passed around in a React app. This is the alternative to "prop drilling", or passing props from grandparent to parent to child, and so on. Context is often touted as a simpler, lighter solution to using Redux for state management.

To work with Context API, you need `React.createContext`. It has two properties: Provider and Consumer. The Provider acts as a parent, it passes the state to its children, whereas the Consumer uses the state that has been passed.

Here's a simple example of how to use the Context API:

```js
import React, { useContext } from 'react';

// Create a Context
const MyContext = React.createContext();

// Create a component that uses the Context
function MyComponent() {
  const contextValue = useContext(MyContext);
  return <p>{contextValue}</p>;
}

// Use the Context Provider in the parent component
function MyApp() {
  return (
    <MyContext.Provider value="Hello, Context!">
      <MyComponent />
    </MyContext.Provider>
  );
}
```

In this example, `MyContext` is created using `React.createContext()`. `MyComponent` uses the `useContext` hook to access the value from `MyContext`. The `MyContext.Provider` component is used in `MyApp` to provide the value "Hello, Context!" to `MyComponent`
</details>

<details>
<summary><b>Explain useCallback hook.</b></summary>

The `useCallback` hook is a built-in hook in React that allows you to optimize your application by memoizing a callback function. This means that the callback function is cached and does not get redefined on every render. 

Here's an example of how you can use `useCallback`:

```js
import React, { useState, useCallback } from 'react';

function MyComponent() {
  const [count, setCount] = useState(0);

  const increment = useCallback(() => {
    setCount(count + 1);
  }, [count]);

  return (
    <div>
      Count: {count}
      <button onClick={increment}>Increment</button>
    </div>
  );
}
```

In this example, `useCallback` is used to memoize the `increment` function. The `increment` function will only be redefined if `count` changes.

The `useCallback` hook receives a function and an array of dependencies as parameters. The hook will return a memoized version of the callback that only changes if one of the dependencies has changed. If you pass an empty array of dependencies, the callback will only be defined once and never be redefined.

Please note that `useCallback` should be used sparingly because it comes with its own overhead. It's best used when passing callbacks to optimized child components that rely on reference equality to prevent unnecessary renders.
</details>

<details>
<summary><b>React18, features</b></summary>
React 18, the latest major version of React, brings several new features and improvements. Here are some key features:

1. **Automatic Batching**: React 18 introduces automatic batching, which can lead to fewer renders and improved performance.

2. **Concurrent Rendering**: This is a foundational update to React's core rendering model. It allows React to prepare multiple versions of your UI at the same time. Concurrency in React 18 is opt-in and only enabled when you use a concurrent feature.

3. **Transitions**: Transitions can be used to mark UI updates that do not need urgent resources for updating.

4. **Suspense on the Server**: In a client-rendered app, you load the HTML of your page from the server along with all the JavaScript. With Suspense, you can now also do this on the server.

5. **Strict Mode**: Strict mode in React 18 will simulate mounting, unmounting, and re-mounting the component with a previous state.

6. **New Hooks**: React 18 introduces several new hooks, including `useId`, `useTransition`, `useDeferredValue`, `useSyncExternalStore`, and `useInsertionEffect`.

7. **New Root API**: React 18 replaces `ReactDOM.render` with `ReactDOM.createRoot`.

8. **Improved Memory Usage and Dropped Support for Internet Explorer**: React 18 has improved memory usage and no longer supports Internet Explorer.

These features are built on top of React's new concurrent renderer, a behind-the-scenes change that unlocks powerful new capabilities. The release focuses on performance improvements and updating the rendering engine.
</details>

<details>
<summary><b>Explain useRef, forwardRef, and createRef.</b></summary>

1. **useRef**: `useRef` is a hook that allows you to create a mutable value that persists across renders without causing a re-render. It's commonly used to keep track of the instance of a variable or to access a DOM node directly. Here's an example:

```javascript
import { useRef } from 'react';

function MyComponent() {
  const myRef = useRef(null);

  // Access the ref within a handler function
  const handleClick = () => {
    console.log(myRef.current);
  };

  return (
    <div>
      <input ref={myRef} type="text" />
      <button onClick={handleClick}>Log ref</button>
    </div>
  );
}
```

2. **forwardRef**: `forwardRef` is a method in React that allows parent components to pass down (or "forward") refs to their children. This is particularly useful when you need to access a DOM element or component instance directly in a parent component, but the desired child element is wrapped by a higher-order component or a component that doesn’t expose the ref by default. Here's an example:

```javascript
import React, { forwardRef } from 'react';

const MyComponent = forwardRef((props, ref) => (
  <input ref={ref} type="text" />
));

function ParentComponent() {
  const inputRef = useRef(null);

  const handleClick = () => {
    inputRef.current.focus();
  };

  return (
    <div>
      <MyComponent ref={inputRef} />
      <button onClick={handleClick}>Focus Input</button>
    </div>
  );
}
```

3. **createRef**: `createRef` is a method in React that creates a ref. It's mostly used for class components. Function components typically rely on `useRef` instead. Here's an example:

```javascript
import React, { createRef, Component } from 'react';

class MyComponent extends Component {
  constructor(props) {
    super(props);
    this.myRef = createRef();
  }

  componentDidMount() {
    this.myRef.current.focus();
  }

  render() {
    return <input ref={this.myRef} type="text" />;
  }
}
```

In this example, `createRef` is used to create a ref that is attached to an input element. When the component mounts, the input element is automatically focused.
</details>

<details>
<summary><b>Custom hooks in React.</b></summary>
Custom hooks in React are a way to extract and reuse logic that is common across multiple components. They allow you to write cleaner, more maintainable code by avoiding duplication.

Let's consider a real-world example. Suppose you're building a weather application that has multiple components that need to fetch weather data from an API. Without custom hooks, you'd have to write the same data fetching and state updating logic in each component.

With custom hooks, you can extract this logic into a separate function and reuse it across components. Here's an example of a custom hook for fetching weather data:

```js
import { useState, useEffect } from 'react';

function useFetchWeatherData(city) {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch(`https://api.weatherapi.com/v1/current.json?key=YOUR_API_KEY&q=${city}`)
      .then(response => {
        if (!response.ok) {
          throw new Error('Error fetching weather data');
        }
        return response.json();
      })
      .then(data => {
        setData(data);
        setLoading(false);
      })
      .catch(error => {
        setError(error.message);
        setLoading(false);
      });
  }, [city]);

  return { data, loading, error };
}
```

In this example, `useFetchWeatherData` is a custom hook that fetches weather data for a given city. It returns the fetched data and a loading state. You can use this hook in any component that needs to display weather data, like so:

```js
import React from 'react';
import useFetchWeatherData from './useFetchWeatherData';

function WeatherComponent({ city }) {
  const { data, loading, error } = useFetchWeatherData(city);

  if (loading) {
    return <div>Loading...</div>;
  }

  if (error) {
    return <div>Error: {error}</div>;
  }

  return (
    <div>
      <h1>{data.location.name}</h1>
      <p>{data.current.temp_c}°C</p>
    </div>
  );
}
```

In this component, `useFetchWeatherData` is used to fetch and display weather data for a given city. This allows you to keep your components clean and focused on rendering, while the data fetching logic is neatly encapsulated in the custom hook.
</details>

<details>
<summary><b>What is redux?</b></summary>
Redux is an open-source JavaScript library for managing and centralizing application state. It helps you write applications that behave consistently, run in different environments (client, server, and native), and are easy to test. Redux is most commonly used with libraries such as React or Angular for building user interfaces.

Redux works by having a central store that holds the entire state of the application. Each component can access the stored state without having to send down props from one component to another.

There are three building blocks in Redux: actions, store, and reducers. Actions are events that send data from the application to the store. The store is a single source of truth that holds the application state, and reducers specify how the application's state changes in response to actions sent to the store.

Here are some key principles of Redux:
- **Single source of truth**: The state of your whole application is stored in an object tree within a single store.
- **State is read-only**: The only way to change the state is to emit an action, an object describing what happened.
- **Changes are made with pure functions**: To specify how the state tree is transformed by actions, you write pure reducers.

Redux also provides a great developer experience with features like live code editing combined with a time-traveling debugger. It's a predictable state container for JavaScript apps and is particularly well-suited for applications with many different components that need to share data.
</details>

<details>
<summary><b>Explain redux toolkit and their features.</b></summary>
Redux Toolkit is an official, opinionated, batteries-included toolset for efficient Redux development. It simplifies the most common Redux use cases, including store setup, defining reducers, immutable update logic, and even creating entire "slices" of state at once without writing any action creators or action types by hand. It also includes the most widely used Redux addons, like Redux Thunk for async logic and Reselect for writing selector functions.

Redux Toolkit provides good defaults for store setup out of the box, and includes the most commonly used Redux addons built-in. It takes inspiration from libraries like Immer and Autodux to let you write "mutative" immutable update logic, and even create entire "slices" of state automatically¹. This lets you focus on the core logic your app needs, so you can do more work with less code¹.

Here are some key features of Redux Toolkit:
- **configureStore()**: Wraps createStore to provide simplified configuration options and good defaults.
- **createSlice()**: Generates action creators and action types that correspond to the reducers and state.
- **createAsyncThunk**: Accepts a Redux action type string and a function that returns a promise, and generates a thunk that dispatches pending/fulfilled/rejected action types based on that promise.
- **createEntityAdapter**: Generates a set of reusable reducers and selectors to manage normalized data in the store.

The Redux Toolkit package wraps around the core redux package, and contains API methods and common dependencies that are essential for building a Redux app. It builds in suggested best practices, simplifies most Redux tasks, prevents common mistakes, and makes it easier to write Redux applications.
</details>

<details>
<summary><b>Difference between Redux Thunk and Redux Saga.</b></summary>
Redux Thunk and Redux Saga are both middleware libraries for Redux that handle side effects, but they do so in different ways.

**Redux Thunk** is a middleware that allows you to write action creators that return a function instead of an action. The thunk can be used to delay the dispatch of an action or to dispatch only if certain conditions are met. The inner function receives the store methods `dispatch` and `getState` as parameters.

**Redux Saga**, on the other hand, is a library that aims to make application side effects (i.e. asynchronous things like data fetching and impure things like accessing the browser cache) easier to manage, more efficient to execute, easy to test, and better at handling failures. It uses an ES6 feature called Generators to make those asynchronous flows easy to read, write and test.

The key differences between Redux Thunk and Redux Saga are:

- **Control over side effects**: In Redux Thunk, thunks (functions) are invoked on each new action, and they have no control over when to stop handling those actions. In Redux Saga, sagas (generators) pull the next action, giving them control over when to listen for some action, and when to stop.
- **Complexity**: Thunk is simpler to use and Promises are familiar to many developers, while Saga/Generators are more powerful but require learning.
- **Use cases**: When Promises are just good enough, so is Thunk. When dealing with more complex cases on a regular basis, Saga gives you better tools.
- **Error handling**: Saga makes it trivial to handle errors and cancellation of effects, while Thunk requires you to take care of it.

In summary, the choice between Redux Thunk and Redux Saga depends on the specific requirements of your project. If your application has simple needs, Redux Thunk might be sufficient. However, if you need to handle more complex scenarios like race conditions, cancellation, and if-else based on actions, Redux Saga would be a better choice.
</details>


<details>
<summary>
<b>What is AbortController?</b>
</summary>

The `AbortController` is a JavaScript class that allows you to cancel HTTP requests. This can be quite useful in preventing updates of loaded data in your application. For instance, if a user fills out a search form and clears it before the results are displayed, you can cancel the HTTP request to avoid showing outdated search results.

You can create a new `AbortController` object using the `AbortController()` constructor. Communicating with a DOM request is done using an `AbortSignal` object.

Here's how you might use it in a React component:

```jsx
import React, { useEffect, useState } from 'react';

function ExampleComponent() {
  const [data, setData] = useState(null);

  useEffect(() => {
    const controller = new AbortController();
    const signal = controller.signal;

    // axios.get('https://api.example.com/data', { signal: controller.signal }) // axios example
    fetch('https://api.example.com/data', { signal })
      .then(response => response.json())
      .then(data => setData(data))
      .catch(error => {
        if (error.name === 'AbortError') {
          console.log('Fetch aborted');
        } else {
          console.error('Another error: ', error);
        }
      });

    return () => {
      controller.abort();
    };
  }, []);

  return <div>{/* render your data here */}</div>;
}
```

In this code, an `AbortController` is created and its `signal` is passed to the `fetch` function. If the component unmounts before the fetch completes, the `useEffect` cleanup function runs and calls `controller.abort()`, which aborts the fetch.
</details>
