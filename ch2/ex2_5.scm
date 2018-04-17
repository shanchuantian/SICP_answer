;ex2.5
; constructor
(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

; selector
(define (car pair)
  (get-divisor pair 2))
(define (cdr pair)
  (get-divisor pair 3))
(define (get-divisor pair number)
  (define (iter pair result)
    (if (= 0 (remainder pair number))
        (iter (/ pair number) (+ result 1))
        result))
  (iter pair 0))

;test
(define p (cons 3 2))
(car p)
(cdr p)