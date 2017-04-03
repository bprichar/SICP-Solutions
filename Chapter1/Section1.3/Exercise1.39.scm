(define (cont-frac n d k)
    (define (iter c result)
        (if (= c 0)
            result
            (iter (- c 1) (/ (n c) (+ (d c) result)))))
    (iter k 0))

(define (tan-cf x k)
    (cont-frac (lambda (i) (if (= i 1)
                                x
                                (- (* x x))))
               (lambda (i) (- (* i 2) 1))
               k))
