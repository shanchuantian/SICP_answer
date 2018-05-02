;ex2.33

; map 只能用于list，不能用于tree
(define (map0 proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map0 proc (cdr items)))))

; map
; 怎样才能从map的原始定义得到accumulate形式？
;由于map要返回list，所以需要cons
;对照even-fibs来看，even-fibs只需要组合，所以直接用cons,但是这里要p
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              nil
              sequence))

;append
(define (append0 list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (append0 (cdr list1) list2))))
; append
(define (append seq1 seq2)
  (accumulate cons
              seq2
              seq1))

(define (length0 items)
  (if (null? items)
      0
      (+ 1 (length0 (cdr items)))))
; length
(define (length sequence)
  (accumulate (lambda (_ result) (+ result 1))
              0
              sequence))

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

