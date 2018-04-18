;ex2.31
(define (tree-map function tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (function sub-tree)))
       tree))
(define (square x)
  (* x x))
(define (square-tree tree)
  (tree-map square tree))

;test
(display (square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))))