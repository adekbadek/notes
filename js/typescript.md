# TypeScript

  Is a superset of - and compiles to - JavaScript. Basically it's JS with strong typing.

  The compiler is called `tsc` (`npm i -g tsc`), extension is `.ts`.

## Data Types

  TS will infer the type if it's not specified.

  - Built-in - `boolean`, `string`, `number`
  - Custom - `enum`, `array`, `tuple`, `interface`, `class`
  - Any - `any`
  - `void`, `null`, `undefined`, `never`

## Syntax

### type annotations

```javascript
// declaring variable types
const foo : string = 'yo'
const bar : number = 42
const myNumArray : number[] = [1, 2, 3]
// different syntax:
const myNumArray2 : Array<number> = [1, 2, 3]
const myStrArray : string[] = ['one', 'two', 'three']
const myTuple : [number, string] = [2, 'wow']
// "enum is a way of giving more friendly names to sets of numeric values."
enum sizes {Big = 20, Medium = 10, Small = 5}
// declaring parameter types
function greet (name : string) {
  return `Hello, ${name}`
}
// declaring return types
function react (amount : number) : string {
  return `${String(amount)}, that's a lot!`
}
// or if the function does not return - a void
function flushLocalStorage () : void {
  window.localStorage.clear()
}
```

### Classes

  Access modifiers:
  - `public` - default
  - `private` - hides the member for everything but the class itself
  - `protected` - like `private`, also available to classes derived from the class (but not in a class instantiation)

```javascript
class Car {
  private _speed: number = 42
  private _maxSpeed: number = 100

  get speed(): number {
    return this._speed
  }

  set speed(value: number) {
    this._speed = Math.min(value, this._maxSpeed)
  }
}
```

#### `abstract` classes and calling `super`

  Abstract Classes serve as base classes for other classes (meta-classes?), and cannot be instantiated directly.

  `super` invokes the base class

```javascript
abstract class Animal {
  // defining height is not necessary if `public` keyword is used
  // to define constructor argument - TS will create that property
  constructor(public height: number) {
    this.height = height
  }
  // abstract method - every class that extends Animal class
  // will have to implement makeSound()
  abstract makeSound(): void
}

class Elephant extends Animal {
  constructor () {
    // calling the constructor of the base class:
    super(200)
  }
  // the abstract method has to be implemented
  makeSound():void {
    console.log('uuu')
  }
}
```

### Interfaces

  Define shapes for values (define _contracts_).
  - everything defined by an interface must be implemented by the class implementing that interface.
  - a class can implement multiple interfaces (an interface is not bound to a class tree)

```javascript
interface Ship {
  name: string
  age: number
  // optional property
  cannons?: number
}

// interface used as type for a function argument
function getShipAge (ship: Ship) : number {
  return ship.age
}

// interface used as type for a class method
class Fleet {
  // ...
  add(shipToAdd: Ship) : void {
    // ...
  }
}
const bigFleet = new Fleet()
bigFleet.add({name: 'Santa Maria', age: 23})

// interface implemented by a class
class Dinghy implements Ship {
  name: 'Sarabande'
  age: 13
}
```

### Generics

  For reusable components, that do not have to know the type on which they work. Like using `any`, but ensuring that it will be of the same type once a components is used (?).

  TS will create the new classes in output code.

```javascript
// instead of
class NumberCollection {}
class StringCollection {}

// this can be written:
class Collection<T>{
  // T is a 'type parameter', using letter 'T' is just the convention
  // T can be anything
}
const StringCollection = new Collection<string>()
const NumberCollection = new Collection<number>()

// generics can extend, so something can be expected of them:
class AnimalsCollection<T extends Animal>{
  // T.someAnimalProperty can be used
}
// then, deriving from generic classes
class MammalsCollection extends AnimalsCollection<Mammal>{
  // specifics for mammals
}
```

### Encapsulation - `namespace`s and `module`s

  `namespace`s - block as a container

```javascript
namespace Cars {
  export class Truck {
    // ...
  }
  export class Van {
    // ...
  }
}
const hugeTruck = new Cars.Truck()
```

  `module`s - the file itself serves as the container - as in [ES6 modules](http://www.2ality.com/2014/09/es6-modules-final.html)

## Configuration

  `tsconfig.json` file

## Typings

  TS already contains type definitions for standard JS objects, but for external libraries it need typings files (`library-name.d.ts`). These files will be automatically picked up by typescript.

  [TypeScript Definition Manager](https://www.npmjs.com/package/typings) can be used to manage them.



---
sources:
- https://www.typescriptlang.org/docs/handbook
- https://app.pluralsight.com/library/courses/typescript-practical-start
- http://stackoverflow.com/documentation/typescript/1560/classes
