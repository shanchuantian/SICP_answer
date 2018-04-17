;返回list的最后一个元素
;把list-ref和length组合一个就是答案
; list-ref
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
; length ,使用null?
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

;last-pair
(define (last-pair items)
  (list-ref items (- (length items) 1)))

(last-pair (list 1 2 3 4 33))