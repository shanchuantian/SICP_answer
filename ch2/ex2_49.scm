;ex2.49
(define outline
  (segments->painter
    (list (make-segment (make-vect 0.0 0.0) (make-vect 0.0 1.0))
          (make-segment (make-vect 0.0 1.0) (make-vect 1.0 1.0))
          (make-segment (make-vect 1.0 1.0) (make-vect 1.0 0.0))
          (make-segment (make-vect 1.0 0.0) (make-vect 0.0 0.0)))))