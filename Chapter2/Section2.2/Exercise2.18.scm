(define (reverse l)
    (define (iter l r)
        (if (null? l)
            r
            (iter (cdr l) (cons (car l) r))))
    (iter l '()))
