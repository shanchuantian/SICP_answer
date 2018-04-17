;ex2.2
(define (make-segment start-point end-point)
  (cons start-point end-point))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

; 如何返回point? 用make-point构建一个
; avg写重复了，应该抽象成函数
(define (midpoint-segment s)
  (let ((start (start-segment s))
        (end (end-segment s))
        (mid-x (average (x-point start) (x-point end)))
        (mid-y (average (y-point start) (y-point end))))
    (make-point mid-x mid-y)))

(define (average a b)
  (/ (+ a b)
     2))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;test
(define start (make-point 1 0))
(define end (make-point 2 0))
(define s (make-segment start end))
(define mid (midpoint-segment s))
(print-point mid)