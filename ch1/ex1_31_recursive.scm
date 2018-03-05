;ex1.31 recursive
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

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
  (product term 1.0 next n))

(define (denominator n)
  (define (term x)
    (if (even? x)
        (+ x 1)
        (+ x 2)))
  (define (next x) (+ x 1))
  (product term 1 next n))

(define (pi n)
  (* (/ (numerator n) (denominator n)) 4))

(pi 1)
(pi 10)
(pi 100)
(pi 1000) ;递归太多？