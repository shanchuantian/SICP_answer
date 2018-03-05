;ex1.30
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(sum (lambda (x) x)
           1
           (lambda (i) (+ 1 i))
           10)
