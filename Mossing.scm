#lang r5rs

; Question 1
(define (tripleplusone n) (+ (* 3 n) 1))
(define (half n) (/ n 2))

(define (collatz n)
    (if (< n 1)
        "Given value must be > 0"
        (if (= n 1)
            "Collatz function halted"
            (if (= (modulo n 2) 0)
                (collatz (half n))
                (collatz (tripleplusone n))
            )
        )
    )  
)

(collatz 0)
(collatz -1)
(collatz 1)
(collatz 2)
(collatz 10)
(collatz 65)
(collatz 3974)

; Question 2
; 1st element: node
; 2nd element: left child
; 3rd element: right child
(define tree 
    (list 
        "a"  
        (list
            "b" 
            "d"
            "e"
        )
        (list
            "c"
            "f"
            "g"
        )
    )
)

(define (inorder t)
    (if (pair? t)
        (if (= (length t) 3)
            (list
                (inorder (list-ref t 1))
                (list-ref t 0)
                (inorder (list-ref t 2))
            )
            "given tree is formatted incorrectly. format must be (list <root> <left> <right>)"
        )
        t
    )
)

(inorder tree)


; Question 3
(define (trimming0 l)
    (if (list? l)
        (if (= (list-ref l 0) 0)
            (trimming0 (remove 0 l))
            (display l)
        )
        "given expression not a valid list"
    )
)
(trimming0 '(0 0 2 0 4))

; Question 4
(define (trimming l)
    (if (member 0 l)
        (trimming (remove 0 l))
        (display l)
    )
)