;ex2.4
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
(define (cdr z)
  (z (lambda (p q) q)))

;test
(define p (cons 2 3))
(car p)
(cdr p)

((lambda (z) (z (lambda (p q) p)))  ; 展开 car ，代换 z
    (lambda (m) (m 1 2)))