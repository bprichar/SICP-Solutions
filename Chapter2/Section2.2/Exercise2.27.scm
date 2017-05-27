(define nil '())

(define (deep-reverse l)
    (define (iter l r)
        (if (null? l)
            r
            (let ((first (car l)))
                (iter (cdr l) (cons (if (not (pair? first))
                                        first
                                        (deep-reverse first))
                               r)))))
    (iter l nil))
