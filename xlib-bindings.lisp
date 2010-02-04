;;================================================
;; x-bindings.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================
(declaim (optimize (debug 3)
                   (safety 3)))


(in-package :xlib)

(alexandria:define-constant True 1)

(alexandria:define-constant False 0)


(alexandria:define-constant XlibSpecificationRelease 6)

(cffi:defcfun ("_Xmblen" _Xmblen) :int
  (str :string)
  (len :int))

(alexandria:define-constant X_HAVE_UTF8_STRING 1)

(alexandria:define-constant True 1)

(alexandria:define-constant False 0)

(alexandria:define-constant QueuedAlready 0)

(alexandria:define-constant QueuedAfterReading 1)

(alexandria:define-constant QueuedAfterFlush 2)

(cffi:defcstruct XExtData
  (number :int)
  (next :pointer)
  (free_private :pointer)
  (private_data :string))

(cffi:defcstruct XExtCodes
  (extension :int)
  (major_opcode :int)
  (first_event :int)
  (first_error :int))

(cffi:defcstruct XPixmapFormatValues
  (depth :int)
  (bits_per_pixel :int)
  (scanline_pad :int))

(cffi:defcstruct XGCValues
  (function :int)
  (plane_mask :unsigned-long)
  (foreground :unsigned-long)
  (background :unsigned-long)
  (line_width :int)
  (line_style :int)
  (cap_style :int)
  (join_style :int)
  (fill_style :int)
  (fill_rule :int)
  (arc_mode :int)
  (tile :pointer)
  (stipple :pointer)
  (ts_x_origin :int)
  (ts_y_origin :int)
  (font :pointer)
  (subwindow_mode :int)
  (graphics_exposures :int)
  (clip_x_origin :int)
  (clip_y_origin :int)
  (clip_mask :pointer)
  (dash_offset :int)
  (dashes :char))

(cffi:defcstruct Visual
  (ext_data :pointer)
  (visualid :pointer)
  (class :int)
  (red_mask :unsigned-long)
  (green_mask :unsigned-long)
  (blue_mask :unsigned-long)
  (bits_per_rgb :int)
  (map_entries :int))

(cffi:defcstruct Depth
  (depth :int)
  (nvisuals :int)
  (visuals :pointer))

(cffi:defcstruct Screen
  (ext_data :pointer)
  (display :pointer)
  (root :pointer)
  (width :int)
  (height :int)
  (mwidth :int)
  (mheight :int)
  (ndepths :int)
  (depths :pointer)
  (root_depth :int)
  (root_visual :pointer)
  (default_gc :pointer)
  (cmap :pointer)
  (white_pixel :unsigned-long)
  (black_pixel :unsigned-long)
  (max_maps :int)
  (min_maps :int)
  (backing_store :int)
  (save_unders :int)
  (root_input_mask :long))

(cffi:defcstruct ScreenFormat
  (ext_data :pointer)
  (depth :int)
  (bits_per_pixel :int)
  (scanline_pad :int))

(cffi:defcstruct XSetWindowAttributes
  (background_pixmap :pointer)
  (background_pixel :unsigned-long)
  (border_pixmap :pointer)
  (border_pixel :unsigned-long)
  (bit_gravity :int)
  (win_gravity :int)
  (backing_store :int)
  (backing_planes :unsigned-long)
  (backing_pixel :unsigned-long)
  (save_under :int)
  (event_mask :long)
  (do_not_propagate_mask :long)
  (override_redirect :int)
  (colormap :pointer)
  (cursor :pointer))

(cffi:defcstruct XWindowAttributes
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (border_width :int)
  (depth :int)
  (visual :pointer)
  (root :pointer)
  (class :int)
  (bit_gravity :int)
  (win_gravity :int)
  (backing_store :int)
  (backing_planes :unsigned-long)
  (backing_pixel :unsigned-long)
  (save_under :int)
  (colormap :pointer)
  (map_installed :int)
  (map_state :int)
  (all_event_masks :long)
  (your_event_mask :long)
  (do_not_propagate_mask :long)
  (override_redirect :int)
  (screen :pointer))

(cffi:defcstruct XHostAddress
  (family :int)
  (length :int)
  (address :string))

(cffi:defcstruct XServerInterpretedAddress
  (typelength :int)
  (valuelength :int)
  (type :string)
  (value :string))

(cffi:defcstruct XImage
  (width :int)
  (height :int)
  (xoffset :int)
  (format :int)
  (data :string)
  (byte_order :int)
  (bitmap_unit :int)
  (bitmap_bit_order :int)
  (bitmap_pad :int)
  (depth :int)
  (bytes_per_line :int)
  (bits_per_pixel :int)
  (red_mask :unsigned-long)
  (green_mask :unsigned-long)
  (blue_mask :unsigned-long)
  (obdata :string)
  (f :pointer))

(cffi:defcstruct XImage_f
  (create_image :pointer)
  (destroy_image :pointer)
  (get_pixel :pointer)
  (put_pixel :pointer)
  (sub_image :pointer)
  (add_pixel :pointer))

(cffi:defcstruct XWindowChanges
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (border_width :int)
  (sibling :pointer)
  (stack_mode :int))

(cffi:defcstruct XColor
  (pixel :unsigned-long)
  (red :unsigned-short)
  (green :unsigned-short)
  (blue :unsigned-short)
  (flags :char)
  (pad :char))

(cffi:defcstruct XSegment
  (x1 :short)
  (y1 :short)
  (x2 :short)
  (y2 :short))

(cffi:defcstruct XPoint
  (x :short)
  (y :short))

(cffi:defcstruct XRectangle
  (x :short)
  (y :short)
  (width :unsigned-short)
  (height :unsigned-short))

(cffi:defcstruct XArc
  (x :short)
  (y :short)
  (width :unsigned-short)
  (height :unsigned-short)
  (angle1 :short)
  (angle2 :short))

(cffi:defcstruct XKeyboardControl
  (key_click_percent :int)
  (bell_percent :int)
  (bell_pitch :int)
  (bell_duration :int)
  (led :int)
  (led_mode :int)
  (key :int)
  (auto_repeat_mode :int))

(cffi:defcstruct XKeyboardState
  (key_click_percent :int)
  (bell_percent :int)
  (bell_pitch :unsigned-int)
  (bell_duration :unsigned-int)
  (led_mask :unsigned-long)
  (global_auto_repeat :int)
  (auto_repeats :pointer))

(cffi:defcstruct XTimeCoord
  (time :pointer)
  (x :short)
  (y :short))

(cffi:defcstruct XModifierKeymap
  (max_keypermod :int)
  (modifiermap :pointer))

(cffi:defcstruct XKeyEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (root :pointer)
  (subwindow :pointer)
  (time :pointer)
  (x :int)
  (y :int)
  (x_root :int)
  (y_root :int)
  (state :unsigned-int)
  (keycode :unsigned-int)
  (same_screen :int))

(cffi:defcstruct XButtonEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (root :pointer)
  (subwindow :pointer)
  (time :pointer)
  (x :int)
  (y :int)
  (x_root :int)
  (y_root :int)
  (state :unsigned-int)
  (button :unsigned-int)
  (same_screen :int))

(cffi:defcstruct XMotionEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (root :pointer)
  (subwindow :pointer)
  (time :pointer)
  (x :int)
  (y :int)
  (x_root :int)
  (y_root :int)
  (state :unsigned-int)
  (is_hint :char)
  (same_screen :int))

(cffi:defcstruct XCrossingEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (root :pointer)
  (subwindow :pointer)
  (time :pointer)
  (x :int)
  (y :int)
  (x_root :int)
  (y_root :int)
  (mode :int)
  (detail :int)
  (same_screen :int)
  (focus :int)
  (state :unsigned-int))

(cffi:defcstruct XFocusChangeEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (mode :int)
  (detail :int))

(cffi:defcstruct XKeymapEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (key_vector :pointer))

(cffi:defcstruct XExposeEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (count :int))

(cffi:defcstruct XGraphicsExposeEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (drawable :pointer)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (count :int)
  (major_code :int)
  (minor_code :int))

(cffi:defcstruct XNoExposeEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (drawable :pointer)
  (major_code :int)
  (minor_code :int))

(cffi:defcstruct XVisibilityEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (state :int))

(cffi:defcstruct XCreateWindowEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (parent :pointer)
  (window :pointer)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (border_width :int)
  (override_redirect :int))

(cffi:defcstruct XDestroyWindowEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (event :pointer)
  (window :pointer))

(cffi:defcstruct XUnmapEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (event :pointer)
  (window :pointer)
  (from_configure :int))

(cffi:defcstruct XMapEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (event :pointer)
  (window :pointer)
  (override_redirect :int))

(cffi:defcstruct XMapRequestEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (parent :pointer)
  (window :pointer))

(cffi:defcstruct XReparentEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (event :pointer)
  (window :pointer)
  (parent :pointer)
  (x :int)
  (y :int)
  (override_redirect :int))

(cffi:defcstruct XConfigureEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (event :pointer)
  (window :pointer)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (border_width :int)
  (above :pointer)
  (override_redirect :int))

(cffi:defcstruct XGravityEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (event :pointer)
  (window :pointer)
  (x :int)
  (y :int))

(cffi:defcstruct XResizeRequestEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (width :int)
  (height :int))

(cffi:defcstruct XConfigureRequestEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (parent :pointer)
  (window :pointer)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (border_width :int)
  (above :pointer)
  (detail :int)
  (value_mask :unsigned-long))

(cffi:defcstruct XCirculateEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (event :pointer)
  (window :pointer)
  (place :int))

(cffi:defcstruct XCirculateRequestEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (parent :pointer)
  (window :pointer)
  (place :int))

(cffi:defcstruct XPropertyEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (atom :pointer)
  (time :pointer)
  (state :int))

(cffi:defcstruct XSelectionClearEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (selection :pointer)
  (time :pointer))

(cffi:defcstruct XSelectionRequestEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (owner :pointer)
  (requestor :pointer)
  (selection :pointer)
  (target :pointer)
  (property :pointer)
  (time :pointer))

(cffi:defcstruct XSelectionEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (requestor :pointer)
  (selection :pointer)
  (target :pointer)
  (property :pointer)
  (time :pointer))

(cffi:defcstruct XColormapEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (colormap :pointer)
  (new :int)
  (state :int))

(cffi:defcstruct XClientMessageEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (message_type :pointer)
  (format :int)
  (data :pointer))

(cffi:defcunion XClientMessageEvent_data
  (b :pointer)
  (s :pointer)
  (l :pointer))

(cffi:defcstruct XMappingEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer)
  (request :int)
  (first_keycode :int)
  (count :int))

(cffi:defcstruct XErrorEvent
  (type :int)
  (display :pointer)
  (resourceid :pointer)
  (serial :unsigned-long)
  (error_code :unsigned-char)
  (request_code :unsigned-char)
  (minor_code :unsigned-char))

(cffi:defcstruct XAnyEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (window :pointer))

(cffi:defcstruct XGenericEvent
  (type :int)
  (serial :unsigned-long)
  (send_event :int)
  (display :pointer)
  (extension :int)
  (evtype :int))

(cffi:defcunion XEvent
  (type :int)
  (xany XAnyEvent)
  (xkey XKeyEvent)
  (xbutton XButtonEvent)
  (xmotion XMotionEvent)
  (xcrossing XCrossingEvent)
  (xfocus XFocusChangeEvent)
  (xexpose XExposeEvent)
  (xgraphicsexpose XGraphicsExposeEvent)
  (xnoexpose XNoExposeEvent)
  (xvisibility XVisibilityEvent)
  (xcreatewindow XCreateWindowEvent)
  (xdestroywindow XDestroyWindowEvent)
  (xunmap XUnmapEvent)
  (xmap XMapEvent)
  (xmaprequest XMapRequestEvent)
  (xreparent XReparentEvent)
  (xconfigure XConfigureEvent)
  (xgravity XGravityEvent)
  (xresizerequest XResizeRequestEvent)
  (xconfigurerequest XConfigureRequestEvent)
  (xcirculate XCirculateEvent)
  (xcirculaterequest XCirculateRequestEvent)
  (xproperty XPropertyEvent)
  (xselectionclear XSelectionClearEvent)
  (xselectionrequest XSelectionRequestEvent)
  (xselection XSelectionEvent)
  (xcolormap XColormapEvent)
  (xclient XClientMessageEvent)
  (xmapping XMappingEvent)
  (xerror XErrorEvent)
  (xkeymap XKeymapEvent)
  (pad :pointer))

(cffi:defcstruct XCharStruct
  (lbearing :short)
  (rbearing :short)
  (width :short)
  (ascent :short)
  (descent :short)
  (attributes :unsigned-short))

(cffi:defcstruct XFontProp
  (name :pointer)
  (card32 :unsigned-long))

(cffi:defcstruct XFontStruct
  (ext_data :pointer)
  (fid :pointer)
  (direction :unsigned-int)
  (min_char_or_byte2 :unsigned-int)
  (max_char_or_byte2 :unsigned-int)
  (min_byte1 :unsigned-int)
  (max_byte1 :unsigned-int)
  (all_chars_exist :int)
  (default_char :unsigned-int)
  (n_properties :int)
  (properties :pointer)
  (min_bounds XCharStruct)
  (max_bounds XCharStruct)
  (per_char :pointer)
  (ascent :int)
  (descent :int))

(cffi:defcstruct XTextItem
  (chars :string)
  (nchars :int)
  (delta :int)
  (font :pointer))

(cffi:defcstruct XChar2b
  (byte1 :unsigned-char)
  (byte2 :unsigned-char))

(cffi:defcstruct XTextItem16
  (chars :pointer)
  (nchars :int)
  (delta :int)
  (font :pointer))

(cffi:defcunion XEDataObject
  (display :pointer)
  (gc :pointer)
  (visual :pointer)
  (screen :pointer)
  (pixmap_format :pointer)
  (font :pointer))

(cffi:defcstruct XFontSetExtents
  (max_ink_extent XRectangle)
  (max_logical_extent XRectangle))

(cffi:defcstruct XmbTextItem
  (chars :string)
  (nchars :int)
  (delta :int)
  (font_set :pointer))

(cffi:defcstruct XwcTextItem
  (chars :pointer)
  (nchars :int)
  (delta :int)
  (font_set :pointer))

(alexandria:define-constant XNRequiredCharSet "requiredCharSet" :test #'string=)

(alexandria:define-constant XNQueryOrientation "queryOrientation" :test #'string=)

(alexandria:define-constant XNBaseFontName "baseFontName" :test #'string=)

(alexandria:define-constant XNOMAutomatic "omAutomatic" :test #'string=)

(alexandria:define-constant XNMissingCharSet "missingCharSet" :test #'string=)

(alexandria:define-constant XNDefaultString "defaultString" :test #'string=)

(alexandria:define-constant XNOrientation "orientation" :test #'string=)

(alexandria:define-constant XNDirectionalDependentDrawing "directionalDependentDrawing" :test #'string=)

(alexandria:define-constant XNContextualDrawing "contextualDrawing" :test #'string=)

(alexandria:define-constant XNFontInfo "fontInfo" :test #'string=)

(cffi:defcstruct XOMCharSetList
  (charset_count :int)
  (charset_list :pointer))

(cffi:defcenum XOrientation
  :XOMOrientation_LTR_TTB
  :XOMOrientation_RTL_TTB
  :XOMOrientation_TTB_LTR
  :XOMOrientation_TTB_RTL
  :XOMOrientation_Context)

(cffi:defcstruct XOMOrientation
  (num_orientation :int)
  (orientation :pointer))

(cffi:defcstruct XOMFontInfo
  (num_font :int)
  (font_struct_list :pointer)
  (font_name_list :pointer))

(cffi:defcstruct XIMStyles
  (count_styles :unsigned-short)
  (supported_styles :pointer))

;; ???
(alexandria:define-constant XIMPreeditArea #x01)

(alexandria:define-constant XIMPreeditCallbacks #x02)

(alexandria:define-constant XIMPreeditPosition #x04)

(alexandria:define-constant XIMPreeditNothing #x08)

(alexandria:define-constant XIMPreeditNone #x010)

(alexandria:define-constant XIMStatusArea #x0100)

(alexandria:define-constant XIMStatusCallbacks #x0200)

(alexandria:define-constant XIMStatusNothing #x0400)

(alexandria:define-constant XIMStatusNone #x0800)

(alexandria:define-constant XNVaNestedList "XNVaNestedList" :test #'string=)

(alexandria:define-constant XNQueryInputStyle "queryInputStyle" :test #'string=)

(alexandria:define-constant XNClientWindow "clientWindow" :test #'string=)

(alexandria:define-constant XNInputStyle "inputStyle" :test #'string=)

(alexandria:define-constant XNFocusWindow "focusWindow" :test #'string=)

(alexandria:define-constant XNResourceName "resourceName" :test #'string=)

(alexandria:define-constant XNResourceClass "resourceClass" :test #'string=)

(alexandria:define-constant XNGeometryCallback "geometryCallback" :test #'string=)

(alexandria:define-constant XNDestroyCallback "destroyCallback" :test #'string=)

(alexandria:define-constant XNFilterEvents "filterEvents" :test #'string=)

(alexandria:define-constant XNPreeditStartCallback "preeditStartCallback" :test #'string=)

(alexandria:define-constant XNPreeditDoneCallback "preeditDoneCallback" :test #'string=)

(alexandria:define-constant XNPreeditDrawCallback "preeditDrawCallback" :test #'string=)

(alexandria:define-constant XNPreeditCaretCallback "preeditCaretCallback" :test #'string=)

(alexandria:define-constant XNPreeditStateNotifyCallback "preeditStateNotifyCallback" :test #'string=)

(alexandria:define-constant XNPreeditAttributes "preeditAttributes" :test #'string=)

(alexandria:define-constant XNStatusStartCallback "statusStartCallback" :test #'string=)

(alexandria:define-constant XNStatusDoneCallback "statusDoneCallback" :test #'string=)

(alexandria:define-constant XNStatusDrawCallback "statusDrawCallback" :test #'string=)

(alexandria:define-constant XNStatusAttributes "statusAttributes" :test #'string=)

(alexandria:define-constant XNArea "area" :test #'string=)

(alexandria:define-constant XNAreaNeeded "areaNeeded" :test #'string=)

(alexandria:define-constant XNSpotLocation "spotLocation" :test #'string=)

(alexandria:define-constant XNColormap "colorMap" :test #'string=)

(alexandria:define-constant XNStdColormap "stdColorMap" :test #'string=)

(alexandria:define-constant XNForeground "foreground" :test #'string=)

(alexandria:define-constant XNBackground "background" :test #'string=)

(alexandria:define-constant XNBackgroundPixmap "backgroundPixmap" :test #'string=)

(alexandria:define-constant XNFontSet "fontSet" :test #'string=)

(alexandria:define-constant XNLineSpace "lineSpace" :test #'string=)

(alexandria:define-constant XNCursor "cursor" :test #'string=)

(alexandria:define-constant XNQueryIMValuesList "queryIMValuesList" :test #'string=)

(alexandria:define-constant XNQueryICValuesList "queryICValuesList" :test #'string=)

(alexandria:define-constant XNVisiblePosition "visiblePosition" :test #'string=)

(alexandria:define-constant XNR6PreeditCallback "r6PreeditCallback" :test #'string=)

(alexandria:define-constant XNStringConversionCallback "stringConversionCallback" :test #'string=)

(alexandria:define-constant XNStringConversion "stringConversion" :test #'string=)

(alexandria:define-constant XNResetState "resetState" :test #'string=)

(alexandria:define-constant XNHotKey "hotKey" :test #'string=)

(alexandria:define-constant XNHotKeyState "hotKeyState" :test #'string=)

(alexandria:define-constant XNPreeditState "preeditState" :test #'string=)

(alexandria:define-constant XNSeparatorofNestedList "separatorofNestedList" :test #'string=)

(alexandria:define-constant XBufferOverflow -1)

(alexandria:define-constant XLookupNone 1)

(alexandria:define-constant XLookupChars 2)

(alexandria:define-constant XLookupKeySym 3)

(alexandria:define-constant XLookupBoth 4)

(cffi:defcstruct XIMCallback
  (client_data :string)
  (callback :pointer))

(cffi:defcstruct XICCallback
  (client_data :string)
  (callback :pointer))

(alexandria:define-constant XIMReverse 1)

(alexandria:define-constant XIMUnderline (ash 1 1))

(alexandria:define-constant XIMHighlight (ash 1 2))

(alexandria:define-constant XIMPrimary (ash 1 5))

(alexandria:define-constant XIMSecondary (ash 1 6))

(alexandria:define-constant XIMTertiary (ash 1 7))

(alexandria:define-constant XIMVisibleToForward (ash 1 8))

(alexandria:define-constant XIMVisibleToBackword (ash 1 9))

(alexandria:define-constant XIMVisibleToCenter (ash 1 10))

(cffi:defcstruct XIMText
  (length :unsigned-short)
  (feedback :pointer)
  (encoding_is_wchar :int)
  (string :pointer))

(cffi:defcunion XIMText_string
  (multi_byte :string)
  (wide_char :pointer))

(alexandria:define-constant XIMPreeditUnKnown 0)

(alexandria:define-constant XIMPreeditEnable 1)

(alexandria:define-constant XIMPreeditDisable (ash 1 1))

(cffi:defcstruct XIMPreeditStateNotifyCallbackStruct
  (state :unsigned-long))

(alexandria:define-constant XIMInitialState 1)

(alexandria:define-constant XIMPreserveState (ash 1 1))

(alexandria:define-constant XIMStringConversionLeftEdge #x01)

(alexandria:define-constant XIMStringConversionRightEdge #x02)

(alexandria:define-constant XIMStringConversionTopEdge #x04)

(alexandria:define-constant XIMStringConversionBottomEdge #x08)

(alexandria:define-constant XIMStringConversionConcealed #x010)

(alexandria:define-constant XIMStringConversionWrapped #x020)

(cffi:defcstruct XIMStringConversionText
  (length :unsigned-short)
  (feedback :pointer)
  (encoding_is_wchar :int)
  (string :pointer))

(cffi:defcunion XIMStringConversionText_string
  (mbs :string)
  (wcs :pointer))

(alexandria:define-constant XIMStringConversionBuffer #x01)

(alexandria:define-constant XIMStringConversionLine #x02)

(alexandria:define-constant XIMStringConversionWord #x03)

(alexandria:define-constant XIMStringConversionChar #x04)

(alexandria:define-constant XIMStringConversionSubstitution #x01)

(alexandria:define-constant XIMStringConversionRetrieval #x02)

(cffi:defcenum XIMCaretDirection
  :XIMForwardChar
  :XIMBackwardChar
  :XIMForwardWord
  :XIMBackwardWord
  :XIMCaretUp
  :XIMCaretDown
  :XIMNextLine
  :XIMPreviousLine
  :XIMLineStart
  :XIMLineEnd
  :XIMAbsolutePosition
  :XIMDontChange)

(cffi:defcstruct XIMStringConversionCallbackStruct
  (position :unsigned-short)
  (direction XIMCaretDirection)
  (operation :unsigned-short)
  (factor :unsigned-short)
  (text :pointer))

(cffi:defcstruct XIMPreeditDrawCallbackStruct
  (caret :int)
  (chg_first :int)
  (chg_length :int)
  (text :pointer))

(cffi:defcenum XIMCaretStyle
  :XIMIsInvisible
  :XIMIsPrimary
  :XIMIsSecondary)

(cffi:defcstruct XIMPreeditCaretCallbackStruct
  (position :int)
  (direction XIMCaretDirection)
  (style XIMCaretStyle))

(cffi:defcenum XIMStatusDataType
  :XIMTextType
  :XIMBitmapType)

(cffi:defcstruct XIMStatusDrawCallbackStruct
  (type XIMStatusDataType)
  (data :pointer))

(cffi:defcunion XIMStatusDrawCallbackStruct_data
  (text :pointer)
  (bitmap :pointer))

(cffi:defcstruct XIMHotKeyTrigger
  (keysym :pointer)
  (modifier :int)
  (modifier_mask :int))

(cffi:defcstruct XIMHotKeyTriggers
  (num_hot_key :int)
  (key :pointer))

(alexandria:define-constant XIMHotKeyStateON #x01)

(alexandria:define-constant XIMHotKeyStateOFF #x02)

(cffi:defcstruct XIMValuesList
  (count_values :unsigned-short)
  (supported_values :pointer))

(cffi:defcvar ("_Xdebug" _Xdebug)
    :int)

(cffi:defcfun ("XQueryFont" XQueryFont) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XGetMotionEvents" XGetMotionEvents) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("XDeleteModifiermapEntry" XDeleteModifiermapEntry) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XGetModifierMapping" XGetModifierMapping) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XInsertModifiermapEntry" XInsertModifiermapEntry) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XNewModifiermap" XNewModifiermap) :pointer
  (arg0 :int))

(cffi:defcfun ("XCreateImage" XCreateImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
  (arg3 :int)
  (arg4 :int)
  (arg5 :string)
  (arg6 :unsigned-int)
  (arg7 :unsigned-int)
  (arg8 :int)
  (arg9 :int))

(cffi:defcfun ("XInitImage" XInitImage) :int
  (arg0 :pointer))

(cffi:defcfun ("XGetImage" XGetImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int)
  (arg4 :unsigned-int)
  (arg5 :unsigned-int)
  (arg6 :unsigned-long)
  (arg7 :int))

(cffi:defcfun ("XGetSubImage" XGetSubImage) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int)
  (arg4 :unsigned-int)
  (arg5 :unsigned-int)
  (arg6 :unsigned-long)
  (arg7 :int)
  (arg8 :pointer)
  (arg9 :int)
  (arg10 :int))

(cffi:defcfun ("XrmInitialize" XrmInitialize) :void)

(cffi:defcfun ("XFetchBytes" XFetchBytes) :string
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XFetchBuffer" XFetchBuffer) :string
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XGetAtomName" XGetAtomName) :string
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XGetAtomNames" XGetAtomNames) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer))

(cffi:defcfun ("XKeysymToString" XKeysymToString) :string
  (arg0 :pointer))

(cffi:defcfun ("XSynchronize" XSynchronize) :pointer
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XSetAfterFunction" XSetAfterFunction) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XInternAtoms" XInternAtoms) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int)
  (arg4 :pointer))

(cffi:defcfun ("XCopyColormapAndFree" XCopyColormapAndFree) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XCreateColormap" XCreateColormap) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int))

(cffi:defcfun ("XCreatePixmapCursor" XCreatePixmapCursor) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :unsigned-int)
  (arg6 :unsigned-int))

(cffi:defcfun ("XCreateFontCursor" XCreateFontCursor) :pointer
  (arg0 :pointer)
  (arg1 :unsigned-int))

(cffi:defcfun ("XCreateGC" XCreateGC) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("XGContextFromGC" XGContextFromGC) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XFlushGC" XFlushGC) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XCreatePixmap" XCreatePixmap) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
  (arg3 :unsigned-int)
  (arg4 :unsigned-int))

(cffi:defcfun ("XCreatePixmapFromBitmapData" XCreatePixmapFromBitmapData) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :unsigned-int)
  (arg4 :unsigned-int)
  (arg5 :unsigned-long)
  (arg6 :unsigned-long)
  (arg7 :unsigned-int))

(cffi:defcfun ("XCreateSimpleWindow" XCreateSimpleWindow) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int)
  (arg4 :unsigned-int)
  (arg5 :unsigned-int)
  (arg6 :unsigned-int)
  (arg7 :unsigned-long)
  (arg8 :unsigned-long))

(cffi:defcfun ("XGetSelectionOwner" XGetSelectionOwner) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XCreateWindow" XCreateWindow) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int)
  (arg4 :unsigned-int)
  (arg5 :unsigned-int)
  (arg6 :unsigned-int)
  (arg7 :int)
  (arg8 :unsigned-int)
  (arg9 :pointer)
  (arg10 :unsigned-long)
  (arg11 :pointer))

(cffi:defcfun ("XListInstalledColormaps" XListInstalledColormaps) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetFontPath" XGetFontPath) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XListExtensions" XListExtensions) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XListProperties" XListProperties) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XListHosts" XListHosts) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XKeycodeToKeysym" XKeycodeToKeysym) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XLookupKeysym" XLookupKeysym) :pointer
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XGetKeyboardMapping" XGetKeyboardMapping) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer))

(cffi:defcfun ("XMaxRequestSize" XMaxRequestSize) :long
  (arg0 :pointer))

(cffi:defcfun ("XExtendedMaxRequestSize" XExtendedMaxRequestSize) :long
  (arg0 :pointer))

(cffi:defcfun ("XResourceManagerString" XResourceManagerString) :string
  (arg0 :pointer))

(cffi:defcfun ("XScreenResourceString" XScreenResourceString) :string
  (arg0 :pointer))

(cffi:defcfun ("XDisplayMotionBufferSize" XDisplayMotionBufferSize) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("XVisualIDFromVisual" XVisualIDFromVisual) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XInitThreads" XInitThreads) :int)

(cffi:defcfun ("XLockDisplay" XLockDisplay) :void
  (arg0 :pointer))

(cffi:defcfun ("XUnlockDisplay" XUnlockDisplay) :void
  (arg0 :pointer))

(cffi:defcfun ("XAddExtension" XAddExtension) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XFindOnExtensionList" XFindOnExtensionList) :pointer
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XEHeadOfExtensionList" XEHeadOfExtensionList) :pointer
  (arg0 XEDataObject))

(cffi:defcfun ("XRootWindow" XRootWindow) :pointer
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDefaultRootWindow" XDefaultRootWindow) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XRootWindowOfScreen" XRootWindowOfScreen) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XDefaultVisual" XDefaultVisual) :pointer
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDefaultVisualOfScreen" XDefaultVisualOfScreen) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XDefaultGC" XDefaultGC) :pointer
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDefaultGCOfScreen" XDefaultGCOfScreen) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XBlackPixel" XBlackPixel) :unsigned-long
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XWhitePixel" XWhitePixel) :unsigned-long
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XAllPlanes" XAllPlanes) :unsigned-long)

(cffi:defcfun ("XBlackPixelOfScreen" XBlackPixelOfScreen) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("XWhitePixelOfScreen" XWhitePixelOfScreen) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("XNextRequest" XNextRequest) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("XLastKnownRequestProcessed" XLastKnownRequestProcessed) :unsigned-long
  (arg0 :pointer))

(cffi:defcfun ("XServerVendor" XServerVendor) :string
  (arg0 :pointer))

(cffi:defcfun ("XDisplayString" XDisplayString) :string
  (arg0 :pointer))

(cffi:defcfun ("XDefaultColormap" XDefaultColormap) :pointer
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDefaultColormapOfScreen" XDefaultColormapOfScreen) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XDisplayOfScreen" XDisplayOfScreen) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XScreenOfDisplay" XScreenOfDisplay) :pointer
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDefaultScreenOfDisplay" XDefaultScreenOfDisplay) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XEventMaskOfScreen" XEventMaskOfScreen) :long
  (arg0 :pointer))

(cffi:defcfun ("XScreenNumberOfScreen" XScreenNumberOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XSetErrorHandler" XSetErrorHandler) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XSetIOErrorHandler" XSetIOErrorHandler) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XListPixmapFormats" XListPixmapFormats) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XListDepths" XListDepths) :pointer
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer))

(cffi:defcfun ("XReconfigureWMWindow" XReconfigureWMWindow) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :unsigned-int)
  (arg4 :pointer))

(cffi:defcfun ("XGetWMProtocols" XGetWMProtocols) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XSetWMProtocols" XSetWMProtocols) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int))

(cffi:defcfun ("XIconifyWindow" XIconifyWindow) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XWithdrawWindow" XWithdrawWindow) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XGetCommand" XGetCommand) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XGetWMColormapWindows" XGetWMColormapWindows) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XSetWMColormapWindows" XSetWMColormapWindows) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int))

(cffi:defcfun ("XFreeStringList" XFreeStringList) :void
  (arg0 :pointer))

(cffi:defcfun ("XSetTransientForHint" XSetTransientForHint) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XActivateScreenSaver" XActivateScreenSaver) :int
  (arg0 :pointer))

(cffi:defcfun ("XAddHost" XAddHost) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XAddHosts" XAddHosts) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XAddToExtensionList" XAddToExtensionList) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XAddToSaveSet" XAddToSaveSet) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XAllocColor" XAllocColor) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XAllocColorCells" XAllocColorCells) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer)
  (arg4 :unsigned-int)
  (arg5 :pointer)
  (arg6 :unsigned-int))

(cffi:defcfun ("XAllocColorPlanes" XAllocColorPlanes) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer)
  (arg4 :int)
  (arg5 :int)
  (arg6 :int)
  (arg7 :int)
  (arg8 :pointer)
  (arg9 :pointer)
  (arg10 :pointer))

(cffi:defcfun ("XAllowEvents" XAllowEvents) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer))

(cffi:defcfun ("XAutoRepeatOff" XAutoRepeatOff) :int
  (arg0 :pointer))

(cffi:defcfun ("XAutoRepeatOn" XAutoRepeatOn) :int
  (arg0 :pointer))

(cffi:defcfun ("XBell" XBell) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XBitmapBitOrder" XBitmapBitOrder) :int
  (arg0 :pointer))

(cffi:defcfun ("XBitmapPad" XBitmapPad) :int
  (arg0 :pointer))

(cffi:defcfun ("XBitmapUnit" XBitmapUnit) :int
  (arg0 :pointer))

(cffi:defcfun ("XCellsOfScreen" XCellsOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XChangeActivePointerGrab" XChangeActivePointerGrab) :int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XChangeGC" XChangeGC) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("XChangeKeyboardControl" XChangeKeyboardControl) :int
  (arg0 :pointer)
  (arg1 :unsigned-long)
  (arg2 :pointer))

(cffi:defcfun ("XChangeKeyboardMapping" XChangeKeyboardMapping) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :int)
  (arg3 :pointer)
  (arg4 :int))

(cffi:defcfun ("XChangePointerControl" XChangePointerControl) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :int)
  (arg3 :int)
  (arg4 :int)
  (arg5 :int))

(cffi:defcfun ("XChangeSaveSet" XChangeSaveSet) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XChangeWindowAttributes" XChangeWindowAttributes) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("XCheckIfEvent" XCheckIfEvent) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :string))

(cffi:defcfun ("XCheckMaskEvent" XCheckMaskEvent) :int
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :pointer))

(cffi:defcfun ("XCheckTypedEvent" XCheckTypedEvent) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer))

(cffi:defcfun ("XCheckTypedWindowEvent" XCheckTypedWindowEvent) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer))

(cffi:defcfun ("XCheckWindowEvent" XCheckWindowEvent) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :long)
  (arg3 :pointer))

(cffi:defcfun ("XCirculateSubwindows" XCirculateSubwindows) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XCirculateSubwindowsDown" XCirculateSubwindowsDown) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XCirculateSubwindowsUp" XCirculateSubwindowsUp) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XClearArea" XClearArea) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int)
  (arg4 :unsigned-int)
  (arg5 :unsigned-int)
  (arg6 :int))

(cffi:defcfun ("XClearWindow" XClearWindow) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XCloseDisplay" XCloseDisplay) :int
  (arg0 :pointer))

(cffi:defcfun ("XConfigureWindow" XConfigureWindow) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
  (arg3 :pointer))

(cffi:defcfun ("XConnectionNumber" XConnectionNumber) :int
  (arg0 :pointer))

(cffi:defcfun ("XConvertSelection" XConvertSelection) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("XCopyArea" XCopyArea) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int)
  (arg5 :int)
  (arg6 :unsigned-int)
  (arg7 :unsigned-int)
  (arg8 :int)
  (arg9 :int))

(cffi:defcfun ("XCopyGC" XCopyGC) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("XCopyPlane" XCopyPlane) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int)
  (arg5 :int)
  (arg6 :unsigned-int)
  (arg7 :unsigned-int)
  (arg8 :int)
  (arg9 :int)
  (arg10 :unsigned-long))

(cffi:defcfun ("XDefaultDepth" XDefaultDepth) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDefaultDepthOfScreen" XDefaultDepthOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XDefaultScreen" XDefaultScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XDefineCursor" XDefineCursor) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XDeleteProperty" XDeleteProperty) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XDestroyWindow" XDestroyWindow) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XDestroySubwindows" XDestroySubwindows) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XDoesBackingStore" XDoesBackingStore) :int
  (arg0 :pointer))

(cffi:defcfun ("XDoesSaveUnders" XDoesSaveUnders) :int
  (arg0 :pointer))

(cffi:defcfun ("XDisableAccessControl" XDisableAccessControl) :int
  (arg0 :pointer))

(cffi:defcfun ("XDisplayCells" XDisplayCells) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDisplayHeight" XDisplayHeight) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDisplayHeightMM" XDisplayHeightMM) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDisplayKeycodes" XDisplayKeycodes) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XDisplayPlanes" XDisplayPlanes) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDisplayWidth" XDisplayWidth) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDisplayWidthMM" XDisplayWidthMM) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XDrawArc" XDrawArc) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :unsigned-int)
  (arg6 :unsigned-int)
  (arg7 :int)
  (arg8 :int))

(cffi:defcfun ("XDrawArcs" XDrawArcs) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int))

(cffi:defcfun ("XDrawLine" XDrawLine) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :int)
  (arg6 :int))

(cffi:defcfun ("XDrawLines" XDrawLines) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int)
  (arg5 :int))

(cffi:defcfun ("XDrawPoint" XDrawPoint) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int))

(cffi:defcfun ("XDrawPoints" XDrawPoints) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int)
  (arg5 :int))

(cffi:defcfun ("XDrawRectangle" XDrawRectangle) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :unsigned-int)
  (arg6 :unsigned-int))

(cffi:defcfun ("XDrawRectangles" XDrawRectangles) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int))

(cffi:defcfun ("XDrawSegments" XDrawSegments) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int))

(cffi:defcfun ("XDrawText" XDrawText) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :pointer)
  (arg6 :int))

(cffi:defcfun ("XDrawText16" XDrawText16) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :pointer)
  (arg6 :int))

(cffi:defcfun ("XEnableAccessControl" XEnableAccessControl) :int
  (arg0 :pointer))

(cffi:defcfun ("XEventsQueued" XEventsQueued) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XFetchName" XFetchName) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XFillArc" XFillArc) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :unsigned-int)
  (arg6 :unsigned-int)
  (arg7 :int)
  (arg8 :int))

(cffi:defcfun ("XFillArcs" XFillArcs) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int))

(cffi:defcfun ("XFillPolygon" XFillPolygon) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int)
  (arg5 :int)
  (arg6 :int))

(cffi:defcfun ("XFillRectangle" XFillRectangle) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :unsigned-int)
  (arg6 :unsigned-int))

(cffi:defcfun ("XFillRectangles" XFillRectangles) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int))

(cffi:defcfun ("XFlush" XFlush) :int
  (arg0 :pointer))

(cffi:defcfun ("XForceScreenSaver" XForceScreenSaver) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XFree" XFree) :int
  (arg0 :pointer))

(cffi:defcfun ("XFreeColormap" XFreeColormap) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XFreeColors" XFreeColors) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :unsigned-long))

(cffi:defcfun ("XFreeCursor" XFreeCursor) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XFreeExtensionList" XFreeExtensionList) :int
  (arg0 :pointer))

(cffi:defcfun ("XFreeFont" XFreeFont) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XFreeFontInfo" XFreeFontInfo) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XFreeFontNames" XFreeFontNames) :int
  (arg0 :pointer))

(cffi:defcfun ("XFreeFontPath" XFreeFontPath) :int
  (arg0 :pointer))

(cffi:defcfun ("XFreeGC" XFreeGC) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XFreeModifiermap" XFreeModifiermap) :int
  (arg0 :pointer))

(cffi:defcfun ("XFreePixmap" XFreePixmap) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XGetErrorText" XGetErrorText) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :string)
  (arg3 :int))

(cffi:defcfun ("XGetFontProperty" XGetFontProperty) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetGCValues" XGetGCValues) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :pointer))

(cffi:defcfun ("XGetGeometry" XGetGeometry) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer)
  (arg6 :pointer)
  (arg7 :pointer)
  (arg8 :pointer))

(cffi:defcfun ("XGetIconName" XGetIconName) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetInputFocus" XGetInputFocus) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetKeyboardControl" XGetKeyboardControl) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XGetPointerControl" XGetPointerControl) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XGetPointerMapping" XGetPointerMapping) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XGetScreenSaver" XGetScreenSaver) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("XGetTransientForHint" XGetTransientForHint) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetWindowProperty" XGetWindowProperty) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :long)
  (arg4 :long)
  (arg5 :int)
  (arg6 :pointer)
  (arg7 :pointer)
  (arg8 :pointer)
  (arg9 :pointer)
  (arg10 :pointer)
  (arg11 :pointer))

(cffi:defcfun ("XGetWindowAttributes" XGetWindowAttributes) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGrabButton" XGrabButton) :int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :unsigned-int)
  (arg3 :pointer)
  (arg4 :int)
  (arg5 :unsigned-int)
  (arg6 :int)
  (arg7 :int)
  (arg8 :pointer)
  (arg9 :pointer))

(cffi:defcfun ("XGrabKey" XGrabKey) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :unsigned-int)
  (arg3 :pointer)
  (arg4 :int)
  (arg5 :int)
  (arg6 :int))

(cffi:defcfun ("XGrabKeyboard" XGrabKeyboard) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int)
  (arg4 :int)
  (arg5 :pointer))

(cffi:defcfun ("XGrabPointer" XGrabPointer) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :unsigned-int)
  (arg4 :int)
  (arg5 :int)
  (arg6 :pointer)
  (arg7 :pointer)
  (arg8 :pointer))

(cffi:defcfun ("XGrabServer" XGrabServer) :int
  (arg0 :pointer))

(cffi:defcfun ("XHeightMMOfScreen" XHeightMMOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XHeightOfScreen" XHeightOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XIfEvent" XIfEvent) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :string))

(cffi:defcfun ("XImageByteOrder" XImageByteOrder) :int
  (arg0 :pointer))

(cffi:defcfun ("XInstallColormap" XInstallColormap) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XKeysymToKeycode" XKeysymToKeycode) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XKillClient" XKillClient) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XLowerWindow" XLowerWindow) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XMapRaised" XMapRaised) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XMapSubwindows" XMapSubwindows) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XMapWindow" XMapWindow) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XMaskEvent" XMaskEvent) :int
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :pointer))

(cffi:defcfun ("XMaxCmapsOfScreen" XMaxCmapsOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XMinCmapsOfScreen" XMinCmapsOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XMoveResizeWindow" XMoveResizeWindow) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int)
  (arg4 :unsigned-int)
  (arg5 :unsigned-int))

(cffi:defcfun ("XMoveWindow" XMoveWindow) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int))

(cffi:defcfun ("XNextEvent" XNextEvent) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XNoOp" XNoOp) :int
  (arg0 :pointer))

(cffi:defcfun ("XPeekEvent" XPeekEvent) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XPeekIfEvent" XPeekIfEvent) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :string))

(cffi:defcfun ("XPending" XPending) :int
  (arg0 :pointer))

(cffi:defcfun ("XPlanesOfScreen" XPlanesOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XProtocolRevision" XProtocolRevision) :int
  (arg0 :pointer))

(cffi:defcfun ("XProtocolVersion" XProtocolVersion) :int
  (arg0 :pointer))

(cffi:defcfun ("XPutBackEvent" XPutBackEvent) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XPutImage" XPutImage) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :int)
  (arg5 :int)
  (arg6 :int)
  (arg7 :int)
  (arg8 :unsigned-int)
  (arg9 :unsigned-int))

(cffi:defcfun ("XQLength" XQLength) :int
  (arg0 :pointer))

(cffi:defcfun ("XQueryBestCursor" XQueryBestCursor) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
  (arg3 :unsigned-int)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("XQueryBestSize" XQueryBestSize) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer)
  (arg3 :unsigned-int)
  (arg4 :unsigned-int)
  (arg5 :pointer)
  (arg6 :pointer))

(cffi:defcfun ("XQueryBestStipple" XQueryBestStipple) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
  (arg3 :unsigned-int)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("XQueryBestTile" XQueryBestTile) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
  (arg3 :unsigned-int)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("XQueryColor" XQueryColor) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XQueryColors" XQueryColors) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int))

(cffi:defcfun ("XQueryKeymap" XQueryKeymap) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XQueryPointer" XQueryPointer) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer)
  (arg6 :pointer)
  (arg7 :pointer)
  (arg8 :pointer))

(cffi:defcfun ("XQueryTree" XQueryTree) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("XRaiseWindow" XRaiseWindow) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XRecolorCursor" XRecolorCursor) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XRefreshKeyboardMapping" XRefreshKeyboardMapping) :int
  (arg0 :pointer))

(cffi:defcfun ("XRemoveFromSaveSet" XRemoveFromSaveSet) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XRemoveHost" XRemoveHost) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XRemoveHosts" XRemoveHosts) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XReparentWindow" XReparentWindow) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int))

(cffi:defcfun ("XResetScreenSaver" XResetScreenSaver) :int
  (arg0 :pointer))

(cffi:defcfun ("XResizeWindow" XResizeWindow) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
  (arg3 :unsigned-int))

(cffi:defcfun ("XRestackWindows" XRestackWindows) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XRotateBuffers" XRotateBuffers) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XRotateWindowProperties" XRotateWindowProperties) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int))

(cffi:defcfun ("XScreenCount" XScreenCount) :int
  (arg0 :pointer))

(cffi:defcfun ("XSelectInput" XSelectInput) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :long))

(cffi:defcfun ("XSendEvent" XSendEvent) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :long)
  (arg4 :pointer))

(cffi:defcfun ("XSetAccessControl" XSetAccessControl) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XSetArcMode" XSetArcMode) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XSetBackground" XSetBackground) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long))

(cffi:defcfun ("XSetClipMask" XSetClipMask) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetClipOrigin" XSetClipOrigin) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int))

(cffi:defcfun ("XSetClipRectangles" XSetClipRectangles) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int)
  (arg4 :pointer)
  (arg5 :int)
  (arg6 :int))

(cffi:defcfun ("XSetCloseDownMode" XSetCloseDownMode) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XSetCommand" XSetCommand) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int))

(cffi:defcfun ("XSetFillRule" XSetFillRule) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XSetFillStyle" XSetFillStyle) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XSetFont" XSetFont) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetFontPath" XSetFontPath) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XSetForeground" XSetForeground) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long))

(cffi:defcfun ("XSetFunction" XSetFunction) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XSetGraphicsExposures" XSetGraphicsExposures) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XSetInputFocus" XSetInputFocus) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer))

(cffi:defcfun ("XSetLineAttributes" XSetLineAttributes) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int)
  (arg3 :int)
  (arg4 :int)
  (arg5 :int))

(cffi:defcfun ("XSetModifierMapping" XSetModifierMapping) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XSetPlaneMask" XSetPlaneMask) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long))

(cffi:defcfun ("XSetScreenSaver" XSetScreenSaver) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :int)
  (arg3 :int)
  (arg4 :int))

(cffi:defcfun ("XSetSelectionOwner" XSetSelectionOwner) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XSetState" XSetState) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long)
  (arg3 :unsigned-long)
  (arg4 :int)
  (arg5 :unsigned-long))

(cffi:defcfun ("XSetStipple" XSetStipple) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetSubwindowMode" XSetSubwindowMode) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XSetTSOrigin" XSetTSOrigin) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :int))

(cffi:defcfun ("XSetTile" XSetTile) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetWindowBackground" XSetWindowBackground) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long))

(cffi:defcfun ("XSetWindowBackgroundPixmap" XSetWindowBackgroundPixmap) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetWindowBorder" XSetWindowBorder) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-long))

(cffi:defcfun ("XSetWindowBorderPixmap" XSetWindowBorderPixmap) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetWindowBorderWidth" XSetWindowBorderWidth) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :unsigned-int))

(cffi:defcfun ("XSetWindowColormap" XSetWindowColormap) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XStoreColor" XStoreColor) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XStoreColors" XStoreColors) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int))

(cffi:defcfun ("XStoreName" XStoreName) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))


(cffi:defcfun ("XSync" XSync) :int
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XTranslateCoordinates" XTranslateCoordinates) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :pointer)
  (arg6 :pointer)
  (arg7 :pointer))

(cffi:defcfun ("XUndefineCursor" XUndefineCursor) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XUngrabButton" XUngrabButton) :int
  (arg0 :pointer)
  (arg1 :unsigned-int)
  (arg2 :unsigned-int)
  (arg3 :pointer))

(cffi:defcfun ("XUngrabKey" XUngrabKey) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :unsigned-int)
  (arg3 :pointer))

(cffi:defcfun ("XUngrabKeyboard" XUngrabKeyboard) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XUngrabPointer" XUngrabPointer) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XUngrabServer" XUngrabServer) :int
  (arg0 :pointer))

(cffi:defcfun ("XUninstallColormap" XUninstallColormap) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XUnloadFont" XUnloadFont) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XUnmapSubwindows" XUnmapSubwindows) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XUnmapWindow" XUnmapWindow) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XVendorRelease" XVendorRelease) :int
  (arg0 :pointer))

(cffi:defcfun ("XWarpPointer" XWarpPointer) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :unsigned-int)
  (arg6 :unsigned-int)
  (arg7 :int)
  (arg8 :int))

(cffi:defcfun ("XWidthMMOfScreen" XWidthMMOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XWidthOfScreen" XWidthOfScreen) :int
  (arg0 :pointer))

(cffi:defcfun ("XWindowEvent" XWindowEvent) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :long)
  (arg3 :pointer))

(cffi:defcfun ("XSupportsLocale" XSupportsLocale) :int)

(cffi:defcfun ("XSetLocaleModifiers" XSetLocaleModifiers) :string
  (arg0 :string))

(cffi:defcfun ("XCloseOM" XCloseOM) :int
  (arg0 :pointer))

(cffi:defcfun ("XDisplayOfOM" XDisplayOfOM) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XLocaleOfOM" XLocaleOfOM) :string
  (arg0 :pointer))

(cffi:defcfun ("XDestroyOC" XDestroyOC) :void
  (arg0 :pointer))

(cffi:defcfun ("XOMOfOC" XOMOfOC) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XFreeFontSet" XFreeFontSet) :void
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XFontsOfFontSet" XFontsOfFontSet) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XBaseFontNameListOfFontSet" XBaseFontNameListOfFontSet) :string
  (arg0 :pointer))

(cffi:defcfun ("XLocaleOfFontSet" XLocaleOfFontSet) :string
  (arg0 :pointer))

(cffi:defcfun ("XContextDependentDrawing" XContextDependentDrawing) :int
  (arg0 :pointer))

(cffi:defcfun ("XDirectionalDependentDrawing" XDirectionalDependentDrawing) :int
  (arg0 :pointer))

(cffi:defcfun ("XContextualDrawing" XContextualDrawing) :int
  (arg0 :pointer))

(cffi:defcfun ("XExtentsOfFontSet" XExtentsOfFontSet) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XmbDrawText" XmbDrawText) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :pointer)
  (arg6 :int))

(cffi:defcfun ("XwcDrawText" XwcDrawText) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :pointer)
  (arg6 :int))

(cffi:defcfun ("Xutf8DrawText" Xutf8DrawText) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :int)
  (arg5 :pointer)
  (arg6 :int))

(cffi:defcfun ("XOpenIM" XOpenIM) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :string))

(cffi:defcfun ("XCloseIM" XCloseIM) :int
  (arg0 :pointer))

(cffi:defcfun ("XDisplayOfIM" XDisplayOfIM) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XLocaleOfIM" XLocaleOfIM) :string
  (arg0 :pointer))

(cffi:defcfun ("XDestroyIC" XDestroyIC) :void
  (arg0 :pointer))

(cffi:defcfun ("XSetICFocus" XSetICFocus) :void
  (arg0 :pointer))

(cffi:defcfun ("XUnsetICFocus" XUnsetICFocus) :void
  (arg0 :pointer))

(cffi:defcfun ("XwcResetIC" XwcResetIC) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XmbResetIC" XmbResetIC) :string
  (arg0 :pointer))

(cffi:defcfun ("Xutf8ResetIC" Xutf8ResetIC) :string
  (arg0 :pointer))

(cffi:defcfun ("XIMOfIC" XIMOfIC) :pointer
  (arg0 :pointer))

(cffi:defcfun ("XFilterEvent" XFilterEvent) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XmbLookupString" XmbLookupString) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :int)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("XwcLookupString" XwcLookupString) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("Xutf8LookupString" Xutf8LookupString) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :int)
  (arg4 :pointer)
  (arg5 :pointer))

(cffi:defcfun ("XRegisterIMInstantiateCallback" XRegisterIMInstantiateCallback) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :string)
  (arg4 :pointer)
  (arg5 :string))

(cffi:defcfun ("XUnregisterIMInstantiateCallback" XUnregisterIMInstantiateCallback) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :string)
  (arg4 :pointer)
  (arg5 :string))

(cffi:defcfun ("XInternalConnectionNumbers" XInternalConnectionNumbers) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XProcessInternalConnection" XProcessInternalConnection) :void
  (arg0 :pointer)
  (arg1 :int))

(cffi:defcfun ("XAddConnectionWatch" XAddConnectionWatch) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("XRemoveConnectionWatch" XRemoveConnectionWatch) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string))

(cffi:defcfun ("XSetAuthorization" XSetAuthorization) :void
  (arg0 :string)
  (arg1 :int)
  (arg2 :string)
  (arg3 :int))

(cffi:defcfun ("_Xmbtowc" _Xmbtowc) :int
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :int))

(cffi:defcfun ("_Xwctomb" _Xwctomb) :int
  (arg0 :string)
  (arg1 :pointer))

;;================================
;; from X.h
;; $ swig -cffi -module x11 -o x.lisp /usr/X11/include/X11/X.h
;;================================
(alexandria:define-constant X_PROTOCOL 11)

(alexandria:define-constant X_PROTOCOL_REVISION 0)

(alexandria:define-constant None #x0)

(alexandria:define-constant ParentRelative 1)

(alexandria:define-constant CopyFromParent #x0)

(alexandria:define-constant PointerWindow #x0)

(alexandria:define-constant InputFocus 1)

(alexandria:define-constant PointerRoot 1)

(alexandria:define-constant AnyPropertyType #x0)

(alexandria:define-constant AnyKey #x0)

(alexandria:define-constant AnyButton #x0)

(alexandria:define-constant AllTemporary #x0)

(alexandria:define-constant CurrentTime #x0)

(alexandria:define-constant NoSymbol #x0)

(alexandria:define-constant NoEventMask #x0)

(alexandria:define-constant KeyPressMask (ash 1 0))

(alexandria:define-constant KeyReleaseMask (ash 1 1))

(alexandria:define-constant ButtonPressMask (ash 1 2))

(alexandria:define-constant ButtonReleaseMask (ash 1 3))

(alexandria:define-constant EnterWindowMask (ash 1 4))

(alexandria:define-constant LeaveWindowMask (ash 1 5))

(alexandria:define-constant PointerMotionMask (ash 1 6))

(alexandria:define-constant PointerMotionHintMask (ash 1 7))

(alexandria:define-constant Button1MotionMask (ash 1 8))

(alexandria:define-constant Button2MotionMask (ash 1 9))

(alexandria:define-constant Button3MotionMask (ash 1 10))

(alexandria:define-constant Button4MotionMask (ash 1 11))

(alexandria:define-constant Button5MotionMask (ash 1 12))

(alexandria:define-constant ButtonMotionMask (ash 1 13))

(alexandria:define-constant KeymapStateMask (ash 1 14))

(alexandria:define-constant ExposureMask (ash 1 15))

(alexandria:define-constant VisibilityChangeMask (ash 1 16))

(alexandria:define-constant StructureNotifyMask (ash 1 17))

(alexandria:define-constant ResizeRedirectMask (ash 1 18))

(alexandria:define-constant SubstructureNotifyMask (ash 1 19))

(alexandria:define-constant SubstructureRedirectMask (ash 1 20))

(alexandria:define-constant FocusChangeMask (ash 1 21))

(alexandria:define-constant PropertyChangeMask (ash 1 22))

(alexandria:define-constant ColormapChangeMask (ash 1 23))

(alexandria:define-constant OwnerGrabButtonMask (ash 1 24))

(alexandria:define-constant KeyPress 2)

(alexandria:define-constant KeyRelease 3)

(alexandria:define-constant ButtonPress 4)

(alexandria:define-constant ButtonRelease 5)

(alexandria:define-constant MotionNotify 6)

(alexandria:define-constant EnterNotify 7)

(alexandria:define-constant LeaveNotify 8)

(alexandria:define-constant FocusIn 9)

(alexandria:define-constant FocusOut 10)

(alexandria:define-constant KeymapNotify 11)

(alexandria:define-constant Expose 12)

(alexandria:define-constant GraphicsExpose 13)

(alexandria:define-constant NoExpose 14)

(alexandria:define-constant VisibilityNotify 15)

(alexandria:define-constant CreateNotify 16)

(alexandria:define-constant DestroyNotify 17)

(alexandria:define-constant UnmapNotify 18)

(alexandria:define-constant MapNotify 19)

(alexandria:define-constant MapRequest 20)

(alexandria:define-constant ReparentNotify 21)

(alexandria:define-constant ConfigureNotify 22)

(alexandria:define-constant ConfigureRequest 23)

(alexandria:define-constant GravityNotify 24)

(alexandria:define-constant ResizeRequest 25)

(alexandria:define-constant CirculateNotify 26)

(alexandria:define-constant CirculateRequest 27)

(alexandria:define-constant PropertyNotify 28)

(alexandria:define-constant SelectionClear 29)

(alexandria:define-constant SelectionRequest 30)

(alexandria:define-constant SelectionNotify 31)

(alexandria:define-constant ColormapNotify 32)

(alexandria:define-constant ClientMessage 33)

(alexandria:define-constant MappingNotify 34)

(alexandria:define-constant GenericEvent 35)

(alexandria:define-constant LASTEvent 36)

(alexandria:define-constant ShiftMask (cl:ash 1 0))

(alexandria:define-constant LockMask (cl:ash 1 1))

(alexandria:define-constant ControlMask (cl:ash 1 2))

(alexandria:define-constant Mod1Mask (cl:ash 1 3))

(alexandria:define-constant Mod2Mask (cl:ash 1 4))

(alexandria:define-constant Mod3Mask (cl:ash 1 5))

(alexandria:define-constant Mod4Mask (cl:ash 1 6))

(alexandria:define-constant Mod5Mask (cl:ash 1 7))

(alexandria:define-constant ShiftMapIndex 0)

(alexandria:define-constant LockMapIndex 1)

(alexandria:define-constant ControlMapIndex 2)

(alexandria:define-constant Mod1MapIndex 3)

(alexandria:define-constant Mod2MapIndex 4)

(alexandria:define-constant Mod3MapIndex 5)

(alexandria:define-constant Mod4MapIndex 6)

(alexandria:define-constant Mod5MapIndex 7)

(alexandria:define-constant Button1Mask (cl:ash 1 8))

(alexandria:define-constant Button2Mask (cl:ash 1 9))

(alexandria:define-constant Button3Mask (cl:ash 1 10))

(alexandria:define-constant Button4Mask (cl:ash 1 11))

(alexandria:define-constant Button5Mask (cl:ash 1 12))

(alexandria:define-constant AnyModifier (cl:ash 1 15))

(alexandria:define-constant Button1 1)

(alexandria:define-constant Button2 2)

(alexandria:define-constant Button3 3)

(alexandria:define-constant Button4 4)

(alexandria:define-constant Button5 5)

(alexandria:define-constant NotifyNormal 0)

(alexandria:define-constant NotifyGrab 1)

(alexandria:define-constant NotifyUngrab 2)

(alexandria:define-constant NotifyWhileGrabbed 3)

(alexandria:define-constant NotifyHint 1)

(alexandria:define-constant NotifyAncestor 0)

(alexandria:define-constant NotifyVirtual 1)

(alexandria:define-constant NotifyInferior 2)

(alexandria:define-constant NotifyNonlinear 3)

(alexandria:define-constant NotifyNonlinearVirtual 4)

(alexandria:define-constant NotifyPointer 5)

(alexandria:define-constant NotifyPointerRoot 6)

(alexandria:define-constant NotifyDetailNone 7)

(alexandria:define-constant VisibilityUnobscured 0)

(alexandria:define-constant VisibilityPartiallyObscured 1)

(alexandria:define-constant VisibilityFullyObscured 2)

(alexandria:define-constant PlaceOnTop 0)

(alexandria:define-constant PlaceOnBottom 1)

(alexandria:define-constant FamilyInternet 0)

(alexandria:define-constant FamilyDECnet 1)

(alexandria:define-constant FamilyChaos 2)

(alexandria:define-constant FamilyInternet6 6)

(alexandria:define-constant FamilyServerInterpreted 5)

(alexandria:define-constant PropertyNewValue 0)

(alexandria:define-constant PropertyDelete 1)

(alexandria:define-constant ColormapUninstalled 0)

(alexandria:define-constant ColormapInstalled 1)

(alexandria:define-constant GrabModeSync 0)

(alexandria:define-constant GrabModeAsync 1)

(alexandria:define-constant GrabSuccess 0)

(alexandria:define-constant AlreadyGrabbed 1)

(alexandria:define-constant GrabInvalidTime 2)

(alexandria:define-constant GrabNotViewable 3)

(alexandria:define-constant GrabFrozen 4)

(alexandria:define-constant AsyncPointer 0)

(alexandria:define-constant SyncPointer 1)

(alexandria:define-constant ReplayPointer 2)

(alexandria:define-constant AsyncKeyboard 3)

(alexandria:define-constant SyncKeyboard 4)

(alexandria:define-constant ReplayKeyboard 5)

(alexandria:define-constant AsyncBoth 6)

(alexandria:define-constant SyncBoth 7)

(alexandria:define-constant RevertToParent 2)

(alexandria:define-constant Success 0)

(alexandria:define-constant BadRequest 1)

(alexandria:define-constant BadValue 2)

(alexandria:define-constant BadWindow 3)

(alexandria:define-constant BadPixmap 4)

(alexandria:define-constant BadAtom 5)

(alexandria:define-constant BadCursor 6)

(alexandria:define-constant BadFont 7)

(alexandria:define-constant BadMatch 8)

(alexandria:define-constant BadDrawable 9)

(alexandria:define-constant BadAccess 10)

(alexandria:define-constant BadAlloc 11)

(alexandria:define-constant BadColor 12)

(alexandria:define-constant BadGC 13)

(alexandria:define-constant BadIDChoice 14)

(alexandria:define-constant BadName 15)

(alexandria:define-constant BadLength 16)

(alexandria:define-constant BadImplementation 17)

(alexandria:define-constant FirstExtensionError 128)

(alexandria:define-constant LastExtensionError 255)

(alexandria:define-constant InputOutput 1)

(alexandria:define-constant InputOnly 2)

(alexandria:define-constant CWBackPixmap (ash 1 0))

(alexandria:define-constant CWBackPixel (ash 1 1))

(alexandria:define-constant CWBorderPixmap (ash 1 2))

(alexandria:define-constant CWBorderPixel (ash 1 3))

(alexandria:define-constant CWBitGravity (ash 1 4))

(alexandria:define-constant CWWinGravity (ash 1 5))

(alexandria:define-constant CWBackingStore (ash 1 6))

(alexandria:define-constant CWBackingPlanes (ash 1 7))

(alexandria:define-constant CWBackingPixel (ash 1 8))

(alexandria:define-constant CWOverrideRedirect (ash 1 9))

(alexandria:define-constant CWSaveUnder (ash 1 10))

(alexandria:define-constant CWEventMask (ash 1 11))

(alexandria:define-constant CWDontPropagate (ash 1 12))

(alexandria:define-constant CWColormap (ash 1 13))

(alexandria:define-constant CWCursor (ash 1 14))

(alexandria:define-constant CWX (cl:ash 1 0))

(alexandria:define-constant CWY (cl:ash 1 1))

(alexandria:define-constant CWWidth (cl:ash 1 2))

(alexandria:define-constant CWHeight (cl:ash 1 3))

(alexandria:define-constant CWBorderWidth (cl:ash 1 4))

(alexandria:define-constant CWSibling (cl:ash 1 5))

(alexandria:define-constant CWStackMode (cl:ash 1 6))

(alexandria:define-constant ForgetGravity 0)

(alexandria:define-constant NorthWestGravity 1)

(alexandria:define-constant NorthGravity 2)

(alexandria:define-constant NorthEastGravity 3)

(alexandria:define-constant WestGravity 4)

(alexandria:define-constant CenterGravity 5)

(alexandria:define-constant EastGravity 6)

(alexandria:define-constant SouthWestGravity 7)

(alexandria:define-constant SouthGravity 8)

(alexandria:define-constant SouthEastGravity 9)

(alexandria:define-constant StaticGravity 10)

(alexandria:define-constant UnmapGravity 0)

(alexandria:define-constant NotUseful 0)

(alexandria:define-constant WhenMapped 1)

(alexandria:define-constant Always 2)

(alexandria:define-constant IsUnmapped 0)

(alexandria:define-constant IsUnviewable 1)

(alexandria:define-constant IsViewable 2)

(alexandria:define-constant SetModeInsert 0)

(alexandria:define-constant SetModeDelete 1)

(alexandria:define-constant DestroyAll 0)

(alexandria:define-constant RetainPermanent 1)

(alexandria:define-constant RetainTemporary 2)

(alexandria:define-constant Above 0)

(alexandria:define-constant Below 1)

(alexandria:define-constant TopIf 2)

(alexandria:define-constant BottomIf 3)

(alexandria:define-constant Opposite 4)

(alexandria:define-constant RaiseLowest 0)

(alexandria:define-constant LowerHighest 1)

(alexandria:define-constant PropModeReplace 0)

(alexandria:define-constant PropModePrepend 1)

(alexandria:define-constant PropModeAppend 2)

(alexandria:define-constant GXclear #x0)

(alexandria:define-constant GXand #x01)

(alexandria:define-constant GXandReverse #x02)

(alexandria:define-constant GXcopy #x03)

(alexandria:define-constant GXandInverted #x04)

(alexandria:define-constant GXnoop #x05)

(alexandria:define-constant GXxor #x06)

(alexandria:define-constant GXor #x07)

(alexandria:define-constant GXnor #x08)

(alexandria:define-constant GXequiv #x09)

(alexandria:define-constant GXinvert #x0A)

(alexandria:define-constant GXorReverse #x0B)

(alexandria:define-constant GXcopyInverted #x0C)

(alexandria:define-constant GXorInverted #x0D)

(alexandria:define-constant GXnand #x0E)

(alexandria:define-constant GXset #x0F)

(alexandria:define-constant LineSolid 0)

(alexandria:define-constant LineOnOffDash 1)

(alexandria:define-constant LineDoubleDash 2)

(alexandria:define-constant CapNotLast 0)

(alexandria:define-constant CapButt 1)

(alexandria:define-constant CapRound 2)

(alexandria:define-constant CapProjecting 3)

(alexandria:define-constant JoinMiter 0)

(alexandria:define-constant JoinRound 1)

(alexandria:define-constant JoinBevel 2)

(alexandria:define-constant FillSolid 0)

(alexandria:define-constant FillTiled 1)

(alexandria:define-constant FillStippled 2)

(alexandria:define-constant FillOpaqueStippled 3)

(alexandria:define-constant EvenOddRule 0)

(alexandria:define-constant WindingRule 1)

(alexandria:define-constant ClipByChildren 0)

(alexandria:define-constant IncludeInferiors 1)

(alexandria:define-constant Unsorted 0)

(alexandria:define-constant YSorted 1)

(alexandria:define-constant YXSorted 2)

(alexandria:define-constant YXBanded 3)

(alexandria:define-constant CoordModeOrigin 0)

(alexandria:define-constant CoordModePrevious 1)

(alexandria:define-constant Complex 0)

(alexandria:define-constant Nonconvex 1)

(alexandria:define-constant Convex 2)

(alexandria:define-constant ArcChord 0)

(alexandria:define-constant ArcPieSlice 1)

(alexandria:define-constant GCFunction (ash 1 0))

(alexandria:define-constant GCPlaneMask (ash 1 1))

(alexandria:define-constant GCForeground (ash 1 2))

(alexandria:define-constant GCBackground (ash 1 3))

(alexandria:define-constant GCLineWidth (ash 1 4))

(alexandria:define-constant GCLineStyle (ash 1 5))

(alexandria:define-constant GCCapStyle (ash 1 6))

(alexandria:define-constant GCJoinStyle (ash 1 7))

(alexandria:define-constant GCFillStyle (ash 1 8))

(alexandria:define-constant GCFillRule (ash 1 9))

(alexandria:define-constant GCTile (ash 1 10))

(alexandria:define-constant GCStipple (ash 1 11))

(alexandria:define-constant GCTileStipXOrigin (ash 1 12))

(alexandria:define-constant GCTileStipYOrigin (ash 1 13))

(alexandria:define-constant GCFont (ash 1 14))

(alexandria:define-constant GCSubwindowMode (ash 1 15))

(alexandria:define-constant GCGraphicsExposures (ash 1 16))

(alexandria:define-constant GCClipXOrigin (ash 1 17))

(alexandria:define-constant GCClipYOrigin (ash 1 18))

(alexandria:define-constant GCClipMask (ash 1 19))

(alexandria:define-constant GCDashOffset (ash 1 20))

(alexandria:define-constant GCDashList (ash 1 21))

(alexandria:define-constant GCArcMode (ash 1 22))

(alexandria:define-constant GCLastBit 22)

(alexandria:define-constant FontLeftToRight 0)

(alexandria:define-constant FontRightToLeft 1)

(alexandria:define-constant FontChange 255)

(alexandria:define-constant XYBitmap 0)

(alexandria:define-constant XYPixmap 1)

(alexandria:define-constant ZPixmap 2)

(alexandria:define-constant AllocNone 0)

(alexandria:define-constant AllocAll 1)

(alexandria:define-constant DoRed (cl:ash 1 0))

(alexandria:define-constant DoGreen (cl:ash 1 1))

(alexandria:define-constant DoBlue (cl:ash 1 2))

(alexandria:define-constant CursorShape 0)

(alexandria:define-constant TileShape 1)

(alexandria:define-constant StippleShape 2)

(alexandria:define-constant AutoRepeatModeOff 0)

(alexandria:define-constant AutoRepeatModeOn 1)

(alexandria:define-constant AutoRepeatModeDefault 2)

(alexandria:define-constant LedModeOff 0)

(alexandria:define-constant LedModeOn 1)

(alexandria:define-constant KBKeyClickPercent (ash 1 0))

(alexandria:define-constant KBBellPercent (ash 1 1))

(alexandria:define-constant KBBellPitch (ash 1 2))

(alexandria:define-constant KBBellDuration (ash 1 3))

(alexandria:define-constant KBLed (ash 1 4))

(alexandria:define-constant KBLedMode (ash 1 5))

(alexandria:define-constant KBKey (ash 1 6))

(alexandria:define-constant KBAutoRepeatMode (ash 1 7))

(alexandria:define-constant MappingSuccess 0)

(alexandria:define-constant MappingBusy 1)

(alexandria:define-constant MappingFailed 2)

(alexandria:define-constant MappingModifier 0)

(alexandria:define-constant MappingKeyboard 1)

(alexandria:define-constant MappingPointer 2)

(alexandria:define-constant DontPreferBlanking 0)

(alexandria:define-constant PreferBlanking 1)

(alexandria:define-constant DefaultBlanking 2)

(alexandria:define-constant DisableScreenSaver 0)

(alexandria:define-constant DisableScreenInterval 0)

(alexandria:define-constant DontAllowExposures 0)

(alexandria:define-constant AllowExposures 1)

(alexandria:define-constant DefaultExposures 2)

(alexandria:define-constant ScreenSaverReset 0)

(alexandria:define-constant ScreenSaverActive 1)

(alexandria:define-constant HostInsert 0)

(alexandria:define-constant HostDelete 1)

(alexandria:define-constant EnableAccess 1)

(alexandria:define-constant DisableAccess 0)

(alexandria:define-constant StaticGray 0)

(alexandria:define-constant GrayScale 1)

(alexandria:define-constant StaticColor 2)

(alexandria:define-constant PseudoColor 3)

(alexandria:define-constant TrueColor 4)

(alexandria:define-constant DirectColor 5)

(alexandria:define-constant LSBFirst 0)

(alexandria:define-constant MSBFirst 1)

;;================================
;; from Xutil.h
;; $ swig -cffi -module x11 -o x.util /usr/X11/include/X11/Xutil.h
;;================================

(alexandria:define-constant NoValue #x0000)

(alexandria:define-constant XValue #x0001)

(alexandria:define-constant YValue #x0002)

(alexandria:define-constant WidthValue #x0004)

(alexandria:define-constant HeightValue #x0008)

(alexandria:define-constant AllValues #x000F)

(alexandria:define-constant XNegative #x0010)

(alexandria:define-constant YNegative #x0020)

(cffi:defcstruct XSizeHints
  (flags :long)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (min_width :int)
  (min_height :int)
  (max_width :int)
  (max_height :int)
  (width_inc :int)
  (height_inc :int)
  (base_width :int)
  (base_height :int)
  (win_gravity :int)
  (max_aspect :pointer)
  (min_aspect :pointer))

(cffi:defcstruct XSizeHints_max_aspect
  (x :int)
  (y :int))

(cffi:defcstruct XSizeHints_min_aspect
  (x :int)
  (y :int))

(alexandria:define-constant USPosition (ash 1 0))

(alexandria:define-constant USSize (ash 1 1))

(alexandria:define-constant PPosition (ash 1 2))

(alexandria:define-constant PSize (ash 1 3))

(alexandria:define-constant PMinSize (ash 1 4))

(alexandria:define-constant PMaxSize (ash 1 5))

(alexandria:define-constant PResizeInc (ash 1 6))

(alexandria:define-constant PAspect (ash 1 7))

(alexandria:define-constant PBaseSize (ash 1 8))

(alexandria:define-constant PWinGravity (ash 1 9))

(alexandria:define-constant PAllHints (cl:logior (ash 1 2)
                                      (ash 1 3)
                                      (ash 1 4)
                                      (ash 1 5)
                                      (ash 1 6)
                                      (ash 1 7)))

(cffi:defcstruct XWMHints
  (flags :long)
  (input :pointer)
  (initial_state :int)
  (icon_pixmap :pointer)
  (icon_window :pointer)
  (icon_x :int)
  (icon_y :int)
  (icon_mask :pointer)
  (window_group :pointer))

(alexandria:define-constant InputHint (ash 1 0))

(alexandria:define-constant StateHint (ash 1 1))

(alexandria:define-constant IconPixmapHint (ash 1 2))

(alexandria:define-constant IconWindowHint (ash 1 3))

(alexandria:define-constant IconPositionHint (ash 1 4))

(alexandria:define-constant IconMaskHint (ash 1 5))

(alexandria:define-constant WindowGroupHint (ash 1 6))

(alexandria:define-constant AllHints (cl:logior (ash 1 0)
                                     (ash 1 1)
                                     (ash 1 2)
                                     (ash 1 3)
                                     (ash 1 4)
                                     (ash 1 5)
                                     (ash 1 6)))

(alexandria:define-constant XUrgencyHint (ash 1 8))

(alexandria:define-constant WithdrawnState 0)

(alexandria:define-constant NormalState 1)

(alexandria:define-constant IconicState 3)

(alexandria:define-constant DontCareState 0)

(alexandria:define-constant ZoomState 2)

(alexandria:define-constant InactiveState 4)

(cffi:defcstruct XTextProperty
  (value :pointer)
  (encoding :pointer)
  (format :int)
  (nitems :unsigned-long))

(alexandria:define-constant XNoMemory -1)

(alexandria:define-constant XLocaleNotSupported -2)

(alexandria:define-constant XConverterNotFound -3)

(cffi:defcenum XICCEncodingStyle
  :XStringStyle
  :XCompoundTextStyle
  :XTextStyle
  :XStdICCTextStyle
  :XUTF8StringStyle)

(cffi:defcstruct XIconSize
  (min_width :int)
  (min_height :int)
  (max_width :int)
  (max_height :int)
  (width_inc :int)
  (height_inc :int))

(cffi:defcstruct XClassHint
  (res_name :string)
  (res_class :string))

(cffi:defcstruct XComposeStatus
  (compose_ptr :pointer)
  (chars_matched :int))

(alexandria:define-constant RectangleOut 0)

(alexandria:define-constant RectangleIn 1)

(alexandria:define-constant RectanglePart 2)

(cffi:defcstruct XVisualInfo
  (visual :pointer)
  (visualid :pointer)
  (screen :int)
  (depth :int)
  (class :int)
  (red_mask :unsigned-long)
  (green_mask :unsigned-long)
  (blue_mask :unsigned-long)
  (colormap_size :int)
  (bits_per_rgb :int))

(alexandria:define-constant VisualNoMask #x0)

(alexandria:define-constant VisualIDMask #x1)

(alexandria:define-constant VisualScreenMask #x2)

(alexandria:define-constant VisualDepthMask #x4)

(alexandria:define-constant VisualClassMask #x8)

(alexandria:define-constant VisualRedMaskMask #x10)

(alexandria:define-constant VisualGreenMaskMask #x20)

(alexandria:define-constant VisualBlueMaskMask #x40)

(alexandria:define-constant VisualColormapSizeMask #x80)

(alexandria:define-constant VisualBitsPerRGBMask #x100)

(alexandria:define-constant VisualAllMask #x1FF)

(cffi:defcstruct XStandardColormap
  (colormap :pointer)
  (red_max :unsigned-long)
  (red_mult :unsigned-long)
  (green_max :unsigned-long)
  (green_mult :unsigned-long)
  (blue_max :unsigned-long)
  (blue_mult :unsigned-long)
  (base_pixel :unsigned-long)
  (visualid :pointer)
  (killid :pointer))

(alexandria:define-constant BitmapSuccess 0)

(alexandria:define-constant BitmapOpenFailed 1)

(alexandria:define-constant BitmapFileInvalid 2)

(alexandria:define-constant BitmapNoMemory 3)

(alexandria:define-constant XCSUCCESS 0)

(alexandria:define-constant XCNOMEM 1)

(alexandria:define-constant XCNOENT 2)

(cffi:defcfun ("XAllocClassHint" XAllocClassHint) :pointer)

(cffi:defcfun ("XAllocIconSize" XAllocIconSize) :pointer)

(cffi:defcfun ("XAllocSizeHints" XAllocSizeHints) :pointer)

(cffi:defcfun ("XAllocStandardColormap" XAllocStandardColormap) :pointer)

(cffi:defcfun ("XAllocWMHints" XAllocWMHints) :pointer)

(cffi:defcfun ("XClipBox" XClipBox) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XCreateRegion" XCreateRegion) :pointer)

(cffi:defcfun ("XDefaultString" XDefaultString) :string)

(cffi:defcfun ("XDeleteContext" XDeleteContext) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int))

(cffi:defcfun ("XDestroyRegion" XDestroyRegion) :int
  (arg0 :pointer))

(cffi:defcfun ("XEmptyRegion" XEmptyRegion) :int
  (arg0 :pointer))

(cffi:defcfun ("XEqualRegion" XEqualRegion) :int
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XFindContext" XFindContext) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :pointer))

(cffi:defcfun ("XGetClassHint" XGetClassHint) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetIconSizes" XGetIconSizes) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XGetNormalHints" XGetNormalHints) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetRGBColormaps" XGetRGBColormaps) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("XGetSizeHints" XGetSizeHints) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XGetStandardColormap" XGetStandardColormap) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XGetTextProperty" XGetTextProperty) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XGetVisualInfo" XGetVisualInfo) :pointer
  (arg0 :pointer)
  (arg1 :long)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XGetWMClientMachine" XGetWMClientMachine) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetWMHints" XGetWMHints) :pointer
  (arg0 :pointer)
  (arg1 :pointer))

(cffi:defcfun ("XGetWMIconName" XGetWMIconName) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetWMName" XGetWMName) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XGetWMNormalHints" XGetWMNormalHints) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XGetWMSizeHints" XGetWMSizeHints) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("XGetZoomHints" XGetZoomHints) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XIntersectRegion" XIntersectRegion) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XConvertCase" XConvertCase) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XLookupString" XLookupString) :int
  (arg0 :pointer)
  (arg1 :string)
  (arg2 :int)
  (arg3 :pointer)
  (arg4 :pointer))

(cffi:defcfun ("XMatchVisualInfo" XMatchVisualInfo) :pointer
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :int)
  (arg3 :int)
  (arg4 :pointer))

(cffi:defcfun ("XOffsetRegion" XOffsetRegion) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :int))

(cffi:defcfun ("XPointInRegion" XPointInRegion) :pointer
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :int))

(cffi:defcfun ("XPolygonRegion" XPolygonRegion) :pointer
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :int))

(cffi:defcfun ("XRectInRegion" XRectInRegion) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :int)
  (arg3 :unsigned-int)
  (arg4 :unsigned-int))

(cffi:defcfun ("XSaveContext" XSaveContext) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :int)
  (arg3 :string))

(cffi:defcfun ("XSetClassHint" XSetClassHint) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetIconSizes" XSetIconSizes) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int))

(cffi:defcfun ("XSetNormalHints" XSetNormalHints) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetRGBColormaps" XSetRGBColormaps) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :int)
  (arg4 :pointer))

(cffi:defcfun ("XSetSizeHints" XSetSizeHints) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XSetStandardProperties" XSetStandardProperties) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :string)
  ;;(arg4 :pointer)
  (arg4 :unsigned-int)
  (arg5 :pointer)
  (arg6 :int)
  (arg7 :pointer))

(cffi:defcfun ("XSetTextProperty" XSetTextProperty) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XSetWMClientMachine" XSetWMClientMachine) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetWMHints" XSetWMHints) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetWMIconName" XSetWMIconName) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetWMName" XSetWMName) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetWMNormalHints" XSetWMNormalHints) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetWMProperties" XSetWMProperties) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer)
  (arg4 :pointer)
  (arg5 :int)
  (arg6 :pointer)
  (arg7 :pointer)
  (arg8 :pointer))

(cffi:defcfun ("XmbSetWMProperties" XmbSetWMProperties) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :string)
  (arg4 :pointer)
  (arg5 :int)
  (arg6 :pointer)
  (arg7 :pointer)
  (arg8 :pointer))

(cffi:defcfun ("Xutf8SetWMProperties" Xutf8SetWMProperties) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :string)
  (arg3 :string)
  (arg4 :pointer)
  (arg5 :int)
  (arg6 :pointer)
  (arg7 :pointer)
  (arg8 :pointer))

(cffi:defcfun ("XSetWMSizeHints" XSetWMSizeHints) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XSetRegion" XSetRegion) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XSetStandardColormap" XSetStandardColormap) :void
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer)
  (arg3 :pointer))

(cffi:defcfun ("XSetZoomHints" XSetZoomHints) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XShrinkRegion" XShrinkRegion) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :int))

(cffi:defcfun ("XStringListToTextProperty" XStringListToTextProperty) :pointer
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :pointer))

(cffi:defcfun ("XSubtractRegion" XSubtractRegion) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XmbTextListToTextProperty" XmbTextListToTextProperty) :int
  (display :pointer)
  (list :pointer)
  (count :int)
  (style XICCEncodingStyle)
  (text_prop_return :pointer))

(cffi:defcfun ("XwcTextListToTextProperty" XwcTextListToTextProperty) :int
  (display :pointer)
  (list :pointer)
  (count :int)
  (style XICCEncodingStyle)
  (text_prop_return :pointer))

(cffi:defcfun ("Xutf8TextListToTextProperty" Xutf8TextListToTextProperty) :int
  (display :pointer)
  (list :pointer)
  (count :int)
  (style XICCEncodingStyle)
  (text_prop_return :pointer))

(cffi:defcfun ("XwcFreeStringList" XwcFreeStringList) :void
  (list :pointer))

(cffi:defcfun ("XTextPropertyToStringList" XTextPropertyToStringList) :pointer
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XmbTextPropertyToTextList" XmbTextPropertyToTextList) :int
  (display :pointer)
  (text_prop :pointer)
  (list_return :pointer)
  (count_return :pointer))

(cffi:defcfun ("XwcTextPropertyToTextList" XwcTextPropertyToTextList) :int
  (display :pointer)
  (text_prop :pointer)
  (list_return :pointer)
  (count_return :pointer))

(cffi:defcfun ("Xutf8TextPropertyToTextList" Xutf8TextPropertyToTextList) :int
  (display :pointer)
  (text_prop :pointer)
  (list_return :pointer)
  (count_return :pointer))

(cffi:defcfun ("XUnionRectWithRegion" XUnionRectWithRegion) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XUnionRegion" XUnionRegion) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XWMGeometry" XWMGeometry) :int
  (arg0 :pointer)
  (arg1 :int)
  (arg2 :string)
  (arg3 :string)
  (arg4 :unsigned-int)
  (arg5 :pointer)
  (arg6 :pointer)
  (arg7 :pointer)
  (arg8 :pointer)
  (arg9 :pointer)
  (arg10 :pointer))

(cffi:defcfun ("XXorRegion" XXorRegion) :int
  (arg0 :pointer)
  (arg1 :pointer)
  (arg2 :pointer))

(cffi:defcfun ("XOpenDisplay" XOpenDisplay) :pointer
  (arg0 :string))
