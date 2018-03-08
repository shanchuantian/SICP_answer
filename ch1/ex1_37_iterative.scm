;ex1.37 iterative
;迭代的思想是什么？第一步都是独立的，停止后，可以根据参数恢复计算，递归则不行。
(define (cont-frac N D k)
  (define (iter i result) ;用一个参数（result）把每一步的结果存起来
    (if (= i 0)
        result
        (iter (- i 1) (/ (N i) (+ (D i) result)))))
    (iter k 0))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)
; > 11精度即可达到小数点后4位