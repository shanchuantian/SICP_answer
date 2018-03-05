;ex1.32 recursive
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
;用accumulate来定义sum product
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(sum (lambda (x) x)
     1
     (lambda (i) (+ i 1))
     10)
(product (lambda (x) x)
         1
         (lambda (i) (+ i 1))
         10)
