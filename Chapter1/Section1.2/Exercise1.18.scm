(define (* a b)
    (define (iter a b product)
            (cond ((= b 0) product)
                  ((even? b) (iter (double a) (halve b) product))
                  (else (iter a (- b 1) (+ product a)))))
    (iter a b 0))

(define (double x)
        (+ x x))

(define (halve x)
        (/ x 2))

(define (even? x)
        (= (remainder x 2) 0))
