(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(define (factorial n)
    (define (identity x) x)
    (define (next y) (+ y 1))
    (product identity 1 next n))

(define (pi-approx n)
    (define (next x) (+ x 1.0))
    (define (term y)
        (if (even? y)
            (/ (+ y 2.0) (+ y 1.0))
            (/ (+ y 1.0) (+ y 2.0))))
    (* 4.0 (product term 1.0 next n)))

(define (product-recurse term a next b)
    (if (> a b)
        1
        (* (term a) (product term (next a) next b))))
