;ex2.18
;将list反序


;reverse
;(list)返回一个空列表
(define (reverse items)
  (define (iter items result)
    (if (null? items)
        result
        (iter (cdr items) (cons (car items) result))))
    
  (iter items (list)))
(reverse (list 1 2 3 4))