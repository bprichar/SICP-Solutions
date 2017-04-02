(define (filtered-accumulate filter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (if (filter a)
                (iter (next a) (combiner (term a) result))
                (iter (next a) result))))
    (iter a null-value))

(define (sum-square-primes a b)
    (define (next x) (+ x 1))
    (filtered-accumulate prime? + 0 square a next b))

(define (prime? n)
    (fast-prime? n 100))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((miller-rabin-test n) (fast-prime? n (- times 1)))
          (else false)))

(define (miller-rabin-test n)
    (define (try-it a)
        (define (check-it x)
            (and (not (= x 0)) (= x 1)))
        (check-it (miller-rabin-expmod a (- n 1) n)))
    (try-it (+ 1 (random (- n 1)))))

(define (miller-rabin-expmod base exp m)
    (define (squaremod-with-check x)
        (define (check-nontrivial-sqrt1 x square)
            (if (and (= square 1)
                     (not (= x 1))
                     (not (= x (- m 1))))
                0
                square))
        (check-nontrivial-sqrt1 x (remainder (square x) m)))
    (cond ((= exp 0) 1)
          ((even? exp) (squaremod-with-check
                        (miller-rabin-expmod base (/ exp 2) m)))
          (else (remainder (* base (miller-rabin-expmod base (- exp 1) m)) m))))

(define (prod-pos-ints-relprime n)
    (define (filter i) (= (gcd i n) 1))
    (define (identity x) x)
    (define (next y) (+ y 1))
    (filtered-accumulate filter * 1 identity 1 next n))

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
