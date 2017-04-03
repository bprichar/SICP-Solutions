(define (smooth f)
    (lambda (x) (/ (+ (f (- x dx))
                      (f x)
                      (f (+ x dx)))
                    3)))

(define (nth-smooth f n)
    ((repeated smooth n) f))

(define (repeated function times)
    (if (= times 1)
        function
        (compose function (repeated function (- times 1)))))

(define (compose f g)
    (lambda (x) (f (g x))))
