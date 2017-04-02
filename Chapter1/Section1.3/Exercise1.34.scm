(define (f g)
    (g 2))

; calling (f f) results in trying to apply (2 2)
; (f f) -> (f 2) -> (2 2)
