(cl:defpackage #:dna
  (:use :common-lisp)
  (:export :hamming-distance))

(in-package :dna)

(defun hamming-distance (dna1 dna2)
  (if (= (length dna1) (length dna2))
      (count nil (map 'list #'char= dna1 dna2))))
