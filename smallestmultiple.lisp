(defun smallest-multiple(n)
(apply #'lcm (loop for i from 1 upto n collect i)))