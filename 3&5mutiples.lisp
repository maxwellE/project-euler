(defun multiplesFrom(low high acc)
  (cond
    ((eq low high) acc)
    ((or (eq (mod low 3) 0) (eq (mod low 5) 0)) (multiplesFrom (+ low 1) high (+ acc low)))
    (T (multiplesFrom (+ low 1) high acc))))
    