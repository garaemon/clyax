;;================================================
;; glx-wrapper.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================
(declaim (optimize (debug 3)
                   (safety 3)))



(in-package :glx)

(defun choose-visual (&key
                      (display nil)
                      (screen nil)
                      (attribute nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (screen :screen #'null)
                    (attribute :attribute #'null))
  (glXChooseVisual display
                   screen
                   attribute))

(defun create-context (&key
                       (display nil)
                       (visual-info nil)
                       (context (cffi:null-pointer))
                       (directp nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (visual-info :visual-info #'null))
  (glXCreateContext display
                    visual-info
                    context
                    (if directp 1 0)))

(defun make-current (&key
                     (display nil)
                     (drawable nil)
                     (glx-context nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (drawable :drawable #'null)
                    (glx-context :glx-context #'null))
  (glxMakeCurrent display drawable glx-context))

(defun get-current-drawable ()
  (glxGetCurrentDrawable))

(defun get-current-context ()
  (glxGetCurrentContext))

(defun swap-buffers (&key
                     (display nil)
                     (drawable nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (drawable :drawable #'null))
  (glXSwapBuffers display drawable))

(alexandria:define-constant +USE-GL+ GLX_USE_GL)
(alexandria:define-constant +BUFFER-SIZE+ GLX_BUFFER_SIZE)
(alexandria:define-constant +LEVEL+ GLX_LEVEL)
(alexandria:define-constant +RGBA+ GLX_RGBA)
(alexandria:define-constant +DOUBLEBUFFER+ GLX_DOUBLEBUFFER)
(alexandria:define-constant +STEREO+ GLX_STEREO)
(alexandria:define-constant +AUX-BUFFERS+ GLX_AUX_BUFFERS)
(alexandria:define-constant +RED-SIZE+ GLX_RED_SIZE)
(alexandria:define-constant +GREEN-SIZE+ GLX_GREEN_SIZE)
(alexandria:define-constant +BLUE-SIZE+ GLX_BLUE_SIZE)
(alexandria:define-constant +ALPHA-SIZE+ GLX_ALPHA_SIZE)
(alexandria:define-constant +DEPTH-SIZE+ GLX_DEPTH_SIZE)
(alexandria:define-constant +STENCIL-SIZE+ GLX_STENCIL_SIZE)
(alexandria:define-constant +ACCUM-RED-SIZE+ GLX_ACCUM_RED_SIZE)
(alexandria:define-constant +ACCUM-GREEN-SIZE+ GLX_ACCUM_GREEN_SIZE)
(alexandria:define-constant +ACCUM-BLUE-SIZE+ GLX_ACCUM_BLUE_SIZE)
(alexandria:define-constant +ACCUM-ALPHA-SIZE+ GLX_ACCUM_ALPHA_SIZE)
