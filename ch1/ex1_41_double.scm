;ex1.41

(define (double p)
  (lambda (x)
    (p (p x))))

(define (inc x)
  (+ x 1))

((double inc) 3)