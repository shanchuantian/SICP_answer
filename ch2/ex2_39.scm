;ex2.39
; accumulate
(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))
; fold-left
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;
(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) nil sequence))
; test
(define seq (list 1 2 3 4))
(display (reverse seq))
(newline)

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
;test
(display (reverse seq))
(newline)