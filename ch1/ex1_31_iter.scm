;ex1.31 iter
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

; test product
(product (lambda (x) x)
         1
         (lambda (i) (+ i 1))
         6)

; 用product来定义factorial
(define (factorial n)
  (define (term x) x)
  (define (next x) (+ x 1))
  (product term 1 next n))

(factorial 6)

; 计算pi
(define (numerator n)
  (define (term x)
    (cond ((= x 1) 2)
          ((even? x) (+ x 2))
          (else (+ x 1))))
  (define (next x) (+ x 1))
  (product term 1 next n))

(define (denominator n)
  (define (term x)
    (if (even? x)
        (+ x 1)
        (+ x 2)))
  (define (next x) (+ x 1))
  (product term 1 next n))

(define (pi n)
  (* 4
     (exact->inexact
      (/ (numerator n) (denominator n)))))

(pi 1)
(pi 10)
(pi 100)
(pi 1000) ;