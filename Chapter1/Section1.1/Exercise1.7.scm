; For sufficiently large numbers, the computer will not
; be able to carry enough precision to compute the difference
; between the square of the computed square root and the
; given square to within the given tolerance.
; For sufficiently small numbers, the difference between
; any small guess and the correct answer will already
; be smaller than the tolerance, and incorrect answers
; may be returned

(define (sqrt-iter prev-guess guess x)
        (if (good-enough? prev-guess guess)
             guess
             (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
        (average guess (/ x guess)))

(define (average x y)
        (/ (+ x y) 2))

(define (good-enough? prev-guess guess)
        (<= (abs (- guess prev-guess)) (* guess 0.0001)))

(define (sqrt x)
        (sqrt-iter 2.0 1.0 x))
