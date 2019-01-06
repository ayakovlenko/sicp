# SICP

Next: https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-11.html#%_sec_1.2

TODO:

Chapter 1.1

- [ ] Exercise 1.8
- [ ] Exercise 1.9

## Links

- [SICP Home](https://mitpress.mit.edu/sites/default/files/sicp/index.html)
- [Errata](https://mitpress.mit.edu/sites/default/files/sicp/errata.html)

## Introduction

I'm using `mit-scheme` interpreter for exercises and will be referring to it as `scm` to save some keystrokes.

Improve reading experience:

```js
$('body').style["width"] = "50%";
$('body').style["font-family"] = "Verdana"
```

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

**Exercise 1.5**

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

```scheme
(test 0 (p))
```

If the interpreter is using applicative-order evaluation, it will freeze as procedure `p` will recurse indefinitely. As we know from the textbook, `scm` uses applicative-order evaluation, so it is easy for us to test this in the interpreter. Interpreters using normal-order evalution will return 0.

Example in Haskell:

```haskell
> p = p
> test x y = if x == 0 then 0 else y
> test 0 p
0
```

In **exercise 1.6** we are asked what will be if `if` is defined as a function instead of as a special form, and then previously defined `sqrt` is re-written using the above `new-if`.

`scm` uses applicative-order evaluation, so it has to evaluate all the arguments before passing them into a procedure. This means that it will try to evaluate a recursive branch even when the procedure has reached a base case and should stop the recursion.
