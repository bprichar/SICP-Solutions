(define (width x)
    (/ (- (upper-bound x) (lower-bound x)) 2))

(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                   (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
    (make-interval (- (lower-bound x) (upper-bound y))
                   (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
          (p2 (* (lower-bound x) (upper-bound y)))
          (p3 (* (upper-bound x) (lower-bound y)))
          (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
    (mul-interval x
                  (make-interval (/ 1.0 (upper-bound y))
                                 (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))

; let interval1 = x1 x2
; and interval2 = y1 y2
; width i1 = (x2 - x1)/2
; width i2 = (y2 - y1)/2
; i1 + i2 = (x1 + y1) (x2 + y2)
; width i1 + i2 = ((x2 + y2) - (x1 + y1))/2
;               = (x2 - x1 + y2 - y1)/2
;               = x2/2 - x1/2 + y2/2 - y1/2
;               = (x2 - x1)/2 + (y2 - y1)/2
;               = width i1 + width i2

; but since multiplication and division
;   aren't deterministic ahead of time,
;   they can't be defined just in terms
;   of their width
