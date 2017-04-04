(define (iterative-improve good-enough? improve)
    (define (iter guess) (if (good-enough? guess)
                             guess
                             (iter (improve guess))))
    iter)

(define (fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next))))
    (try first-guess))

(define (fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (good-enough? guess)
        (< (abs (- guess (f guess))) tolerance))
    ((iterative-improve good-enough? f) first-guess))

(define (square-root x)
    ((iterative-improve (lambda (guess) (< (abs (- (square guess) x)) 0.00001))
                        (average-damp (lambda (y) (/ x y))))
                                                             1.0))

(define (average x y)
    (/ (+ x y) 2))

(define (average-damp f)
    (lambda (x) (average x (f x))))

