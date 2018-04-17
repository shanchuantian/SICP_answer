;ex2.12
(define (make-interval a b) (cons a b))
(define (upper-bound interval) (cdr interval))
(define (lower-bound interval) (car interval))

;constructor
(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))
;selector
(define (percent intp)
  (/ (/ (- (upper-bound intp) (lower-bound intp)) 2)
     (/ (+ (upper-bound intp) (lower-bound intp)) 2)))
(define (center intp)
  (/ (+ (upper-bound intp) (lower-bound intp)) 2))

;test
(define intp (make-center-percent 10 1))
(percent intp)