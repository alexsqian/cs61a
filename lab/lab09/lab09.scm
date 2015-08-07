(define (cube x)
  (* x x x)
)

(define (over-or-under x y)
  (if (< x y) -1  (if (= x y) 0 1))
)

(define (make-adder num)
  (lambda (x) (+ x num))
)

(define structure
  (cons (cons 1 nil) ;a length
  	(cons 2 (cons (cons 3 4) (cons 5 nil))))
)

(define (remove item lst)
  (if (null? lst) '()
  	(if (= item (car lst)) (remove item (cdr lst)) 
  		(cons (car lst) (remove item (cdr lst))))
  	)
)



