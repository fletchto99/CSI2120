(define (sum sumList) 
    (if (null? sumList)
        0
        (+ (car sumList) (sum (cdr sumList)))))

(define (sumNumbersRecurse input numbers letters) (
    if (null? input)
        (cons letters (list (sum numbers)))
        (let ((x (car input))) (
            if (number? x)
                (sumNumbersRecurse (cdr input) (append numbers (list x) ) letters)
                (sumNumbersRecurse (cdr input) numbers (append letters (list x)))))))

(define (sumNumbers numbers) 
    (sumNumbersRecurse numbers '() '()))

;(sumNumbers '(a 2 4 a b 5))

(define (quatenary baseTenNumber) 
    (if (eqv? baseTenNumber 0)
        0
        (string->number 
            (string-append
                (number->string (quatenary (quotient baseTenNumber 4)))
                (number->string (remainder baseTenNumber 4))))))

;(quatenary 16)