
; square
(define (square x) (* x x))

; sqrt-iter
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
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
; 数字很大或者很小的时候有问题
;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001)) ;数字比精度0.001低时就出问题

;good-enough?的一个改进版本
(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess))
        guess)
     1e-15)) ;数的表示精度是有限的，这里取最大的15位。以免精度不够的时候无限循环


; sqrt
(define (sqrt x)
  (sqrt-iter 1.0 x))

; test
;(sqrt 9)
;(sqrt (+ 100 37))
;(sqrt (+ (sqrt 2) (sqrt 3)))
;(square (sqrt 1000))
;3.00009155413138
;11.704699917758145
;1.7739279023207892
;1000.000369924366

; test 很小的数
(sqrt 0.00000004)  ; 0.0002
; test big number
(sqrt 10e+48)  ;3.162277660168379e+024