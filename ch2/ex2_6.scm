;ex2.6
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(zero 1)

(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))