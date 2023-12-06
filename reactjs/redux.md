<h2> Redux interview question </h2>

<details>
<summary><b>Basic implementation of redux</b></summary>

```js
import React from 'react';
import { createStore } from 'redux';
import { Provider, connect } from 'react-redux';

// Action
const increment = () => ({ type: 'INCREMENT' });
const decrement = () => ({ type: 'DECREMENT' });

// Reducer
const counter = (state = 0, action) => {
  switch (action.type) {
    case 'INCREMENT':
      return state + 1;
    case 'DECREMENT':
      return state - 1;
    default:
      return state;
  }
};

// Store
let store = createStore(counter);

// Map Redux state to component props
const mapStateToProps = (state) => {
  return {
    value: state
  }
};

// Map Redux actions to component props
const mapDispatchToProps = (dispatch) => {
  return {
    onIncrement: () => dispatch(increment())
  }
};

// Connected Component
const Counter = ({ value, onIncrement }) => (
  <div>
    <span>{value}</span>
    <button onClick={onIncrement}>Increment</button>
  </div>
);

const App = connect(
  mapStateToProps,
  mapDispatchToProps
)(Counter);

// Render
ReactDOM.render(
  <Provider store={store}>
    <App />
  </Provider>,
  document.getElementById('root')
);
```

In this example, I have created a simple counter. The `increment` function is an action creator that returns an action. The `counter` function is a reducer that takes the current state and an action, and returns the new state. I then create a Redux store with `createStore(counter)`.

The `mapStateToProps` function maps the Redux state to the React component's props. The `mapDispatchToProps` function maps the Redux action creators to the React component's props.

The `Counter` component is a simple functional component that displays the current count and a button to increment the count. The `connect` function connects the Redux store to the `Counter` component.

Finally, I use the `Provider` component from `react-redux` to make the Redux store available to all child components in the application. The `App` component is rendered into the DOM with `ReactDOM.render`.

</details>