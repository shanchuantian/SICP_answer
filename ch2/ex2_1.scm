;ex2.1
;优化make-rat，能正确显示正负
; 最大公约数
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;定义一些有理数的函数
; constructor
; 能够化简的写法（使用gcd）
(define (make-rat n d)
  (let ((g (gcd n d)))
    (let ((n (/ n g))
          (d (/ d g)))
      (if (< d 0)
          (cons (- n) (- d))
          (cons n d)))))

; selector
(define (numer x) (car x))
(define (denom x) (cdr x))

; 数学运算
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

; 打印
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;test
(print-rat (make-rat -1 -3))
(print-rat (make-rat -1 3))
(print-rat (make-rat 1 3))
(print-rat (make-rat 1 -3))
