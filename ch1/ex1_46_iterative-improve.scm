;ex1.46
;将sqrt fixed-point 写成这种形式
(define (iterative-improve good-enough? improve)
  (lambda (x)
    