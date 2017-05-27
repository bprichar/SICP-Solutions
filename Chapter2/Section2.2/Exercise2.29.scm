(define (make-mobile left right)
    (list left right))

(define (make-branch length structure)
    (list length structure))

; part a
(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (car (cdr mobile)))

(define (branch-length branch)
    (car branch))

(define (branch-structure branch)
    (car (cdr branch)))

; part b
(define (total-weight mobile)
    (if (pair? mobile)
        (+ (total-weight (branch-structure (left-branch mobile)))
           (total-weight (branch-structure (right-branch mobile))))
        mobile))

(define level-1-mobile (make-mobile (make-branch 2 1)
                                    (make-branch 1 2)))
(define level-2-mobile (make-mobile (make-branch 3 level-1-mobile)
                                    (make-branch 9 1)))
(define level-3-mobile (make-mobile (make-branch 4 level-2-mobile)
                                    (make-branch 8 2)))
(define level-4-mobile (make-mobile (make-branch 3 level-3-mobile)
                                    (make-branch 3 level-2-mobile)))

; part c
(define (balanced? mobile)
    (if (pair? mobile)
        (let ((left-weight (total-weight (branch-structure (left-branch mobile))))
              (right-weight (total-weight (branch-structure (right-branch mobile))))
              (left-arm (branch-length (left-branch mobile)))
              (right-arm (branch-length (right-branch mobile))))
             (and (= (* left-weight left-arm) (* right-weight right-arm))
                  (balanced? (branch-structure (left-branch mobile)))
                  (balanced? (branch-structure (right-branch mobile)))))
        #t))

; part d
; only need to change the selectors
; (define (make-mobile left right)
;     (cons left right))
; (define (make-branch length structure)
;     (cons length structure))
; (define (left-branch mobile)
;     (car mobile))
; (define (right-branch mobile)
;     (cdr mobile))
; (define (branch-length branch)
;     (car branch))
; (define (branch-structure branch)
;     (cdr branch))
