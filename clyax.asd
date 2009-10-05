(defsystem clyax
  :depends-on (cffi alexandria)
  :components
  ((:file "clyax")
   (:file "library" :depends-on ("clyax"))
   (:file "bindings" :depends-on ("library" "clyax")))
  )
