(define (cuberoot-iter prev-guess guess x)
        (if (good-enough? prev-guess guess)
             guess
             (cuberoot-iter guess (improve guess x) x)))

(define (improve guess x)
        (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (average x y)
        (/ (+ x y) 2))

(define (good-enough? prev-guess guess)
        (<= (abs (- guess prev-guess)) (* guess 0.0001)))

(define (cuberoot x)
        (cuberoot-iter 2.0 1.0 x))
