# SICP

Next: https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-10.html, Exercise 1.5

TODO:

- [ ] Exercise 1.7
- [ ] Exercise 1.8

## Links

- [SICP Home](https://mitpress.mit.edu/sites/default/files/sicp/index.html)
- [Errata](https://mitpress.mit.edu/sites/default/files/sicp/errata.html)

## Environment setup

```
brew install mit-scheme
```

If you are having problems with scheme interpreter history (e.g., arrow up doesn't show a previous command), install `rlwrap`:

```
brew install rlwrap
```

Run scheme interpreter like so:

```
rlwrap mit-scheme
```

Create an alias for convenience:

```
alias scm='rlwrap mit-scheme'
```

## Chapter 1

*Exercise 1.5*

A test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation:

Define 2 procedures:

```scheme
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
```

Evaluate the expression:

```
(test 0 (p))
```

If the interpreter is using applicative-order evaluation, it hang as procedure `p` will recurse indefinetly. As we know from the textbook, `mit-scheme` uses applicative-order evaluation, so it is easy to test that it will behave in this way. Interpreters using normal-order evalution will return 0.

In *exercise 1.6* we are asked what will be if `if` is defined as a function instead of as a special form, and then previously defined `sqrt` is re-written using the above `new-if`.

`mit-scheme` uses applicative-order evaluation, so it has to evaluate all the arguments before passing them into a procedure. This means that it will try to evaluate a recursive branch even when the procedure has reached a base case and should stop the recursion.
