(defpackage :reverse-string
  (:use :cl)
  (:export :reverse-string))

(in-package :reverse-string)

(defun reverse-string (value)
  "Reverse the string `value`. Handle wide characters with care."
  (labels ((combining-char-p (c)
             (eql :nsm (sb-unicode:bidi-class c)))
           (%reverse (chars group acc)
             (cond ((endp chars)
                    (coerce (append (nreverse group) acc) 'string))
                   ((combining-char-p (first chars))
                    (%reverse (rest chars)
                              (cons (first chars) group)
                              acc))
                   (t (%reverse (rest chars)
                                (list (first chars))
                                (append (nreverse group) acc))))))
    (%reverse (coerce value 'list) nil nil)))
