;ex2.7 ex2.8

(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

;test
(define x (make-interval 1 2))
(define y (make-interval 8 12))
(sub-interval y x)