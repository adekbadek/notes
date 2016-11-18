# React

  Is a library for building UIs.

## Components, instances, and elements

  - __Components__
    - main building blocks, contain logic and markup (in [JSX](https://facebook.github.io/react/docs/jsx-in-depth.html)) needed to render a part of an application
    - can be divided in into [Presentational and Container (aka smart and dumb) Components](https://medium.com/@dan_abramov/smart-and-dumb-components-7ca2f9a7c7d0)
  - __Instances__ - instances of a Component, just like instances of a class
  - __Elements__
    - "plain object describing a component instance or DOM node and its desired properties."
    - An Element "takes props as an input, and returns an element tree as the output"
    - they usually belong in the the `render()` method of a Component
    - it looks like this: `{type: someType, props: someProps}`
    - `type` can be a Component (`BigButton`) or a name of a DOM node (`'button'`)
    - `props` key contains a `children` key, which can be a text node or an array of Elements

      ```javascript
      // an element as plain object (theory):
      {
        type: Button,
        props: {
          children: 'Sign up'
        }
      }
      // and in JSX (practice):
      <Button>Sign up</Button>
      ```

## misc

`setState` does not change state *in place*, it has a callback that gets called when the change is done:

```javascript
this.setState({color: 'red'})
console.log(this.state.color) // ⇒ not red

this.setState({color: 'red'}, () => {
  console.log(this.state.color) // ⇒ red!
})


```

`componentWillReceiveProps` - new props are the argument:

```javascript
componentWillReceiveProps(){
  console.log(this.props) // ⇒ boring old props
}

componentWillReceiveProps(newProps){
  console.log(newProps) // ⇒ new props!
}
```

---
sources:
- https://facebook.github.io/react/blog/2015/12/18/react-components-elements-and-instances.html
