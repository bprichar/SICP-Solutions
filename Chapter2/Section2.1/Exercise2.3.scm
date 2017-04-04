(define (make-rect h w)
    (cons h w))
(define (rect-height r)
    (car r))
(define (rect-width r)
    (cdr r))

(define (rect-perimeter r)
    (+ (* 2 (rect-height r)) (* 2 (rect-width r))))

(define (rect-area r)
    (* (rect-height r) (rect-width r)))
