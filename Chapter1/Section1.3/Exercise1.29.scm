(define (cube x) (* x x x))

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a) (sum term (next a) next b))))

(define (reiman-integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

(define (simpson-integral f a b n)
    (define h (/ (- b a) n))
    (define (next x) (+ x (* 2.0 h)))
    (define (term y) (+ (* 4.0 (f y)) (* 2.0 (f (+ y h)))))
    (* (/ h 3.0) (+ (f a) (f b) (sum term (+ a h) next (- b h)))))

; h/3[f(a) + 4f(a+h) + 2f(a+2h) + ... + 4f(a+(n-2)h) + 2f(a+(n-1)h) + f(a+nh)]
