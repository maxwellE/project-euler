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
 

(defun my-is-prime (n)
  (let ((k 1))
    (loop while (< (* k k) n) do
      (when (= (mod n (incf k)) 0)
        (return 0))
      finally (return 1))))

(defun nth-prime (n)
  (let ((p-count 1) (k 2))
    (loop while (< p-count n) do
      (print k)
      (when (= (my-is-prime (incf k)) 1)
        (incf p-count))
      finally (return k))))