(defun sum-squares(upper)
(reduce #'+ (loop for i from 1 upto upper collect (expt i 2))))

(defun square-sum(upper)
(expt (loop for i from 1 upto upper sum i) 2))

