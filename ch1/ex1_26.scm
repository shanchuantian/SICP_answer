(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)  ;算两次expmod，下一次的expmod就会变成4次，8，16.。
                       (expmod base (/ exp 2) m)) ;就将log抵消了 成了n
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))