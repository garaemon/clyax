;;================================================
;; glu-wrapper.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================
(declaim (optimize (debug 3)
                   (safety 3)))


(in-package :glu)

(defun perspective (a b c d)
  (gluPerspective a b c d))

(defun look-at (a b c d e f g h i)
  (gluLookAt a b c d e f g h i))

