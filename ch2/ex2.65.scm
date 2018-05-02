;ex2.65 tree set的交与并集
#lang sicp
; tree
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list
                             (right-branch tree)
                             result-list)))))
  (copy-to-list tree '()))

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

(define (union-set-list list1 list2)
  (cond ((null? list1) list2)
        ((null? list2) list1)
        ((let ((x1 (car list1)) (x2 (car list2)))
           (cond ((= x1 x2) (cons x1 (union-set-list (cdr list1) (cdr list2))))
                 ((< x1 x2) (cons x1 (union-set-list (cdr list1) list2)))
                 ((> x1 x2) (cons x2 (union-set-list list1 (cdr list2)))))))))

(define (intersection-set-list list1 list2)
  (if (or (null? list1) (null? list2))
      '()
      (let ((x1 (car list1))
            (x2 (car list2)))
        (cond ((= x1 x2) (cons x1 (intersection-set-list (cdr list1) (cdr list2))))
              ((< x1 x2) (intersection-set-list (cdr list1) list2))
              ((> x1 x2) (intersection-set-list list1 (cdr list2)))))))

(define (intersection-set set1 set2)
  (list->tree (intersection-set-list (tree->list set1)
                                     (tree->list set2))))

(define (union-set set1 set2)
  (list->tree (union-set-list (tree->list set1)
                              (tree->list set2))))
;test
; ----------------生成set--------------
;set的生成用make-tree
(define set1 (make-tree 7
                     (make-tree 3
                                (make-tree 1 '() '())
                                (make-tree 5 '() '()))
                     (make-tree 9
                                '()
                                (make-tree 11 '() '()))))
; 或者直接用list-tree生成tree
(define set11 (list->tree (list 1 2 3 4)))
(define set22 (list->tree (list 3 4 5 6 7 8 9)))
; 使用list去构建是不对的，可能是因为我没有对
;(define set1 (list 2 (list 1 '()) (list 3 '())))


(display (intersection-set set1 set22))
(newline)
(display (union-set set1 set22))