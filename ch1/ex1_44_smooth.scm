;1.44 smooth
;key:
(define dx 0.0001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose  f (repeated f (- n 1)))))

(define (square x) (* x x))

(define (n-smoothed f n)
  ((repeated smooth n)  f))

((n-smoothed square 10) 5)