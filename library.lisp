;;================================================
;; library.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================

;;(in-package :clyax)
(in-package :xlib)

(define-foreign-library X11
  (:darwin "/usr/X11/lib/libX11.dylib")
  (t "/usr/lib/libX11.so"))

(in-package :gl)
#+darwin
(define-foreign-library _trap_gl
    (:darwin "/System/Library/Frameworks/OpenGL.framework/Versions/A/OpenGL"))

(define-foreign-library gl
  (:darwin "/usr/X11/lib/libGL.dylib")
  (t "/usr/lib/libGL.so"))

(in-package :glu)
(define-foreign-library glu
  (:darwin "/usr/X11/lib/libGLU.dylib")
  (t "/usr/lib/libGLU.so"))


#+darwin
(progn
  (in-package :gl)
  (use-foreign-library _trap_gl)
  )
(in-package :xlib)
(use-foreign-library X11)
(in-package :gl)
(use-foreign-library gl)
(in-package :glu)
(use-foreign-library glu)
