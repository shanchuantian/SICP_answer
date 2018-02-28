; 不要求输出，只求某一个位置上的元素即可
; 行列都从1开始

(define (pas row col)
  (cond ((= col 1) 1)
        ((= col row) 1)
        (else (+ (pas (- row 1) (- col 1))
           (pas (- row 1) col)))))

(pas 1 1)
(pas 2 1)
(pas 3 2)
(pas 4 3)
(pas 5 3)