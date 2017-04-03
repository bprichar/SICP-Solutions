(define (repeated function times)
    (if (= times 1)
        function
        (compose function (repeated function (- times 1)))))

(define (compose f g)
    (lambda (x) (f (g x))))
