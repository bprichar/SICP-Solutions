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

; h/3[y0 + 4y1 + 2y2 + 4y3 + 2y4 + ... + 4yn-2 + 2yn-1 + yn]
; h/3[f(a) + f(a+nh) + 4f(a+h) + 2f(a+2h) + ... + 4f(a+(n-2)h) + 2f(a+(n-1)h)]
; h/3[f(a) + f(b) + 4f(a+h) + 2f(a+2h) + ... + 4f(a+(n-2)h) + 2f(a+(n-1)h)]
; jm = 4f(a+k) + 2f(a+k+h); k=2mh; m=n/2 m=1 to n/2-1
; h/3[f(a) + f(b) + {j1 + j2 + ... + jm-1 + jm}]
