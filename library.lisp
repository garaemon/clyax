;;================================================
;; library.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================

(in-package :clyax)

(define-foreign-library X11
  (:darwin "/usr/X11/lib/libX11.dylib"))
(define-foreign-library _trap_gl
  (:darwin "/System/Library/Frameworks/OpenGL.framework/Versions/A/OpenGL"))
(define-foreign-library gl
  (:darwin "/opt/local/lib/libGL.dylib"))

(use-foreign-library X11)
(use-foreign-library _trap_gl)
(use-foreign-library gl)
