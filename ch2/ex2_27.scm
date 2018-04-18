;ex2.27
;深度反转
(define (deep-reverse items)
  (define (iter items result)
    (cond ((null? items) result)
          ((pair? (car items))
           (iter (cdr items) (cons (deep-reverse (car items)) result)))
          (else (iter (cdr items) (cons (car items) result)))))
  (iter items (list)))
;test
(define x (list (list 1 2) (list 3 4)))
(display (deep-reverse x))