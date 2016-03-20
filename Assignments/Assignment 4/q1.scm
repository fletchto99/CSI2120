;STRING FORMATTING TAKEN FROM RACKET -- MY MAC HAS MIT-SCHEME
;See http://srfi.schemers.org/srfi-28/srfi-28.html
(define format
  (lambda (format-string . objects)
    (let ((buffer (open-output-string)))
      (let loop ((format-list (string->list format-string))
                 (objects objects))
        (cond ((null? format-list) (get-output-string buffer))
              ((char=? (car format-list) #\~)
               (if (null? (cdr format-list))
                   (error 'format "Incomplete escape sequence")
                   (case (cadr format-list)
                     ((#\a)
                      (if (null? objects)
                          (error 'format "No value for escape sequence")
                          (begin
                            (display (car objects) buffer)
                            (loop (cddr format-list) (cdr objects)))))
               ((#\s)
                      (if (null? objects)
                          (error 'format "No value for escape sequence")
                          (begin
                            (write (car objects) buffer)
                            (loop (cddr format-list) (cdr objects)))))
                     ((#\%)
                      (newline buffer)
                      (loop (cddr format-list) objects))
                     ((#\~)
                      (write-char #\~ buffer)
                      (loop (cddr format-list) objects))
                     (else
                      (error 'format "Unrecognized escape sequence")))))
              (else (write-char (car format-list) buffer)
                    (loop (cdr format-list) objects)))))))
;END STRING FORMAT

(define (checkList lst errors index) (
    if (null? lst)
    errors
    (if (equal? (sort (car lst) <)  (car lst)) 
            (checkList (cdr lst) errors (+ index 1))
            (checkList (cdr lst) (append errors (list index)) (+ index 1)))))

(define (mergeLists lst acc) (
    if (null? lst)
        acc
        (mergeLists (cdr lst) (append acc (car lst)))))

(define (mergeALot lst) (
    let ((check (checkList lst '() 1))) (
      if (null? check)
          (sort (mergeLists lst '()) <)
          (format "ERROR: The following lists are not sorted: ~s" check))))


(mergeALot '((1 3 5) (2 4 6) (2 6 8))) 
;(mergeALot '((1 3 5) (2 0 6) (2 6 8) (3 1) (5 4 3 2 1 0) (1 5 9 13 17)))
;(mergeALot '((1 4 7) (5 6 1))) 