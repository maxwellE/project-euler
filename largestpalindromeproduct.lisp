(defun create-list-from-number(n)
(loop for i across (write-to-string n) collect (digit-char-p i))
)

(defun is-palindrome(n)
(equal (create-list-from-number n) (reverse (create-list-from-number n))))

(defun find-largest-palindrome-product(start)
  (loop for i from start above 100 when (is-palindrome (* start i)) collect (* start i)))

(defun find-largest-palindrome-recur(start seq)
  (cond
    ((= start 100) seq)
    (T (find-largest-palindrome-recur (- start 1) (append seq (find-largest-palindrome-product start))))))

(defun max-palindrome(n)
  (loop for i in (find-largest-palindrome-recur n ()) maximize i))