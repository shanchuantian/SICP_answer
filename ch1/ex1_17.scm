;ex1_17

(define (multi a b)
  (multi-iter a b 0))

(define (multi-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (multi-iter (double a) (halve b) c))
        (else (multi-iter a (- b 1) (+ c a)))))

(define (even? n)
  (= (remainder n 2) 0))

(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(multi 3 5)