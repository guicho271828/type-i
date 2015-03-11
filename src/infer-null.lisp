(in-package :type-i)


;;; null

(defvar +null-tests+
    `((typep ? 'null)
      (typep ? '(eql nil))
      (null ?)
      (eql ? nil)
      (eql nil ?)
      (eq ? nil)
      (eq nil ?)
      (equal ? nil)
      (equal nil ?)
      (equalp ? nil)
      (equalp nil ?)))

(define-inference-rule null-tests (test)
  (when (member test +null-tests+ :test #'equal)
    +null-tests+))
