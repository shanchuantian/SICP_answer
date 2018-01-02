(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
; test
(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

;

; square
(define (square x) (* x x))

; sqrt-iter
;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x) ;用递归，没有循环
;                 x)))
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) ;用递归，没有循环
                     x)))

; improve
(define (improve guess x)
  (average guess (/ x guess)))

; average
(define (average x y)
  (/ (+ x y) 2))

; good-enough?   问号也能当函数名
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; sqrt
(define (sqrt x)
  (sqrt-iter 1.0 x))

; test
(sqrt 9)
(sqrt (+ 100 37))
(sqrt (+ (sqrt 2) (sqrt 3)))
(square (sqrt 1000))
;3.00009155413138
;11.704699917758145
;1.7739279023207892
;1000.000369924366