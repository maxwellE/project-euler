(defun generatefib(seq sum)
  (cond
    ((and (> (length seq) 0) (>  (car seq) 4000000)) sum)
    ((eq (length seq) 0) (generatefib (cons 1 seq) 0))
    ((eq (length seq) 1) (generatefib (cons 1 seq) 0))
    (T (generatefib (cons (newcar seq) seq) (newsum sum (newcar seq))))))

(defun even(n) (eq (mod n 2) 0))

(defun newsum(currentsum carval)
  (if (even carval) (+ currentsum carval)    
  currentsum ))

(defun newcar(seq)
(+ (car seq) (cadr seq))) 