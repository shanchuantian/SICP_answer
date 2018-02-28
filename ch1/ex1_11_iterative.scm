; iterative
; 仿照Fibonacci numbers的Iterative
; fib: 0 1 1 2 3 5 8
;      b a
; 这里的：
; 0 1 2 4 11 25 59
; c b a             count=0
;   c b a           count=1
;     c b a         count=2
; 每次返回c就是对应count的结果
(define (f n)
  (f-iter 2 1 0 n))

(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
;                     a             b c  每次向前挪动1位

(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
(f 6)