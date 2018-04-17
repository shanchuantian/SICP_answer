;ex2.19
;重写change-counting
(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

;except-first-denomination
(define (except-first-denomination coin-values)
  (cdr coin-values))

;first-denomination
(define (first-denomination coin-values)
  (car coin-values))

;no-more?
(define (no-more? coin-values)
  (null? coin-values))

;test
(define us-coins (list 50 25 10 5 1))
(define us-coins2 (list 1 50 25 10 5))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))
(cc 100 us-coins)
(cc 100 us-coins2)