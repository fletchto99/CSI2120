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

;   Fibonacci Option 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define fibonacci
  (lambda (n)
    (if (= n 0)
        0
        (let fib ((i n) (a1 1) (a2 0))
          (if (= i 1)
              a1
              ((display (format "~%Arg 1: ~s Arg2: ~s Arg3: ~s" (- i 1) (+ a1 a2) a1))(fib (- i 1) (+ a1 a2) a1)))))))

;   Fibonacci Option 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(define fibonacci
;  (lambda (n)
;    (let fib ((i n))
;      (cond
;        ((= i 0) 0)
;        ((= i 1) 1)
;        (else (display (format "~%Arg 1: ~s Arg2: ~s" (- i 1) (- i 2)))(+ (fib (- i 1)) (fib (- i 2))))))))

(fibonacci 5)