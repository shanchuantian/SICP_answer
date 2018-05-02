;ex2.40
; flatmap
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
; enumerate-interval
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
; unique-pairs
(define (unique-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list i j))
                            (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))
; test
(display (unique-pairs 4))
(newline)

; make-pair-sum
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
; filter
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
; prime-sum?
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
; prime?
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n)
  (find-divisor n 2)) ; scheme总是这种形式，这里面的函数的作用是给定初始值
(define (find-divisor n test-divisor)
  (if (= (remainder n test-divisor) 0)
      test-divisor
      (find-divisor n (+ test-divisor 1))))

; prime-sum-pairs - 
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))

; test
(display (prime-sum-pairs 6))