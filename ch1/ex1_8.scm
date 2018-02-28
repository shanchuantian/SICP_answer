; ex1.8
; cube
(define (cube x) (* x x x))

; cube-iter
(define (cube-iter guess x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x) ;用递归，没有循环
                 x)))

; improve
(define (improve guess x)
  (/ (+ (/ x (* guess guess))
        (* 2 guess))
     3))


; good-enough?   问号也能当函数名
; 数字很大或者很小的时候有问题
;(define (good-enough? guess x)
;  (< (abs (- (cube guess) x)) 0.001)) ;数字比精度0.001低时就出问题

;good-enough?的一个改进版本
(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess))
        guess)
     1e-15)) ;数的表示精度是有限的，这里取最大的15位。以免精度不够的时候无限循环


; cube-root
(define (cube-root x)
  (cube-iter 1.0 x))


; test 很小的数
(cube-root 0.000000027)  ; 0.003
; test big number
(cube-root 10e+42) ;10e+14