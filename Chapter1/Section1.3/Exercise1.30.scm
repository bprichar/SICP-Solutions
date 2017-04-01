(define (cube x) (* x x x))

(define (sum term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))))
    (iter a 0))

(define (reiman-integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (simpson-integral f a b n)
    (define h (/ (- b a) n))
    (define (next x) (+ x (* 2.0 h)))
    (define (term y) (+ (* 4.0 (f y)) (* 2.0 (f (+ y h)))))
    (* (/ h 3.0) (+ (f a) (f b) (sum term (+ a h) next (- b h)))))
