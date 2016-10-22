# Rollup

An ES6 module bundler, more performant than Browserify and Webpack.

> Rollup statically analyses your code, and your dependencies, and includes the bare minimum in your bundle.

## tree-shaking

Not including code which is not being used in the final bundle
- works only with ES6 modules, not CommonJS
- webpack2 will also have it

## scope-hoisting

Rollup hoists everything into a single function scope (creating variables and namespacing them as necessary).

---
sources:
- https://nolanlawson.com/2016/08/15/the-cost-of-small-modules/
- https://code.lengstorf.com/learn-rollup-js
- https://github.com/rollup/rollup
