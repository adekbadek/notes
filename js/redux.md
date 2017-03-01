# Redux

## The State - single and global

The state is read-only (immutable). The only way to change it is by dispatching an action.

### Action

An action is a plain JS object, which has to have a `type` key with a defined value

### The Reducer function

Manages the state updates - this function is called **the reducer** and must be a pure function.

__Reducer function__ takes the previous state and the dispatched action, and returns new state.


If `undefined` is passed as state, the reducer should return the initial state.

```javascript
const counter = (state = 0, action) => {
  switch(action.type){
    case 'INCREMENT':
      return state + 1
    case 'DECREMENT':
      return state - 1
    default:
      return state
  }
}
```

## The Redux

```javascript
// installed with npm
import { createStore } from 'redux'
// when creating store, specify the reducer function
const store = createStore(counter)
```

The `store` has 3 important methods:
- `store.getState()`
- `store.dispatch({type: 'TYPE_OF_ACTION', ...})` - dispatches actions that change the store. `type` must be provided.
- `store.subscribe()` - pass in a callback function that will be called anytime an action has been dispatched



---

# Pure functions:
  - are __deterministic__ - given the same input, return same output
  - do not change objects passed as arguments - they return new objects
