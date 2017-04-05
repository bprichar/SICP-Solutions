(define (cons a b)
    (* (power 2 a) (power 3 b)))

(define (car x)
    (num-divisions x 2))

(define (cdr x)
    (num-divisions x 3))

(define (num-divisions x y)
    (define (iter remaining count)
        (if (= (remainder remaining y) 0)
            (iter (/ remaining y) (+ count 1))
            count))
    (iter x 0))

(define (power x n)
    ((repeated (lambda (y) (* x y)) (- n 1)) x))

(define (repeated function times)
    (if (= times 1)
        function
        (compose function (repeated function (- times 1)))))

(define (compose f g)
    (lambda (x) (f (g x))))
