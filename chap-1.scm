(define (square x)
  (* x x))

(define (sum-of-squares a b)
  (+ (square a)
     (square b)))

; note:
; `largest-of-3` and `second-largest-of-3` are defined in such way
; because the book hasn't yet introduced list operations

(define (largest-of-3 a b c)
  (cond ((and (>= a b) (>= a c)) a)
        ((and (>= b a) (>= b c)) b)
        (else c)))

(define (second-largest-of-3 a b c)
  (cond ((and (>= a b) (<= a c)) a)
        ((and (>= b a) (<= b c)) b)
        (else c)))

; a procedure that takes three numbers as arguments and returns the sum of the
; squares of the two larger numbers
(define (exercise-1-3 a b c)
  (+ (square (largest-of-3 a b c))
     (square (second-largest-of-3 a b c))))

; Newton's method for finding square roots
(define (avg-of-2 x y)
  (/ (+ x y) 2))

(define (new-sqrt x)
  (define (sqrt-iter guess-new guess-old)
    (define (improve guess)
      (avg-of-2 guess (/ x guess)))

    (define (is-good-enough? guess-new guess-old)
      (let ((square-new (square guess-new))
            (square-old (square guess-old)))
        (< (abs (- square-old square-new))
            0.00000001)))
    (if (is-good-enough? guess-new guess-old)
      guess-new
      (sqrt-iter (improve guess-new) guess-new)))

  (sqrt-iter 1.0 2.0))
