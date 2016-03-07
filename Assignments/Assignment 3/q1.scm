(define (sum sumList) (
        if (null? sumList)
            0
            (+ (car sumList) (sum (cdr sumList)))))

(define (normalizeRecurse filter sum) (
        map (lambda(x) (/ x sum)) filter))

(define (normalize filter) (
        normalizeRecurse filter (sum filter)))

(define (calculate filter results) (
        cond
        ((null? filter) 0)
        ((null? results) 0)
        (else (+ (* (car filter) (car results)) (calculate (cdr filter) (cdr results))))))

(define (filter filterList resultsList) (
        if (null? resultsList)
            '()
            (cons (calculate (normalize filterList) resultsList) (filter filterList (cdr resultsList)))))

(filter '(1 2 5 2 1) '(0.1 0.1 0.1 0.7 0.1 0.2 0.3 0.4 0.5 0.6 0.7)) 