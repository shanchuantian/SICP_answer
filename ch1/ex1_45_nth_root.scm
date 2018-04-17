;ex1.45
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;计算sqrt不收敛的情况
(define (sqrt x)
  (fixed-point (lambda (y) (/ x y))
               1.0))
;(sqrt 2) ; 无限循环

;用average damping可以解决不收敛问题
(define (average x y)
  (/ (+ x y) 2))
(define (sqrt2 x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
(sqrt2 2)

; cube-root
(define (cube-root x)
  (fixed-point (lambda (y) (average y (/ x (* y y))))
               1.0))
(cube-root 2)

; fourth-root
; 一次average不够,2次
(define (fourth-root x)
  (fixed-point (lambda (y) (average y (average y (/ x (* y y y)))))
               1.0))
(fourth-root 2)

;
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose  f (repeated f (- n 1)))))
(define (expt base n)
  (if (= n 0)
      1
      ((repeated (lambda (x) (* base x)) n) 1)))
(expt 2 5)


(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (average-damp-n-times f n)
  ((repeated average-damp n) f))

(define (damped-nth-root n damp-times)
  (lambda (x)
    (fixed-point 
     (average-damp-n-times 
      (lambda (y) 
        (/ x (expt y (- n 1)))) 
      damp-times)
     1.0)))
;测试，           n  avg-time  要求根的数
((damped-nth-root 1 1) 2)
((damped-nth-root 2 1) 2)
((damped-nth-root 3 1) 2)
((damped-nth-root 4 2) 2)
((damped-nth-root 5 2) 2)
((damped-nth-root 6 2) 2)
((damped-nth-root 7 2) 2)
((damped-nth-root 8 3) 2)
((damped-nth-root 9 3) 2)
((damped-nth-root 15 3) 2)
((damped-nth-root 16 4) 2)

; 求avg的次数
(define (log2 n)
  (floor (/ (log n) (log 2))))
(log2 1024)

(define (nth-root n)
  (damped-nth-root n (log2 n)))

;test
(define sqrt (nth-root 2))
(sqrt (* 3 3))
(define cube-root (nth-root 3))
(cube-root (* 3 3 3))
(define 4th-root (nth-root 4))
(4th-root (* 3 3 3 3))
(define 100th-root (nth-root 100))
(100th-root 100)
