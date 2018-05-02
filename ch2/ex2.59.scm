;ex2.59 并集
#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((not (element-of-set? (car set1) set2))
         (cons (car set1) set2))
        (else (union-set (cdr set1) set2))))
;test
(define set1 (list 1 2 3))
(define set2 (list 2 3 4 5))
(display (union-set set1 set2))