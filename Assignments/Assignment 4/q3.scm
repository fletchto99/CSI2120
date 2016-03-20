(define (lcaRec tree k1 k2) (
    cond
    ((or (null? tree) (and (<= (car tree) k2) (>= (car tree) k1))) tree)
    ((> (car tree) k2) (lcaRec (list-ref tree 1) k1 k2))
    ((< (car tree) k1) (lcaRec (list-ref tree 2) k1 k2))
    (else '() )))

(define (inTree tree node) (
    if (= (car tree) node)
        #t
        (or (and (not (null? (list-ref tree 1)))(inTree (list-ref tree 1) node)) (and (not (null? (list-ref tree 2)))(inTree (list-ref tree 2) node)))))

(define (lca tree k1 k2) (
    if (and(inTree tree k1) (inTree tree k2))
        (if (< k1 k2)
            (lcaRec tree k1 k2)
            (lcaRec tree k2 k1))
        '()))

;(lca '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) (2016 () ()))) 97 2016)
;(lca '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) (2016 () ()))) 2016 97)
(lca '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) (2016 () ()))) 1 97)
;(lca '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) (2016 () ()))) 5 31)
;(lca '() 31 97)

;(inTree '(73 (31 (5 () ()) ()) (101 (83 () (97 () ())) (2016 () ()))) 2)