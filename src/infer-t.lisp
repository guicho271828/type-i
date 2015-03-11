(in-package :type-i)


;;; null

(defvar +null-tests+
    `((null ?)
      (typep ? 'null)
      (eql ? nil)
      (eql nil ?)
      (eq ? nil)
      (eq nil ?)
      (equal ? nil)
      (equal nil ?)
      (equalp ? nil)
      (equalp nil ?)))

(define-inference-rule true-tests (test)
  (when (eq test t)
    '((typep ? 't)))) ;; should be quoted, see definition of test-type
