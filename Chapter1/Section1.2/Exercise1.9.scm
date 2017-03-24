(define (+ a b)
        (if (= a 0)
            b
            (inc (+ (dec a) b)))) ; recursive
(define (inc a)
        (+ a 1))
(define (dec a)
        (- a 1))

(+ 4 5)

(if (= 4 0)
    5
    (inc (+ (dec 4) 5)))
(inc (+ (dec 4) 5))
(inc (+ (- 4 1) 5))
(inc (+ 3 5))
(inc (if (= 3 0)
         5
         (inc (+ (dec 3) 5))))
(inc (inc (+ (dec 3) 5)))
(inc (inc (+ (- 3 1) 5)))
(inc (inc (+ 2 5)))
(inc (inc (if (= 2 0)
              5
              (inc (+ (dec 2) 5)))))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (+ (- 2 1) 5))))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (if (= 1 0)
                   5
                   (inc (+ (dec 1) 5))))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ (- 1 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc (if (= 0 0)
                        5
                        (inc (+ (dec 0) 5)))))))
(inc (inc (inc (inc 5))))
(inc (inc (inc (+ 5 1))))
(inc (inc (inc 6)))
(inc (inc (+ 6 1)))
(inc (inc 7))
(inc (+ 7 1))
(inc 8)
(+ 8 1)
9

(define (+ a b)
        (if (= a 0)
            b
            (+ (dec a) (inc b)))); iterative

(+ 4 5)
(if (= 4 0)
    5
    (+ (dec 4) (inc 5)))
(+ (dec 4) (inc 5))
(+ (- 4 1) (+ 5 1))
(+ 3 6)
(if (= 3 0)
    6
    (+ (dec 3) (inc 6)))
(+ (dec 3) (inc 6))
(+ (- 3 1) (+ 6 1))
(+ 2 7)
(if (= 2 0)
    7
    (+ (dec 2) (inc 7)))
(+ (dec 2) (inc 7))
(+ (- 2 1) (+ 7 1))
(+ 1 8)
(if (= 1 0)
    8
    (+ (dec 1) (inc 8)))
(+ (dec 1) (inc 8))
(+ 0 9)
(if (= 0 0)
    9
    (+ (dec 0) (inc 9)))
9
