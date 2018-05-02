;ex2.61 排序后的set的操作
#lang sicp
(define (adjoin-set x set)
  (cond ((< x (car set)) (cons x set))
        ((= x (car set)) set)
        (else (cons (car set) (adjoin-set x (cdr set))))))

;test
(define set (list 2 3 4 7))
(display (adjoin-set 6 set))
          