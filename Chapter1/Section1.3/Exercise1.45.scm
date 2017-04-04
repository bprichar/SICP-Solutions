(define (average x y)
    (/ (+ x y) 2))

(define (average-damp f)
    (lambda (x) (average x (f x))))

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

(define (repeated function times)
    (if (= times 1)
        function
        (compose function (repeated function (- times 1)))))

(define (compose f g)
    (lambda (x) (f (g x))))

(define (square-root x)
    (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))

(define (cube-root x)
    (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))

(define (fourth-root x)
    (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y)))) 1.0))

(define (nth-root x n)
    (fixed-point ((repeated average-damp (ceiling (logB n 2))) (lambda (y) (/ x (power y (- n 1))))) 1.0))

; have to get up to the 8th power before average damping twice doesn't converge
; seems average damping log base 2 times of the power is sufficient

(define (test-nth-root x n)
    (nth-root (power x n) n))

(define (power x n)
    ((repeated (lambda (y) (* x y)) (- n 1)) x))

(define (logB x B)
    (/ (log x) (log B)))

