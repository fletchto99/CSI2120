(define (sum-list-recurse sumList results) (
    if (null? sumList) 
        results
        (sum-list-recurse (cdr sumList) (+ results (car sumList)))))

(define (sum-list sumList) (sum-list-recurse sumList 0))

(sum-list '(1 2 1 4))