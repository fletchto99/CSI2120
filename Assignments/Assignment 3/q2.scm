(define (sum sumList) 
    (if (null? sumList)
        0
        (+ (car sumList) (sum (cdr sumList)))))

(define (sumNumbersRecurse input numbers letters) (
    if (null? input)
        (cons letters (sum numbers))
        (let ((x (car input))) (
            if (number? x)
                (sumNumbersRecurse (cdr input) (append numbers (list x) ) letters)
                (sumNumbersRecurse (cdr input) numbers (append letters (list x)))))))

(define (sumNumbers numbers) 
    (sumNumbersRecurse numbers '() '()))

(sumNumbers '(a 2 4 a b 5))

;(define (quatenary baseTenNumber))