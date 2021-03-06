;ex2.64
#lang sicp
; tree
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))
(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

;test
(cons '() (list 1 2 3))
(define a (cons (list 1 '() '()) (list 1 2 3 4)))
(car a)
(display (list->tree (list 1 2 3 4 5 6 7)))
;(4 (2 (1 () ()) (3 () ())) (6 (5 () ()) (7 () ())))
(newline)
(display (list->tree (list 1 2 3 4 5 6)))
;(3 (1 () (2 () ())) (5 (4 () ()) (6 () ())))
(newline)
(display (list->tree (list 1 2 3 4 5 6 7 8 9 10)))
;(5 (2 (1 () ()) (3 () (4 () ()))) (8 (6 () (7 () ())) (9 () (10 () ()))))
