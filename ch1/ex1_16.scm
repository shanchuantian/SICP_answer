;ex1.16
(define (fast-expt-iter b n)
  (fast-expt-iter-core b n 1))

(define (fast-expt-iter-core b counter product)
  (cond ((= counter 0) product)
        ((even? counter) (fast-expt-iter-core (* b b) (/ counter 2) product))
        (else (fast-expt-iter-core b (- counter 1) (* product b)))))
        
(define (even? n)
  (= (remainder n 2) 0))

(fast-expt-iter 2 8)
(fast-expt-iter 2 10)