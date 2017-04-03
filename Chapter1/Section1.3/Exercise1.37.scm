(define (cont-frac-rec n d k)
    (define (loop c)
        (if (= c k)
            (/ (n c) (d c))
            (/ (n c) (+ (d c) (loop (+ c 1))))))
    (run 1))

(define (cont-frac n d k)
    (define (iter c result)
        (if (= c 0)
            result
            (iter (- c 1) (/ (n c) (+ (d c) result)))))
    (iter k 0))
