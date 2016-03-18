(define (removeLetterRecurse lst char acc) (
    cond 
    ((null? lst) (list->string acc))
    ((char=? (car lst) char) (removeLetterRecurse (cdr lst) char acc))
    (else (removeLetterRecurse (cdr lst) char (append acc (string->list(string (car lst))))))))

(define (removeLetter str char) (removeLetterRecurse (string->list str) char '()))
(removeLetter "Hello World" #\o)