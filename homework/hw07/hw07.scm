(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  ; YOUR-CODE-HERE
  (if (null? s)
    nil
    (car (cdr s))
  )
)

(define (caddr s)
  ; YOUR-CODE-HERE
  (if (null? s)
    nil
    (car (cddr s))
  )
)

(define (sign x)
  ; YOUR-CODE-HERE
  (cond
    ((null? x) nil)
    ((< x 0) -1)
    ((> x 0) 1)
    ((= x 0) 0)
  )
)

(define (square x) (* x x))

(define (pow b n)
  ; YOUR-CODE-HERE
  (cond
    ((or (null? b) (null? n)) nil)
    ((= n 0) 1)
    ((even? n) (square (pow b (/ n 2))))
    ((odd? n) (* b (pow b (- n 1))))
  )
)

(define (ordered? s)
  ; YOUR-CODE-HERE
  (cond
    ((null? s) nil)
    ((= 1 (length s)) True)
    ((< (car s) (cadr s)) (ordered? (cdr s))) 
    ((= (car s) (cadr s)) (ordered? (cdr s)))
    ((> (car s) (cadr s)) False)
  )
)

(define (nodots s)
  ; YOUR-CODE-HERE
  (cond
    ((null? s) nil)
    ;((integer? (cdr s)) (cons (car s) (cons (cdr s) nil)))
    ((and (integer? (car s)) (integer? (cdr s))) (cons (car s) (cons (cdr s) nil)))
    ((and (integer? (cdr s)) (pair? (car s))) (cons (nodots (car s)) (cons (cdr s) nil)))
    ((and (pair? (car s)) (pair? (cdr s))) (cons (nodots (car s)) (nodots (cdr s))))
    ((pair? (car s)) (cons (nodots (car s)) (cdr s)))
    ((pair? (cdr s)) (cons (car s) (nodots (cdr s))))
    (else s)
  )
)

; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond ((empty? s) false)
          ; YOUR-CODE-HERE
          ((> (car s) v) False)
          ((= (car s) v) True)
          ((< (car s) v) (contains? (cdr s) v))
          (else nil)
          ))

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return len(s) == 0
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond ((empty? s) (list v))
          ; YOUR-CODE-HERE
          ((contains? s v) s)
          ((< v (car s)) (cons v (add (cdr s) (car s))))
          ((> v (car s)) (cons (car s) (add (cdr s) v)))
          (else nil)
          ))

(define (intersect s t)
    (cond ((or (empty? s) (empty? t)) nil)
          ; YOUR-CODE-HERE
          ((= (car s) (car t)) (cons (car s) (intersect (cdr s) (cdr t))))
          ((< (car s) (car t)) (intersect (cdr s) t))
          ((> (car s) (car t)) (intersect s (cdr t)))
          (else nil)
          ))

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond ((empty? s) t)
          ((empty? t) s)
          ; YOUR-CODE-HERE
          ((= (car s) (car t)) (cons (car s) (union (cdr s) (cdr t))))
          ((< (car s) (car t)) (cons (car s) (union (cdr s) t)))
          (else (cons (car t) (union s (cdr t))))
          ))


; Binary search trees

; A data abstraction for binary trees where nil represents the empty tree
(define (tree entry left right) (list entry left right))
(define (entry t) (car t))
(define (left t) (cadr t))
(define (right t) (caddr t))
(define (empty? s) (null? s))
(define (leaf entry) (tree entry nil nil))

(define (in? t v)
    (cond ((empty? t) False)
          ; YOUR-CODE-HERE
          ((= v (entry t)) True)
          ((> v (entry t)) (in? (right t) v))
          ((< v (entry t)) (in? (left t) v))
          (else nil)
          ))

; Equivalent Python code, for your reference:
;
; def contains(s, v):
;     if s.is_empty:
;         return False
;     elif s.entry == v:
;         return True
;     elif s.entry < v:
;         return contains(s.right, v)
;     elif s.entry > v:
;         return contains(s.left, v)

(define (as-list t)
    ; YOUR-CODE-HERE
  (cond ((empty? t) nil)
    

    (else nil)
    ))

