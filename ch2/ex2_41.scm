;ex2.41
;先生成list i j k
; 再filter 是不是=s

; filter
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
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

; three-pairs
; 这么写是错的
;(define (three-pairs1 n)
;  (flatmap (lambda (i) (map (lambda (j)
;                              (map (lambda (k) (list i j k))
;                                   (enumerate-interval 1 (- j 1))))
;                            (enumerate-interval 1 (- i 1))))
;           (enumerate-interval 1 n)))
; flatmap每一层都要用
(define (three-pairs n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

;(define (three-pairs n)
;  (flatmap (lambda (a)
;             (flatmap (lambda (b)
;                        (map (lambda (c) (list a b c))
;                             (enumerate-interval (+ b 1) n)))
;                      (enumerate-interval (+ a 1) n)))
;           (enumerate-interval 1 n)))
; test three-pairs
;(display (three-pairs 5))

;
(define (sum numbers)
  (accumulate + 0 numbers))

; 判断相等如何写？
(define (equal-s-three-pairs n s)
  (filter (lambda (x) (= s (sum x)))
          (three-pairs n)))

;test

(display (equal-s-three-pairs 15 10))