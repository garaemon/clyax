(defsystem clyax
  :depends-on (cffi alexandria chimi)
  :components
  ((:file "clyax")
   (:file "library" :depends-on ("clyax"))
   ;;(:file "bindings" :depends-on ("library" "clyax"))
   (:file "xlib-bindings" :depends-on ("library" "clyax"))
   (:file "xlib-wrapper" :depends-on ("library" "clyax" "xlib-bindings"))
   (:file "gl-bindings" :depends-on ("library" "clyax"))
   (:file "gl-wrapper" :depends-on ("library" "clyax" "gl-bindings"))
   (:file "glx-bindings" :depends-on ("library" "clyax"))
   (:file "glx-wrapper" :depends-on ("library" "clyax" "glx-bindings"))
   (:file "glu-bindings" :depends-on ("library" "clyax"))
   (:file "glu-wrapper" :depends-on ("library" "clyax" "glu-bindings"))))
