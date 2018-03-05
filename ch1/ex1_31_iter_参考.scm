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
(define (numerator-term x)
  (cond ((= x 1) 2)
        ((even? x) (+ x 2))
        (else (+ x 1))))

(define (denominator-term x)
  (if (even? x)
      (+ x 1)
      (+ x 2)))

(define (pi n)
    (* 4
        (exact->inexact
            (/ (product numerator-term
                        1
                        (lambda (i) (+ i 1))
                        n)
               (product denominator-term 
                        1
                        (lambda (i) (+ i 1))
                        n)))))

(pi 1)
(pi 10)
(pi 100)
(pi 1000) ; 这个可以