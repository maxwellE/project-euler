(defun combinations (list)
  (loop for (a1 . r1) on list
        nconc (loop for a2 in r1 collect (list a1 a2))))

(defun number-list(upper)
  (loop for i from 1 upto upper collect i))

(defun find-pythagorean-triple(list)
  (cond
    ((null list) nil)
    ((suitable-triple (fix-params (car list))))
    (T (find-pythagorean-triple (cdr list)))))

(defun suitable-triple(list)
  (let (
	(a (- (expt (car list) 2) (expt (cadr list) 2)))
	(b (* 2 (car list) (cadr list)))
	(c (+ (expt (car list) 2) (expt (cadr list) 2))))
        (cond
	  ((= (+ a b c) 1000) (* a b c))
	  (T nil))
    ))
(defun fix-params(2-elt-list)
   (if (> (car 2-elt-list) (cadr 2-elt-list)) (list (car 2-elt-list) (cadr 2-elt-list))
       (list (cadr 2-elt-list) (car 2-elt-list))))



