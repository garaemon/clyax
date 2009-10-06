;;================================================
;; library.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================

(in-package :clyax)

;;(define-foreign-library _trap_gl
;;  (:darwin "/System/Library/Frameworks/OpenGL.framework/Versions/A/OpenGL"))
(define-foreign-library X11
  (:darwin "/usr/X11/lib/libX11.dylib")
  (t "/usr/lib/libX11.so")
  )
  ;;(:darwin "/opt/local/lib/libX11.dylib"))

(define-foreign-library gl
  ;;(:darwin "/opt/local/lib/libGL.dylib"))
  (:darwin "/usr/X11/lib/libGL.dylib")
  (t "/usr/lib/libGL.so"))

(define-foreign-library glu
  ;;(:darwin "/opt/local/lib/libGL.dylib"))
  (:darwin "/usr/X11/lib/libGLU.dylib")
  (t "/usr/lib/libGLU.so"))

;;(use-foreign-library _trap_gl)
(use-foreign-library X11)
(use-foreign-library gl)
(use-foreign-library glu)
