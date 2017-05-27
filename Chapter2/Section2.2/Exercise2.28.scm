(define (fringe tree)
    (define (build-fringe t r)
        (cond ((null? t) r)
              ((not (pair? t)) (cons t r))
              (else (build-fringe (car t) (build-fringe (cdr t) r)))))
    (build-fringe tree `()))

(define x (list (list 1 2) (list 3 4)))
