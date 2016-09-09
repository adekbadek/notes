# some notes on React

`setState` does not change state *in place*, it has a callback that gets called when the change is done

```javascript
this.setState({color: 'red'})
console.log(this.state.color) // ⇒ not red

this.setState({color: 'red'}, () => {
  console.log(this.state.color) // ⇒ red!
})


```

`componentWillReceiveProps` - new props are the argument

```javascript
componentWillReceiveProps(){
  console.log(this.props) // ⇒ boring old props
}

componentWillReceiveProps(newProps){
  console.log(newProps) // ⇒ new props!
}
```
