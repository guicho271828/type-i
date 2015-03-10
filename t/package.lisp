#|
  This file is a part of type-i project.
  Copyright (c) 2015 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage :type-i.test
  (:use :cl :type-i :fiveam :alexandria))
(in-package :type-i.test)

(def-suite :type-i)
(in-suite :type-i)

(defun subset (expected actual)
  (subsetp expected actual :test #'equal))

(test test-type
  (is (eq nil (test-type '(ababa ?))))
  (is (eq 'null (test-type '(eql nil ?))))
  (is (eq 'string (test-type '(stringp ?))))

  (is (subset '((TYPEP ? 'FIXNUM)) (type-tests 'fixnum)))

  (is (subset '((TYPEP ? 'integer)
                (integerp ?))
              (type-tests 'integer)))

  ;; more inference on integers, e.g., (< 0 ? 4), should be added
  (is (subset '((TYPEP ? '(mod 5))
                (TYPEP ? '(integer 0 4)))
              (type-tests '(mod 5))))
  (is (not (subset '((INTEGERP ?))
                   (type-tests '(mod 5)))))

  (is (equal '(integer 0 5)
             (test-type '(< 0 ? 5))))
  (is (equal '(rational 0 5/2)
             (test-type '(< 0 ? 5/2))))
  (is (equal '(single-float 0.0 5.0)
             (test-type '(< 0.0 ? 5.0))))
  (is (equal '(double-float 0.0d0 5.0d0)
             (test-type '(< 0.0d0 ? 5.0d0))))
  (is (equal '(float 0.0 5.0d0)
             (test-type '(< 0.0 ? 5.0d0))))
  (is (equal '(real 0.0 5)
             (test-type '(< 0.0 ? 5))))
  )

(eval-when (:load-toplevel :execute)
  (run! :type-i))

