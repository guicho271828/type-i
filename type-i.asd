#|
  This file is a part of type-i project.
  Copyright (c) 2015 Masataro Asai (guicho2.71828@gmail.com)
|#

#|
  Author: Masataro Asai (guicho2.71828@gmail.com)
|#



(in-package :cl-user)
(defpackage type-i-asd
  (:use :cl :asdf))
(in-package :type-i-asd)


(defsystem type-i
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:introspect-environment
               :alexandria
               :optima
               :lisp-namespace)
  :components ((:module "src"
                :components
                ((:file "package"))))
  :description ""
  :in-order-to ((test-op (load-op type-i.test))))
