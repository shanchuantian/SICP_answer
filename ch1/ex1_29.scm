;ex1.29
; 只能计算n为偶数的情况
; 
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  
  (define (coefficient x)
    (cond ((= x 0) 1)
          ((= x n) 1)
          ((odd? x) 4)
          (else 2)))
  
  (define (term k)
    (* (coefficient k)
       (y k)))
  
  (define (next k)
    (+ k 1))
  
  (* (sum term 0.0 next n)
     (/ h 3)))

(simpson cube 0 1 100)