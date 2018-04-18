;ex2.32
(define (subsets s)
  (if (null? s)
      (list (list))
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (lambda (subset) (cons (car s) subset)) 
                     rest)))))
(display (subsets (list 1 2 3)))