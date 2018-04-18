;ex2.23
(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

;重写for-each，改变返回值
(define (for-each function items)
  (cond ((null? items) true)
        (else (function (car items))
              (for-each function (cdr items)))))


(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))