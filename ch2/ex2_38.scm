;ex2.38
; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
; fold-left
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))
(fold-left / 1 (list 1 2 3))
(accumulate / 1 (list 1 2 3))

(display (accumulate list nil (list 1 2 3)))
(newline)
(display (fold-left list nil (list 1 2 3)))