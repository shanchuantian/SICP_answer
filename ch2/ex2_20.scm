;ex2.20
;参数个数不限，返回与第一个数的奇偶性质相同的list
;如果判断是否与第一个数的奇偶性相同？要点trick
(define (same-parity x . y)
  (define (same-parity? n)
    (= (remainder x 2) (remainder n 2)))
  (define (filter-list y)
    (cond ((null? y) (list))
          ((same-parity? (car y)) (cons (car y)
                                        (filter-list (cdr y))))
          (else (filter-list (cdr y)))))
  (cons x (filter-list y)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)