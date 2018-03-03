; ex1.27
; 判断是不是carmichael数
(define (carmichael? number)
  (define (congruent-to-number-below a)
    (cond ((= a 1) #t)
          ((= (expmod a number number) (remainder a number))
           (congruent-to-number-below (- a 1)))
          (else #f)))

  (congruent-to-number-below (- number 1)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square n)
  (* n n))

(carmichael? 561)