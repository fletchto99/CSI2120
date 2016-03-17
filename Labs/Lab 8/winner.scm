(define winner (lambda (x) (
                let ((y 0))
                   (if (= x y) (display "Winner") (display y)) 
                   (set! y (+ y 1))))) 

(winner 23)