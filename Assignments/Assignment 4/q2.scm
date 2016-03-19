(define (ourLogRecurse num precision index sum) (
    let ((next (+ sum (* (expt -1 (+ index 1)) (/ (expt num index) index))))) (
        if (< (abs (- next sum)) precision)
            (list next (+ index 1))
            (ourLogRecurse num precision (+ index 1) next))))

(define (ourLog num precision) (
    if (and (and (> num -1) (< num 1)) (and (> precision 0) (< precision 1)))
        (ourLogRecurse num precision 1 0)
        "Invalid parameters! -1 < num < 1 and 0 < precision < 1"))

(ourLog 0.95 0.00001) 