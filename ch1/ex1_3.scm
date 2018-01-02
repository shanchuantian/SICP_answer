; Define a procedure that takes three numbers as arguments and
; returns the sum of the squares of the two larger numbers.
; 计算两个数的平方
(define (sum_square a b)
  (+ (* a a) (* b b)))
; 判断出两个大数后用上面的procedure
(define (sum_large2 a b c)
  (cond ((and (<= a b) (<= a c)) (sum_square b c))
        ((and (<= b a) (<= b c)) (sum_square a c))
        (else (sum_square a b))))
; test
(sum_square 1 2) ;5
(sum_large2 1 2 3)  ;13
  