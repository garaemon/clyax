;;================================================
;; xlib-wrapper.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================
(declaim (optimize (debug 3)
                   (safety 3)))


(in-package :xlib)
;; constants
(alexandria:define-constant +true+ True)
(alexandria:define-constant +false+ false)
;; event mask
(alexandria:define-constant +no-event-mask+ NoEventMask)
(alexandria:define-constant +key-press-mask+ KeyPressMask)
(alexandria:define-constant +key-release-mask+ KeyReleaseMask)
(alexandria:define-constant +button-press-mask+ ButtonPressMask)
(alexandria:define-constant +button-release-mask+ ButtonReleaseMask)
(alexandria:define-constant +enter-window-mask+ EnterWindowMask)
(alexandria:define-constant +leave-window-mask+ LeaveWindowMask)
(alexandria:define-constant +pointer-motion-mask+ PointerMotionMask)
(alexandria:define-constant +pointer-motion-hint-mask+ PointerMotionHintMask)
(alexandria:define-constant +button1-motion-mask+ Button1MotionMask)
(alexandria:define-constant +button2-motion-mask+ Button2MotionMask)
(alexandria:define-constant +button3-motion-mask+ Button3MotionMask)
(alexandria:define-constant +button4-motion-mask+ Button4MotionMask)
(alexandria:define-constant +button5-motion-mask+ Button5MotionMask)
(alexandria:define-constant +button-motion-mask+ ButtonMotionMask)
(alexandria:define-constant +keymap-state-mask+ KeymapStateMask)
(alexandria:define-constant +exposure-mask+ ExposureMask)
(alexandria:define-constant +visibility-change-mask+ VisibilityChangeMask)
(alexandria:define-constant +structure-notify-mask+ StructureNotifyMask)
(alexandria:define-constant +resize-redirect-mask+ ResizeRedirectMask)
(alexandria:define-constant +substructure-notify-mask+ SubstructureNotifyMask)
(alexandria:define-constant +substructure-redirect-mask+ SubstructureRedirectMask)
(alexandria:define-constant +focus-change-mask+ FocusChangeMask)
(alexandria:define-constant +preperty-change-mask+ PropertyChangeMask)
(alexandria:define-constant +colormap-change-mask+ ColormapChangeMask)
(alexandria:define-constant +owner-grab-button-mask+ OwnerGrabButtonMask)

;; CWxxx
(alexandria:define-constant +cw-back-pixmap+ CWBackPixmap)
(alexandria:define-constant +cw-back-pixel+ CWBackPixel)
(alexandria:define-constant +cw-border-pixmap+ CWBorderPixmap)
(alexandria:define-constant +cw-border-pixel+ CWBorderPixel)
(alexandria:define-constant +cw-bit-gravity+ CWBitGravity)
(alexandria:define-constant +cw-win-gravity+ CWWinGravity)
(alexandria:define-constant +cw-backing-store+ CWBackingStore)
(alexandria:define-constant +cw-backing-planes+ CWBackingPlanes)
(alexandria:define-constant +cw-backing-pixel+ CWBackingPixel)
(alexandria:define-constant +cw-override-redirect+ CWOverrideRedirect)
(alexandria:define-constant +cw-save-under+ CWSaveUnder)
(alexandria:define-constant +cw-event-mask+ CWEventMask)
(alexandria:define-constant +cw-dont-propagate+ CWDontPropagate)
(alexandria:define-constant +cw-colormap+ CWColormap)
(alexandria:define-constant +cw-cursor+ CWCursor)
(alexandria:define-constant +cw-x+ CWX)
(alexandria:define-constant +cw-y+ CWY)
(alexandria:define-constant +cw-width+ CWWidth)
(alexandria:define-constant +cw-height+ CWHeight)
(alexandria:define-constant +cw-border-width+ CWBorderWidth)
(alexandria:define-constant +cw-sibling+ CWSibling)
(alexandria:define-constant +cw-stack-mode+ CWStackMode)

(alexandria:define-constant +xy-bitmap+ XYBitmap)
(alexandria:define-constant +xy-pixmap+ XYPixmap)
(alexandria:define-constant +z-pixmap+ ZPixmap)

(alexandria:define-constant +none+ None)

(alexandria:define-constant +alloc-none+ AllocNone)
(alexandria:define-constant +alloc-all+ AllocAll)

(alexandria:define-constant +input-output+ InputOutput)
(alexandria:define-constant +input-only+ InputOnly)

(alexandria:define-constant +Static-Gray+ StaticGray)
(alexandria:define-constant +Gray-Scale+ GrayScale)
(alexandria:define-constant +Static-Color+ StaticColor)
(alexandria:define-constant +Pseudo-Color+ PseudoColor)
(alexandria:define-constant +True-Color+ TrueColor)
(alexandria:define-constant +Direct-Color+ DirectColor)

;; events
(alexandria:define-constant +key-press+ KeyPress)
(alexandria:define-constant +key-release+ KeyRelease)
(alexandria:define-constant +button-press+ ButtonPress)
(alexandria:define-constant +button-release+ ButtonRelease)
(alexandria:define-constant +motion-notify+ MotionNotify)
(alexandria:define-constant +enter-notify+ EnterNotify)
(alexandria:define-constant +leave-notify+ LeaveNotify)
(alexandria:define-constant +focus-in+ FocusIn)
(alexandria:define-constant +focus-out+ FocusOut)
(alexandria:define-constant +keymap-notify+ KeymapNotify)
(alexandria:define-constant +expose+ Expose)
(alexandria:define-constant +graphics-expose+ GraphicsExpose)
(alexandria:define-constant +no-expose+ NoExpose)
(alexandria:define-constant +visibility-notify+ VisibilityNotify)
(alexandria:define-constant +create-notify+ CreateNotify)
(alexandria:define-constant +destroy-notify+ DestroyNotify)
(alexandria:define-constant +unmap-notify+ UnmapNotify)
(alexandria:define-constant +map-notify+ MapNotify)
(alexandria:define-constant +map-request+ MapRequest)
(alexandria:define-constant +reparent-notify+ ReparentNotify)
(alexandria:define-constant +configure-notify+ ConfigureNotify)
(alexandria:define-constant +configure-request+ ConfigureRequest)
(alexandria:define-constant +gravity-notify+ GravityNotify)
(alexandria:define-constant +resize-request+ ResizeRequest)
(alexandria:define-constant +circulate-notify+ CirculateNotify)
(alexandria:define-constant +circulate-request+ CirculateRequest)
(alexandria:define-constant +property-notify+ PropertyNotify)
(alexandria:define-constant +selection-clear+ SelectionClear)
(alexandria:define-constant +selection-request+ SelectionRequest)
(alexandria:define-constant +selection-notify+ SelectionNotify)
(alexandria:define-constant +colormap-notify+ ColormapNotify)
(alexandria:define-constant +client-message+ ClientMessage)
(alexandria:define-constant +mapping-notify+ MappingNotify)
(alexandria:define-constant +generic-event+ GenericEvent)
(alexandria:define-constant +last-event+ LASTEvent)

(alexandria:define-constant +us-position+ USPosition)
(alexandria:define-constant +us-size+ USSize)
(alexandria:define-constant +p-position+ PPosition)
(alexandria:define-constant +p-size+ PSize)
(alexandria:define-constant +p-min-size+ PMinSize)
(alexandria:define-constant +p-max-size+ PMaxSize)
(alexandria:define-constant +p-resize-inc+ PResizeInc)
(alexandria:define-constant +p-aspect+ PAspect)
(alexandria:define-constant +p-base-size+ PBaseSize)
(alexandria:define-constant +p-win-gravity+ PWinGravity)
(alexandria:define-constant +p-all-hints+ PAllHints)

(defun match-visual-info (&key
                          (display nil)
                          (screen nil)
                          (depth nil)
                          (class nil)
                          (visual-info nil))
  (check-args-error "You have to set"
                          (display :display #'null)
                          (screen :screen #'null)
                          (class :class #'null)
                          (visual-info :visual-info #'null))
  (XMatchVisualInfo display screen
                    depth class
                    visual-info))

(defun create-colormap (&key
                        (display nil)
                        (window nil)
                        (visual nil)    ;!!!!
                        (alloc nil))
  (check-args-error "You have to set"
                          (display :display #'null)
                          (window :window #'null)
                          (visual :visual #'null)
                          (alloc :alloc #'null))
  (XCreateColormap display window visual alloc))

(defun create-window (&key
                      (display nil)
                      (parent nil)
                      (screen nil)
                      (x nil)
                      (y nil)
                      (depth 24)
                      (width nil) (height nil)
                      (event-mask 0)
                      (attribute-mask 0)
                      (attribute nil)
                      (override-redirect 1)
                      (visual-info nil)
                      (class +input-output+)
                      (border-width 2))
  ;; check arguments
  (check-args-error "You have to set"
                          (display :display #'null)
                          (parent :parent #'null)
                          (x :x #'null)
                          (y :y #'null)
                          (width :width #'null)
                          (height :height #'null))
  (let ((vi (if visual-info
                visual-info
                (cffi:foreign-alloc 'XVisualInfo))))
    ;; setup visual
    (unless visual-info
      (match-visual-info :display display
                         :screen screen
                         :depth depth
                         :class +true-color+
                         :visual-info vi))
    ;; VisualInfo -> Visual
    (let* ((vis (visual-info-visual vi))
           (colormap (unless attribute (create-colormap :display display
                                                        :window parent
                                                        :visual vis
                                                        :alloc +alloc-none+))))
      (let ((xattr (if attribute
                      attribute
                      (create-set-window-attributes
                       :event-mask event-mask
                       :colormap colormap
                       :override-redirect override-redirect))))
      (let ((ret (XCreateWindow
                  display
                  parent
                  x y                   ;x, y
                  width height          ;width, height
                  border-width
                  depth
                  class
                  vis
                  attribute-mask
                  xattr)))
        ;; mask event...
        ret)))))

(defun select-input (&key
                     (display nil)
                     (drawable nil)
                     (mask nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (drawable :drawable #'null)
                    (mask :mask #'null))
  (XSelectInput display drawable mask))
                
  
(defun create-size-hints (&key
                          (x nil)
                          (y nil)
                          (width nil)
                          (height nil)
                          (flags 0)
                          (min-width nil)
                          (min-height nil)
                          (base-width nil)
                          (base-height nil)
                          (win-gravity nil)
                          (max-aspect nil)
                          (min-aspect nil)
                          (set-normal-hints-p nil)
                          (display nil)
                          (drawable nil))
  (let ((hint (cffi:foreign-alloc 'XSizeHints)))
    (labels ((set-slot (val slot)
               (if val
                   (setf (foreign-slot-value hint
                                             'XSizeHints
                                             slot)
                         val))))
      (iterate:iter
        (iterate:for slot-val in (list (cons x 'x)
                                       (cons y 'y)
                                       (cons width 'width)
                                       (cons height 'height)
                                       (cons flags 'flags)
                                       (cons min-width 'mon_width)
                                       (cons min-height 'mon_height)
                                       (cons base-width 'base_width)
                                       (cons base-height 'base_height)
                                       (cons win-gravity 'win_gravity)
                                       (cons max-aspect 'max_aspect)
                                       (cons min-aspect 'min_aspect)))
        (set-slot (car slot-val) (cdr slot-val))))
    (if set-normal-hints-p
        (xlib:set-normal-hints :display display
                               :window drawable
                               :size-hints hint))
    hint))

(defun set-normal-hints (&key
                         (display nil)
                         (window nil)
                         (size-hints nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (window :window #'null)
                    (size-hints :size-hints #'null))
  (XSetNormalHints display window size-hints))

(defun set-standard-properties (&key
                                (display nil)
                                (window nil)
                                (window-name "")
                                (icon-name "")
                                (pixmap nil)
                                (size-hints nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (window :window #'null)
                    (pixmap :pixmap #'null)
                    (size-hints :size-hints #'null))
  (XSetStandardProperties display
                          window
                          window-name
                          icon-name
                          pixmap
                          (cffi:null-pointer) ;argv
                          0                   ;argc
                          size-hints))

(defun clear-window (&key
                     (display nil)
                     (drawable nil)
                     (x nil)
                     (y nil)
                     (width nil)
                     (height nil)
                     (exposurep t))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (drawable :drawable #'null)
                    (x :x #'null)
                    (y :y #'null)
                    (width :width #'null)
                    (height :height #'null))
  (XClearArea display drawable
              x y
              width height
              (if exposurep 1 0)))

(defun map-window (&key
                   (display nil)
                   (drawable nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (drawable :drawable #'null))
  (XMapWindow display drawable))

(defun unmap-window (&key
                     (display nil)
                     (drawable nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (drawable :drawable #'null))
  (XUnmapWindow display drawable))

(defun create-gc (&key
                  (display nil)
                  (drawable nil)
                  (value-mask 0)
                  (values (cffi:null-pointer)))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (drawable :drawable #'null))
  (XCreateGC display drawable
             value-mask values))

(defun create-image (&key
                     (display nil)
                     (visual nil)
                     (depth 24)
                     (format +z-pixmap+)
                     (offset 0)
                     (data nil)
                     (width nil)
                     (height nil)
                     (bitmap-pad nil)
                     (bytes-per-line nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (visual :visual #'null)
                    (width :width #'null)
                    (height :height #'null)
                    (bitmap-pad :bitmap-pad #'null)
                    (bytes-per-line :bytes-per-line #'null))
  (XCreateImage display visual
                depth format offset
                data width height
                bitmap-pad bytes-per-line))

(defun put-image (&key
                  (display nil)
                  (drawable nil)
                  (gcontext nil)
                  (image nil)
                  (src-x nil) (src-y nil)
                  (dest-x nil) (dest-y nil)
                  (width nil) (height nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (drawable :drawable #'null)
                    (src-x :src-x #'null)
                    (src-y :src-y #'null)
                    (dest-x :dest-x #'null)
                    (dest-y :dest-y #'null)
                    (width :width #'null)
                    (height :height #'null))
  (XPutImage display drawable gcontext
             image src-x src-y
             dest-x dest-y
             width height))

(defun move-window (&key
                    (display nil)
                    (drawable nil)
                    (x nil) (y nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (drawable :drawable #'null)
                    (x :x #'null)
                    (y :y #'null))
  (XMoveWindow display drawable x y))

(defun default-visual (&key
                       (display nil)
                       (screen nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (screen :screen #'null))
  (XDefaultVisual display screen))

(defun free (obj)
  (XFree obj))

(defun create-set-window-attributes (&key
                                     (background-pixmap (cffi:null-pointer))
                                     (background-pixel nil)
                                     (border-pixmap (cffi:null-pointer))
                                     (border-pixel nil)
                                     (bit-gravity nil)
                                     (win-gravity nil)
                                     (backing-store nil)
                                     (backing-planes nil)
                                     (backing-pixel nil)
                                     (save-under nil)
                                     (event-mask nil)
                                     (do-not-propagate-mask nil)
                                     (override-redirect nil)
                                     (colormap nil)
                                     (cursor nil))
  (let ((obj (cffi:foreign-alloc 'XSetWindowAttributes)))
    (labels ((set-slot (val slot)
               (if val
                   (setf (foreign-slot-value obj
                                             'XSetWindowAttributes
                                             slot)
                         val))))
      (iterate:iter
        (iterate:for slot-val in (list (cons background-pixmap
                                             'background_pixmap)
                                       (cons background-pixel
                                             'background_pixel)
                                       (cons border-pixmap
                                             'border_pixmap)
                                       (cons border-pixel
                                             'border_pixel)
                                       (cons bit-gravity
                                             'bit_gravity)
                                       (cons win-gravity
                                             'win_gravity)
                                       (cons backing-store
                                             'backing_store)
                                       (cons backing-planes
                                             'backing_planes)
                                       (cons backing-pixel
                                             'backing_pixel)
                                       (cons save-under
                                             'save_under)
                                       (cons event-mask
                                             'event_mask)
                                       (cons do-not-propagate-mask
                                             'do_not_propagate_mask)
                                       (cons override-redirect
                                             'override_redirect)
                                       (cons colormap 'colormap)
                                       (cons cursor 'cursor)))
        (set-slot (car slot-val) (cdr slot-val)))
      (sleep 1)
      obj)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; XEvent
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun new-event ()
  (cffi:foreign-alloc 'XEvent))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; struct accessors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; XEvent accessors
(chimi:defcstruct-accessors event-
    (type xany xkey xbutton xmotion
     xcrossing xfocus xexpose xgraphicsexpose
     xnoexpose xvisibility xcreatewindow
     xdestroywindow xunmap xmap
     xmaprequest xreparent xconfigure
     xgravity xresizerequest xconfigurerequest
     xcirculate xcirculaterequest xproperty
     xselectionclear xselectionrequest xselection
     xcolormap xclient xmapping xerror xkeymap pad)
  'XEvent)

;; visualinfo accessors
(chimi:defcstruct-accessors visual-info-
    (visual visualid screen depth class red_mask green_mask blue_mask
     colormap_size bits_per_rgb)
  'XVisualInfo)

;; SetWindowAttributes accessors
(chimi:defcstruct-accessors set-window-attributes-
    (background_pixmap background_pixel border_pixmap
     border_pixel bit_gravity win_gravity backing_store
     backing_planes backing_pixel save_under event_mask
     do_not_propagate_mask override_redirect colormap cursor)
  'XSetWindowAttributes)

(defun open-display (&key (host ""))
  (XOpenDisplay host))

(defun default-root-window (&key (display nil))
  (check-args-error "You have to set"
                    (display :display #'null))
  (XDefaultRootWindow display))

(defun default-screen (&key (display nil))
  (check-args-error "You have to set"
                    (display :display #'null))
  (XDefaultScreen display))

(defun sync (&key
             (display nil)
             (discardp nil))
  (check-args-error "You have to set"
                    (display :display #'null))
  (Xsync display (if discardp 1 0)))

(defun flush (&key (display nil))
  (check-args-error "You have to set"
                    (display :display #'null))
  (XFlush display))

(defun events-queued (&key (display nil) (mode 0))
  (check-args-error "You have to set"
                    (display :display #'null))
  (XEventsQueued display mode))

(defun next-event (&key (display nil) (event nil))
  (check-args-error "You have to set"
                    (display :display #'null)
                    (event :event #'null))
  (XNextEvent display event))

;; utils
(alexandria:define-constant +x-event-types-alist+
    (list (cons +key-press+ 'XKeyEvent)
          (cons +key-release+ 'XKeyEvent)
          (cons +button-press+ 'XButtonEvent)
          (cons +button-release+ 'XButtonEvent)
          (cons +motion-notify+ 'XMotionEvent)
          (cons +enter-notify+ 'XCrossingEvent)
          (cons +leave-notify+ 'XCrossingEvent)
          (cons +focus-in+ 'XFocusChangeEvent)
          (cons +focus-out+ 'XFocusChangeEvent)
          (cons +keymap-notify+ 'XkeymapEvent)
          (cons +expose+ 'XExposeEvent)
          (cons +graphics-expose+ 'XGraphicsExposeEvent)
          (cons +no-expose+ 'XNoExposeEvent)
          (cons +visibility-notify+ 'XVisibilityEvent)
          (cons +create-notify+ 'XCreateWindowEvent)
          (cons +destroy-notify+ 'XDestroyWindowEvent)
          (cons +unmap-notify+ 'XUnmapEvent)
          (cons +map-notify+ 'XMapEvent)
          (cons +map-request+ 'XMapRequestEvent)
          (cons +reparent-notify+ 'XReparentEvent)
          (cons +configure-notify+ 'XConfigureEvent)
          (cons +configure-request+ 'XConfigureRequestEvent)
          (cons +gravity-notify+ 'XGravityEvent)
          (cons +resize-request+ 'XResizeRequestEvent)
          (cons +circulate-notify+ 'XCirculateEvent)
          (cons +circulate-request+ 'XCirculateRequestEvent)
          (cons +property-notify+ 'XPropertyEvent)
          (cons +selection-clear+ 'XSelectionClearEvent)
          (cons +selection-request+ 'XSelectionRequestEvent)
          (cons +selection-notify+ 'XSelectionEvent)
          (cons +colormap-notify+ 'XColormapEvent)
          (cons +client-message+ 'XClientMessageEvent)
          (cons +mapping-notify+ 'XMappingEvent)
          (cons +generic-event+ 'XGenericEvent)
          (cons  +last-event+ 'XAnyEvent)) ;???
  :test #'equal)

(alexandria:define-constant +x-event-slots-alist+
    (list (cons +key-press+ 'xany)
          (cons +key-release+ 'xkey)
          (cons +button-press+ 'xbutton)
          (cons +button-release+ 'xbutton)
          (cons +motion-notify+ 'xmotion)
          (cons +enter-notify+ 'xcrossing)
          (cons +leave-notify+ 'xcrossing)
          (cons +focus-in+ 'xfocus)
          (cons +focus-out+ 'xfocus)
          (cons +keymap-notify+ 'xkeymap)
          (cons +expose+ 'xexpose)
          (cons +graphics-expose+ 'xgraphicsexpose)
          (cons +no-expose+ 'xnoexpose)
          (cons +visibility-notify+ 'xvisibility)
          (cons +create-notify+ 'xcreatewindow)
          (cons +destroy-notify+ 'xdestroywindow)
          (cons +unmap-notify+ 'xunmap)
          (cons +map-notify+ 'xmap)
          (cons +map-request+ 'xmaprequest)
          (cons +reparent-notify+ 'xreparent)
          (cons +configure-notify+ 'xconfigure)
          (cons +configure-request+ 'xconfigurerequest)
          (cons +gravity-notify+ 'xgravity)
          (cons +resize-request+ 'xresizerequest)
          (cons +circulate-notify+ 'xcirculate)
          (cons +circulate-request+ 'xcirculaterequest)
          (cons +property-notify+ 'xproperty)
          (cons +selection-clear+ 'xselectionclear)
          (cons +selection-request+ 'xselectionrequest)
          (cons +selection-notify+ 'xselection)
          (cons +colormap-notify+ 'xcolormap)
          (cons +client-message+ 'xclient)
          (cons +mapping-notify+ 'xmapping)
          (cons +generic-event+ 'xany)     ;???
          (cons  +last-event+ 'xany)) ;???
  :test #'equal)

;; internal method
(defun event-constant->event-type (constant)
  (cdr (assoc constant +x-event-types-alist+)))

(defun event-constant->event-slot (constant)
  (cdr (assoc constant +x-event-slots-alist+)))

#|
(event-case (event)
            (x:+configure-notify+
             (x y window)
             (print x)
             (print y))
            (x:+key-press+
             (x y window)
                   (print x)
                   (print y)))
|#
(defmacro event-case (xevent &rest clauses)
  ;; clauses := list of clause
  ;; clause := (event (slots) body...)
  (let ((type (gensym))
        (ptr-var (gensym)))
    `(let ((,type (event-type ,xevent)))
       (cond
         ,@(mapcar
            #'(lambda (clause)
                `((= ,type ,(car clause)) ;condition
                  (let ((,ptr-var (foreign-slot-value
                                   ,xevent
                                   'XEvent
                                   (event-constant->event-slot ,(car clause)))))
                    (symbol-macrolet
                        ,(loop for var in (cadr clause)
                            collect `(,var
                                      (foreign-slot-value
                                       ,ptr-var (event-constant->event-type ,(car clause))
                                       ',var)))
                      ,@(cddr clause)))))
            clauses)))))
