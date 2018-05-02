;ex2.54

(define (equal2? a b)
  (cond ((and (null? a) (null? b)) #t)
        ((and (pair? a) (pair? b))
         (and (equal2? (car a) (car b))
              (equal2? (cdr a) (cdr b))))
        (else (eq? a b))))
