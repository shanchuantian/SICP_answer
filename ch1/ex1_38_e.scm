;ex1.38
; 改一下D即可
(define (cont-frac N D k)
  (define (iter i result) 
    (if (= i 0)
        result
        (iter (- i 1) (/ (N i) (+ (D i) result)))))
    (iter k 0))

(define (D n)
  (if (= (remainder (+ n 1) 3) 0)
      (* 2 (/ (+ n 1) 3))
      1))

(define (e k)
  (+ 2.0
     (cont-frac (lambda (i) 1.0)
                D
                k)))
(e 1)
(e 2)
(e 3)
(e 4)
(e 5)
(e 10)