;ex2.22
; square-list的迭代版本
(define (square x)
  (* x x))
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons 
                    (square (car things))
                    answer))))
  (iter items nil))

;test
(square-list (list 1 2 3 4))