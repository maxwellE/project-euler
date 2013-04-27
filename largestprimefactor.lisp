(defun is-prime(n)
  (cond
  ((= n 1) t)
  ((= n 2) t)
  ((= n 3) t)
  ((evenp n) nil)
  (T (loop for i from 2 to (ceiling (/ (isqrt n) 2)) never
  (zerop (mod n i))))))

(defun generate-primes(n)
(loop for i from 1 upto (isqrt n) when (and (zerop (mod n i)) (is-prime i)) collect i))

(defun find-biggest-prime(n)
(loop for x in (generate-primes n) maximize x))

(find-biggest-prime 600851475143)  
