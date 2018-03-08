;ex1.39
; key: 定义N D
(define (cont-frac N D k)
  (define (iter i result) 
    (if (= i 0)
        result
        (iter (- i 1) (/ (N i) (+ (D i) result)))))
  (iter k 0))



(define (D i)
  (- (* 2 i) 1))

(define (tan-cf x k)
  (define (N i)
    (if (= i 1)
        x
        (- (* x x))))
  (cont-frac N D k))

(tan 3.14)
(tan-cf 3.14 15)
(tan-cf 3.14 154)