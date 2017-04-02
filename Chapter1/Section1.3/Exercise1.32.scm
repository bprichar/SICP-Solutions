(define (product term a next b)
    (accumulate * 1 term a next b))

(define (sum term a next b)
    (accumulate + 0 term a next b))

(define (accumulate combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner result (term a)))))
    (iter a null-value))

(define (factorial n)
    (define (identity x) x)
    (define (next y) (+ y 1))
    (product identity 1 next n))

(define (accumulate-recurse combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b))))
