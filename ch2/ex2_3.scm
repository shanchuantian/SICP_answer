;ex2.3
;构建矩形 根据2.2稍微变化一下即可
(define (area rectangle)
  (let ((top-left (top-left-rectangle rectangle))
        (bottom-right (bottom-right-rectangle rectangle)))
    (abs (* (- (x-point bottom-right) (x-point top-left))
            (- (y-point bottom-right) (y-point top-left))))))
(define (perimeter rectangle)
  (let ((top-left (top-left-rectangle rectangle))
        (bottom-right (bottom-right-rectangle rectangle)))
    (* 2
       (+ (abs (- (x-point bottom-right) (x-point top-left)))
          (abs (- (y-point bottom-right) (y-point top-left)))))))

; rectangle
(define (make-rectangle top-left bottom-right)
  (cons top-left bottom-right))
(define (top-left-rectangle rectangle)
  (car rectangle))
(define (bottom-right-rectangle rectangle)
  (cdr rectangle))

; point
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;test
(define top-left (make-point 0 0))
(define bottom-right (make-point 2 2))
(define rec (make-rectangle top-left bottom-right))
(area rec)
(perimeter rec)