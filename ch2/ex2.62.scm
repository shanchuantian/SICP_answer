;ex2.62 set 排序 的 union
#lang racket
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((let ((x1 (car set1)) (x2 (car set2)))
           (cond ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
                 ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
                 ((> x1 x2) (cons x2 (union-set set1 (cdr set2)))))))))
  ;test
  (define set1 (list 3 4 5 8 9 15))
  (define set2 (list 7 9 14 15))
  (display (union-set set1 set2))
  