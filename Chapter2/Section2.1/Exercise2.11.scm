(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                   (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
    (make-interval (- (lower-bound x) (upper-bound y))
                   (- (upper-bound x) (lower-bound y))))

; I don't think it is more performant or clearer, but it does satisfy the exercise
(define (mul-interval x y)
    (define (spans-zero? i)
        (and (negative? (lower-bound i)) (positive? (upper-bound i))))
    (let ((xl (lower-bound x))
          (xu (upper-bound x))
          (yl (lower-bound y))
          (yu (upper-bound y)))
        (cond ((and (positive? xl) (positive? yl)) ; both wholly positive
               (make-interval (* xl yl) (* xu yu)))
              ((and (positive? xl) (negative? yu)) ; x wholly positive, y wholly negative
               (make-interval (* xu yl) (* xl yu)))
              ((and (positive? xl) (spans-zero? y)) ; x wholly positive, y spans 0
               (make-interval (* xu yl) (* xu yu)))
              ((and (negative? xu) (positive? yl)) ; x wholly negative, y wholly positive
               (make-interval (* xl yu) (* xu yl)))
              ((and (negative? xu) (negative? yu)) ; both wholly negative
               (make-interval (* xu yu) (* xl yl)))
              ((and (negative? xu) (spans-zero? y)) ; x wholly negative, y spans 0
               (make-interval (* xl yu) (* xl yl)))
              ((and (spans-zero? x) (positive? yl)) ; x spans 0, y wholly positive
               (make-interval (* xl yu) (* xu yu)))
              ((and (spans-zero? x) (negative? yu)) ; x spans 0, y wholly negative
               (make-interval (* xu yl) (* xl yl)))
              (else ; both span 0
                (make-interval (min (* xl yu) (* xu yl)) (max (* xl yl) (* xu yu)))))))

(define (mul-interval x y)
    (let ((p1 (* (lower-bound x) (lower-bound y)))
          (p2 (* (lower-bound x) (upper-bound y)))
          (p3 (* (upper-bound x) (lower-bound y)))
          (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
    (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
         (error "Error: Division by interval which spans 0")
         (mul-interval x
                       (make-interval (/ 1.0 (upper-bound y))
                                      (/ 1.0 (lower-bound y))))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (car x))

(define (upper-bound x) (cdr x))
