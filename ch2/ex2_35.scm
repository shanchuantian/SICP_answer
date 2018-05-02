;ex2.35
;用accumulation重新定义count-leaves

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
; 把tree转换为list
; 不太好理解
(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) (if (pair? x)
                                   (count-leaves x)
                                   1))
                   tree)))
