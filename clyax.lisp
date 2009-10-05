;;================================================
;; clyax.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================

(defpackage :clyax
  (:use #:common-lisp #:cffi)
  (:export
   #:XFlush
   #:XOpenDisplay
   #:XDefaultRootWindow
   #:XDefaultScreen
   ;; event masks
   #:ExposureMask
   #:ButtonPressMask
   #:ButtonReleaseMask
   #:Button1MotionMask
   #:StructureNotifyMask
   #:SubstructureNotifyMask
   ;; window attibute
   #:CWEventMask
   #:CWColormap
   #:CWBackPixmap
   #:CWOverrideRedirect
   )
  )
