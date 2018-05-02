;ex2.47
; list和cons的区别？
;> (cons 1 (cons 2 3))
;{mcons 1 {mcons 2 3}}
;> (list 1 2 3)
;{mcons 1 {mcons 2 {mcons 3 '()}}}
(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame1 frame)
  (car frame))
(define (edge1-frame1 frame)
  (cadr frame))
(define (edge2-frame1 frame)
  (caddr frame))


(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (origin-frame2 frame)
  (car frame))
(define (edge1-frame2 frame)
  (cadr frame))
(define (edge2-frame2 frame)
  (cddr frame))