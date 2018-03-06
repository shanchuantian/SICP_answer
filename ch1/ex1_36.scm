;ex1.36 
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess iteration)
    (let ((next (f guess)))
      (display iteration)
      (display "  ")
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next (+ iteration 1)))))
  (try first-guess 1))

(define (average x y)
  (/ (+ x y) 2))

;test
(display "Without average damping:")
(newline)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)

(newline)
(display "With average damping:")
(newline)
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)