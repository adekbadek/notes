# Functional programming

Using composable, pure functions. It makes the code reusable, less complex, and testable.

## Functions

A function is a value.

### Pure functions

  - do not have side effects (don't change anything outside of themselves, they are predictable)
  - return something
  - are deterministic (given the same input, return same output)
  - do not change objects passed as arguments - they return new objects

### Higher-order functions

either take functions as parameters, return functions, or both.

### Recursion

functions that call themselves, to avoid using mutable values

```elm
fib n =
  if n < 2 then
    1
  else
    fib (n - 1) + fib (n - 2)

List.map fib [0..8]
-- [1, 1, 2, 3, 5, 8, 13, 21, 34]
```

### Lambda Calculus (λ-calculus)

Is a system used to define functions.

In functional programming, functions also have a type. A function that squares a number takes type `integer` and returns also `integer`, so it's type is `Int -> Int`.

In Lambda Calculus, a function can take only one argument and return one value. So a function that takes multiple arguments is really a series of functions, and can be *partially applied* (code in Elm):

```elm
> adder a b = a + b
<function> : number -> number -> number
> adder 4 6
10 : number
> addTwo = adder 2
<function> : number -> number
> addTwo 5
7 : number
```

### Currying

Translating the evaluation of a function that takes multiple arguments into a sequence of functions that take one argument. In Haskell, all functions are curried by default.

### Composing functions

In Elm:

```
\n -> not (isEven (sqrt n))
-- can be written as:
not << isEven << sqrt
```

JS with [Ramda](http://ramdajs.com/):

`f(g(arg))` is equivalent to `compose(f, g)(arg)`

### Point-free notation

the arguments of the function being defined are not explicitly mentioned, the function is defined through function composition

in Elm - `<<` operator:

```elm
func1 value =
  (func2 << func3) value

-- can be written as:

func1 =
  (func2 << func3)
```

in JS with Ramda - `compose` function:

```javascript
const hasDogs = person => Boolean(person.dogCount)
// ↓
const hasDogs = person => Boolean(prop('dogCount', person))
// ↓
const hasDogs = person => compose(Boolean, prop('dogCount'))(person)
// ↓
const hasDogs = compose(Boolean, prop('dogCount'))
```

## Values

### Immutablity

'Variables' are immutable (constant)

  - __just as in math__, `x = x + 1` is illegal
  - so it does not make sense to call them *variables*, they are sometimes called *symbols*

### Static typing

Type of a value cannot be changed. It limits errors (compiler can detect bugs), and makes code more readable.

---
sources:
- http://www.defmacro.org/ramblings/fp.html
- https://www.reddit.com/r/explainlikeimfive/comments/1qsfql/eli5_lambda_calculus/cdg3e2l
- https://medium.com/@cscalfani/so-you-want-to-be-a-functional-programmer-part-1-1f15e387e536
- https://medium.com/@cscalfani/why-programmers-need-limits-3d96e1a0a6db
- http://randycoulman.com/blog/categories/thinking-in-ramda/
- http://package.elm-lang.org/packages/elm-lang/core/latest/Basics
