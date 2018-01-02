(define (p) (p))    ;无限循环
(define (test x y)
  (if (= x 0)
      0
      y))
(test 0 (p))