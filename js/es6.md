# ES6

## Rest and Spread (`...something`)

### Rest
as a function argument, gathers parameters and puts them into a single array

```javascript
var createItem = function(name, ...ingredients){
  console.log(ingredients, arguments.length)
  // ingredients is an array, even it there are no arguments to go in it
  // arguments.length will behave regularly
}
createItem('Yoghurt', 'milk', 'strawberries')
// > ['milk', 'strawberries'], 3
createItem('Dumbo')
// > [], 1
```

### Spread
takes an array and converts it to a list of parameters

```javascript
var ages = [12, 87, 32, 45]
var maxAge = Math.max(...ages)
console.log(maxAge) // > 87
// ES5 way:
var maxAge = Math.max.apply(null, ages)
```

if a string is passed, spread will explode it into individual characters array
