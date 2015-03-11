(in-package :type-i)


;;; t

(define-inference-rule true-tests (test)
  (when (eq test t)
    '((typep ? (quote t))))) ;; should be quoted, see definition of test-type
