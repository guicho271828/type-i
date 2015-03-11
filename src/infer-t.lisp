(in-package :type-i)


;;; t

(define-inference-rule true-tests (test)
  (when (eq test t)
    '((typep ? 't)
      (typep ? '(eql t))))) ;; should be quoted, see definition of test-type

(define-inference-rule eql-tests (test)
  (match test
    ((or (list 'eql '? what)
         (list 'eql what '?))
     `((typep ? '(eql ,what))))))
