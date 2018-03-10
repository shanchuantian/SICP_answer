;ex1.43 repeated
;key:
;lambda没有名字如何递归？
; 借用1.42的compose,抽象的力量！
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose  f (repeated f (- n 1)))))

(define (square x)
  (* x x))

((repeated square 2) 5)