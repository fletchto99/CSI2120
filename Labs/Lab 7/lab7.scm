; Question 1

(define (numberRangeRecurse current limit results) (
    cond
        ((> current limit) results)
        (else (numberRangeRecurse (+ current 1) limit (append results (list current))))))

(define (numberRange low high) (numberRangeRecurse low high '()))

;(numberRange 4 9)

; Question 2

(define (dropRecurse lst elem current results) (
    cond 
    ((null? lst) results)
    ((= 0 (remainder current elem)) (dropRecurse (cdr lst) elem (+ current 1) results))
    (else (dropRecurse (cdr lst) elem (+ current 1) (append results (list (car lst)))))))

(define (drop lst elem) (dropRecurse lst elem 1 '()))

;(drop '(a b c d e f g h i k) 3)

; Question 3

(define (sliceRecurse lst current start end results) (
    cond 
    ((> current end) results)
    ((>= current start) (sliceRecurse (cdr lst) (+ current 1) start end (append results (list (car lst)))))
    (else (sliceRecurse (cdr lst) (+ current 1) start end results))))

(define (slice lst start end) (sliceRecurse lst 1 start end '()))

;(slice '(a b c d e f g h i k) 3 7)

; Question 4 / Quiz

(define (sum-list-recurse sumList results) (
    if (null? sumList) 
        results
        (sum-list-recurse (cdr sumList) (+ results (car sumList)))))

(define (sum-list sumList) (sum-list-recurse sumList 0))

(sum-list '(1 2 1 4))