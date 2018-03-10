; ex1.42
; key:返回procedure
(define (compose f g)
  (lambda (x)
    (f (g x))))
(define (square x)
  (* x x))
(define (inc x)
  (+ x 1))
((compose square inc) 6)
