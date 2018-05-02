;ex.2.63
#lang sicp
(cons 1 '())
(cons 5 '())
(cons 3 (cons 5 '()))
(append (cons 1 '()) (cons 3 (cons 5 '())))
; tree
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1
                     (right-branch tree))))))
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

;test
(define a (make-tree 7
                     (make-tree 3
                                (make-tree 1 '() '())
                                (make-tree 5 '() '()))
                     (make-tree 9
                                '()
                                (make-tree 11 '() '()))))
(define b (make-tree 3
                     (make-tree 1 '() '())
                     (make-tree 7
                                (make-tree 5 '() '())
                                (make-tree 9
                                           '()
                                           (make-tree 11 '() '())))))
(define c (make-tree 5
                     (make-tree 3
                                (make-tree 1 '() '())
                                '())
                     (make-tree 9
                                (make-tree 7 '() '())
                                (make-tree 11 '() '()))))
(display (tree->list-1 a))
(newline)
(display (tree->list-2 a))
(newline)
(display (tree->list-1 b))
(newline)
(display (tree->list-2 b))
(newline)
(display (tree->list-1 c))
(newline)
(display (tree->list-2 c))
(newline)