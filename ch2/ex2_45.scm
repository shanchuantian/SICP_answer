;ex2.45
(define (split op1 op2)
  (define (split-proc painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-proc painter (- n 1))))
          (op1 painter (op2 smaller smaller)))))
  split-proc)

(define right-split (split beside below))
(define up-split (split below beside))