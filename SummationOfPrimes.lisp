(defun sum-of-primes(uppercount current sum)
(cond
  ((= current uppercount) sum)
  ((is-prime current) (sum-of-primes uppercount (+ 1 current) (+ sum current)))
  (T (sum-of-primes uppercount (+ 1 current) sum))))

(defun is-prime(n)
  (cond
  ((= n 1) t)
  ((= n 2) t)
  ((= n 3) t)
  ((evenp n) nil)
  (T (loop for i from 2 to (isqrt n) never
  (zerop (mod n i))))))