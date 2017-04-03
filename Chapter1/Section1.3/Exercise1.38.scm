(define (cont-frac n d k)
    (define (iter c result)
        (if (= c 0)
            result
            (iter (- c 1) (/ (n c) (+ (d c) result)))))
    (iter k 0))

(define (approx-e k)
    (define (n y)
        (if (= (remainder (+ y 1) 3) 0)
            (* 2 (/ (+ y 1) 3))
            1))
    (+ 2 (cont-frac (lambda (x) 1.0) n k)))
