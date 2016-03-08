(define (cubeLess x b) (- b (expt x 3)))

;(cubeLess 5 130)

(define (smallerCubeRecurse number limit results) (
    if(>= (cubeLess number limit) 0) 
        (smallerCubeRecurse (+ number 1) limit (cons (list number (cubeLess number limit)) results))
        (fold cons '() results)))

(define (smallerCube limit) (smallerCubeRecurse 1 limit '()))

;(smallerCube 130)

(define (restSumRecurse number limit result) (
    if(>= (cubeLess number limit) 0) 
        (restSumRecurse (+ number 1) limit (+ result (cubeLess number limit)))
        result))

(define (restSum limit) (restSumRecurse 1 limit 0))

;(restSum 130) 

(define (showAllRestSumRecurse current limit results) (
    cond
        ((> current limit) (fold cons '() results))
        ((= 0 (remainder (restSum current) 3)) (showAllRestSumRecurse (+ current 1) limit (cons (cons current (list (restSum current))) results)))
        (else (showAllRestSumRecurse (+ current 1) limit results))))

(define (showAllRestSum low high) (showAllRestSumRecurse low high '()))

(showAllRestSum 1 20)