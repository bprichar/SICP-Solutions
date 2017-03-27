(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
        (if (not (> (abs angle) 0.1))
            angle
            (p (sine (/ angle 3.0)))))

; (sine 12.15) will cause p to be applied
;              5 times (until angle is < 0.1)

; order of growth of space and steps is logarithmic
; with the angle
