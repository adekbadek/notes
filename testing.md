# Testing

Tests are *clients of the code* they’re testing and are really good at identifying API problems early on. **If your object is hard to set up or to use from the tests, there’s a good chance that the “real” clients of the API are going to have the same problem.**

Each test must provide enough value to be worth the lifetime cost of maintaining it and running it over and over again.

## Test-doubles

simple objects that stand in for real objects from your application.

- A **Dummy** is an object with no behavior. It is typically used as a placeholder in parameter lists.
- A **Fake** is an object that has real behavior, but takes some shortcuts that make it unsuitable for use in the production code. An in-memory database is a good example.
- A **Stub** is an object that has no real behavior, but just returns hard-coded values from one or more method calls.
- A **Mock Object** (or Mock, for short) is pre-programmed with one or more “expectations”. Each expectation is a specification of a method to be called along with the properties of the arguments to the method. Once the test is complete, all of the expectations are “verified” to ensure that the expectation has been met.
- A **Spy** records all of the method calls that are made on it, including the arguments. The test can later make assertions about these method calls.

## Tips

- Use table-based tests - array of ``{description, actual, expected}`` objects, mapped over assertion boilerplate
- Defer decisions. Always try to defer design decisions until you are forced to make them. The longer you can wait, the more information you’ll have to make them.ma
- When you’re writing tests for the outermost layer of your system, continually ask yourself, “Would these specs survive if I significantly changed the underlying implementation of the system?” If the answer is “No”, then try to write more generic specs. Think about “what” the system is going to do, rather than “how” it’s going to do it or how the end user will interact with it.

## FIRST

A good unit test should be:
- **F**ast - slow tests prevent refactoring and clog up CIs
- **I**solated
- **R**epeatable (idempotent)
- **S**elf-verifying
- **T**imely (TDD)

--

sources

http://randycoulman.com/blog/categories/getting-testy/
