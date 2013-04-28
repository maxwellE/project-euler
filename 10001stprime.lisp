(defun is-prime(n)
  (cond
  ((= n 1) t)
  ((= n 2) t)
  ((= n 3) t)
  ((evenp n) nil)
  (T (loop for i from 2 to (isqrt n) never
  (zerop (mod n i))))))

(defun find-last-prime(n)
  (let ((current 2) (primecount 1))
     (loop while (< primecount n) do 
       (when (is-prime (incf current)) (incf primecount))
	   finally (return current))))