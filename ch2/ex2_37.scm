;ex2.37
;通过sequence operations定义矩阵的操作
(define v (list 1 2 3 4))
(define w (list 6 7 8 9))
(map * v w)
; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
; dot-product
(define (dot-product v w)
  (accumulate + 0 (map * v w)))
; test dot-product
(dot-product v w)

; accumulate-n
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))
; matrix-*-vector
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
; test
(define m (list (list 1 2 3 4) (list 5 6 7 8) (list 1 2 3 4) (list 5 6 7 8)))
(define v1 (list (list 1) (list 2) (list 3) (list 4)))
(matrix-*-vector m v)

; transpose
; accumulate-n的操作本来就像转置，把op改为cons就行
(define (transpose mat)
  (accumulate-n cons
                nil
                mat))
(display (transpose m))