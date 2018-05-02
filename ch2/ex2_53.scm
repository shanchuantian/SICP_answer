;ex2.53
(list 'a 'b 'c)
(list (list 'george))
(display (cdr '((x1 x2) (y1 y2))))
(newline)
(display (cadr '((x1 x2) (y1 y2))))
(newline)
(pair? (car '(a short list)))
(newline)

(memq 'red '((red shoes) (blue socks)))
(display (memq 'red '(red shoes blue socks)))