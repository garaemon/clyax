;;================================================
;; glx-bindings.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================
(declaim (optimize (debug 3)
                   (safety 3)))


(in-package :glx)


(alexandria:define-constant GLX_VERSION_1_1 1)

(alexandria:define-constant GLX_VERSION_1_2 1)

(alexandria:define-constant GLX_VERSION_1_3 1)

(alexandria:define-constant GLX_VERSION_1_4 1)

(alexandria:define-constant GLX_EXTENSION_NAME "GLX" :test #'string=)

(alexandria:define-constant GLX_USE_GL 1)

(alexandria:define-constant GLX_BUFFER_SIZE 2)

(alexandria:define-constant GLX_LEVEL 3)

(alexandria:define-constant GLX_RGBA 4)

(alexandria:define-constant GLX_DOUBLEBUFFER 5)

(alexandria:define-constant GLX_STEREO 6)

(alexandria:define-constant GLX_AUX_BUFFERS 7)

(alexandria:define-constant GLX_RED_SIZE 8)

(alexandria:define-constant GLX_GREEN_SIZE 9)

(alexandria:define-constant GLX_BLUE_SIZE 10)

(alexandria:define-constant GLX_ALPHA_SIZE 11)

(alexandria:define-constant GLX_DEPTH_SIZE 12)

(alexandria:define-constant GLX_STENCIL_SIZE 13)

(alexandria:define-constant GLX_ACCUM_RED_SIZE 14)

(alexandria:define-constant GLX_ACCUM_GREEN_SIZE 15)

(alexandria:define-constant GLX_ACCUM_BLUE_SIZE 16)

(alexandria:define-constant GLX_ACCUM_ALPHA_SIZE 17)

(alexandria:define-constant GLX_BAD_SCREEN 1)

(alexandria:define-constant GLX_BAD_ATTRIBUTE 2)

(alexandria:define-constant GLX_NO_EXTENSION 3)

(alexandria:define-constant GLX_BAD_VISUAL 4)

(alexandria:define-constant GLX_BAD_CONTEXT 5)

(alexandria:define-constant GLX_BAD_VALUE 6)

(alexandria:define-constant GLX_BAD_ENUM 7)

(alexandria:define-constant GLX_VENDOR 1)

(alexandria:define-constant GLX_VERSION 2)

(alexandria:define-constant GLX_EXTENSIONS 3)

(alexandria:define-constant GLX_CONFIG_CAVEAT #x20)

(alexandria:define-constant GLX_DONT_CARE #xFFFFFFFF)

(alexandria:define-constant GLX_X_VISUAL_TYPE #x22)

(alexandria:define-constant GLX_TRANSPARENT_TYPE #x23)

(alexandria:define-constant GLX_TRANSPARENT_INDEX_VALUE #x24)

(alexandria:define-constant GLX_TRANSPARENT_RED_VALUE #x25)

(alexandria:define-constant GLX_TRANSPARENT_GREEN_VALUE #x26)

(alexandria:define-constant GLX_TRANSPARENT_BLUE_VALUE #x27)

(alexandria:define-constant GLX_TRANSPARENT_ALPHA_VALUE #x28)

(alexandria:define-constant GLX_WINDOW_BIT #x1)

(alexandria:define-constant GLX_PIXMAP_BIT #x2)

(alexandria:define-constant GLX_PBUFFER_BIT #x4)

(alexandria:define-constant GLX_AUX_BUFFERS_BIT #x10)

(alexandria:define-constant GLX_FRONT_LEFT_BUFFER_BIT #x1)

(alexandria:define-constant GLX_FRONT_RIGHT_BUFFER_BIT #x2)

(alexandria:define-constant GLX_BACK_LEFT_BUFFER_BIT #x4)

(alexandria:define-constant GLX_BACK_RIGHT_BUFFER_BIT #x8)

(alexandria:define-constant GLX_DEPTH_BUFFER_BIT #x20)

(alexandria:define-constant GLX_STENCIL_BUFFER_BIT #x40)

(alexandria:define-constant GLX_ACCUM_BUFFER_BIT #x80)

(alexandria:define-constant GLX_NONE #x8000)

(alexandria:define-constant GLX_SLOW_CONFIG #x8001)

(alexandria:define-constant GLX_TRUE_COLOR #x8002)

(alexandria:define-constant GLX_DIRECT_COLOR #x8003)

(alexandria:define-constant GLX_PSEUDO_COLOR #x8004)

(alexandria:define-constant GLX_STATIC_COLOR #x8005)

(alexandria:define-constant GLX_GRAY_SCALE #x8006)

(alexandria:define-constant GLX_STATIC_GRAY #x8007)

(alexandria:define-constant GLX_TRANSPARENT_RGB #x8008)

(alexandria:define-constant GLX_TRANSPARENT_INDEX #x8009)

(alexandria:define-constant GLX_VISUAL_ID #x800B)

(alexandria:define-constant GLX_SCREEN #x800C)

(alexandria:define-constant GLX_NON_CONFORMANT_CONFIG #x800D)

(alexandria:define-constant GLX_DRAWABLE_TYPE #x8010)

(alexandria:define-constant GLX_RENDER_TYPE #x8011)

(alexandria:define-constant GLX_X_RENDERABLE #x8012)

(alexandria:define-constant GLX_FBCONFIG_ID #x8013)

(alexandria:define-constant GLX_RGBA_TYPE #x8014)

(alexandria:define-constant GLX_COLOR_INDEX_TYPE #x8015)

(alexandria:define-constant GLX_MAX_PBUFFER_WIDTH #x8016)

(alexandria:define-constant GLX_MAX_PBUFFER_HEIGHT #x8017)

(alexandria:define-constant GLX_MAX_PBUFFER_PIXELS #x8018)

(alexandria:define-constant GLX_PRESERVED_CONTENTS #x801B)

(alexandria:define-constant GLX_LARGEST_PBUFFER #x801C)

(alexandria:define-constant GLX_WIDTH #x801D)

(alexandria:define-constant GLX_HEIGHT #x801E)

(alexandria:define-constant GLX_EVENT_MASK #x801F)

(alexandria:define-constant GLX_DAMAGED #x8020)

(alexandria:define-constant GLX_SAVED #x8021)

(alexandria:define-constant GLX_WINDOW #x8022)

(alexandria:define-constant GLX_PBUFFER #x8023)

(alexandria:define-constant GLX_PBUFFER_HEIGHT #x8040)

(alexandria:define-constant GLX_PBUFFER_WIDTH #x8041)

(alexandria:define-constant GLX_RGBA_BIT #x1)

(alexandria:define-constant GLX_COLOR_INDEX_BIT #x2)

(alexandria:define-constant GLX_PBUFFER_CLOBBER_MASK #x8000000)

(alexandria:define-constant GLX_SAMPLE_BUFFERS #x186A0)

(alexandria:define-constant GLX_SAMPLES #x186A1)

(cffi:defcfun ("glXChooseVisual" glXChooseVisual) :pointer
  (dpy :pointer)
  (screen :int)
  (attribList :pointer))

(cffi:defcfun ("glXCreateContext" glXCreateContext) :pointer
  (dpy :pointer)
  (vis :pointer)
  (shareList :pointer)
  ;;(direct :pointer))
  (direct :unsigned-int))

(cffi:defcfun ("glXDestroyContext" glXDestroyContext) :void
  (dpy :pointer)
  (ctx :pointer))

(cffi:defcfun ("glXMakeCurrent" glXMakeCurrent) :int
  (dpy :pointer)
  (drawable :pointer)
  (ctx :pointer))

(cffi:defcfun ("glXCopyContext" glXCopyContext) :void
  (dpy :pointer)
  (src :pointer)
  (dst :pointer)
  (mask :unsigned-long))

(cffi:defcfun ("glXSwapBuffers" glXSwapBuffers) :void
  (dpy :pointer)
  (drawable :pointer))

(cffi:defcfun ("glXCreateGLXPixmap" glXCreateGLXPixmap) :pointer
  (dpy :pointer)
  (visual :pointer)
  (pixmap :pointer))

(cffi:defcfun ("glXDestroyGLXPixmap" glXDestroyGLXPixmap) :void
  (dpy :pointer)
  (pixmap :pointer))

(cffi:defcfun ("glXQueryExtension" glXQueryExtension) :pointer
  (dpy :pointer)
  (errorb :pointer)
  (event :pointer))

(cffi:defcfun ("glXQueryVersion" glXQueryVersion) :pointer
  (dpy :pointer)
  (maj :pointer)
  (min :pointer))

(cffi:defcfun ("glXIsDirect" glXIsDirect) :pointer
  (dpy :pointer)
  (ctx :pointer))

(cffi:defcfun ("glXGetConfig" glXGetConfig) :int
  (dpy :pointer)
  (visual :pointer)
  (attrib :int)
  (value :pointer))

(cffi:defcfun ("glXGetCurrentContext" glXGetCurrentContext) :pointer)

(cffi:defcfun ("glXGetCurrentDrawable" glXGetCurrentDrawable) :pointer)

(cffi:defcfun ("glXWaitGL" glXWaitGL) :void)

(cffi:defcfun ("glXWaitX" glXWaitX) :void)

(cffi:defcfun ("glXUseXFont" glXUseXFont) :void
  (font :pointer)
  (first :int)
  (count :int)
  (list :int))

(cffi:defcfun ("glXQueryExtensionsString" glXQueryExtensionsString) :string
  (dpy :pointer)
  (screen :int))

(cffi:defcfun ("glXQueryServerString" glXQueryServerString) :string
  (dpy :pointer)
  (screen :int)
  (name :int))

(cffi:defcfun ("glXGetClientString" glXGetClientString) :string
  (dpy :pointer)
  (name :int))

(cffi:defcfun ("glXGetCurrentDisplay" glXGetCurrentDisplay) :pointer)

(cffi:defcfun ("glXChooseFBConfig" glXChooseFBConfig) :pointer
  (dpy :pointer)
  (screen :int)
  (attribList :pointer)
  (nitems :pointer))

(cffi:defcfun ("glXGetFBConfigAttrib" glXGetFBConfigAttrib) :int
  (dpy :pointer)
  (config :pointer)
  (attribute :int)
  (value :pointer))

(cffi:defcfun ("glXGetFBConfigs" glXGetFBConfigs) :pointer
  (dpy :pointer)
  (screen :int)
  (nelements :pointer))

(cffi:defcfun ("glXGetVisualFromFBConfig" glXGetVisualFromFBConfig) :pointer
  (dpy :pointer)
  (config :pointer))

(cffi:defcfun ("glXCreateWindow" glXCreateWindow) :pointer
  (dpy :pointer)
  (config :pointer)
  (win :pointer)
  (attribList :pointer))

(cffi:defcfun ("glXDestroyWindow" glXDestroyWindow) :void
  (dpy :pointer)
  (window :pointer))

(cffi:defcfun ("glXCreatePixmap" glXCreatePixmap) :pointer
  (dpy :pointer)
  (config :pointer)
  (pixmap :pointer)
  (attribList :pointer))

(cffi:defcfun ("glXDestroyPixmap" glXDestroyPixmap) :void
  (dpy :pointer)
  (pixmap :pointer))

(cffi:defcfun ("glXCreatePbuffer" glXCreatePbuffer) :pointer
  (dpy :pointer)
  (config :pointer)
  (attribList :pointer))

(cffi:defcfun ("glXDestroyPbuffer" glXDestroyPbuffer) :void
  (dpy :pointer)
  (pbuf :pointer))

(cffi:defcfun ("glXQueryDrawable" glXQueryDrawable) :void
  (dpy :pointer)
  (draw :pointer)
  (attribute :int)
  (value :pointer))

(cffi:defcfun ("glXCreateNewContext" glXCreateNewContext) :pointer
  (dpy :pointer)
  (config :pointer)
  (renderType :int)
  (shareList :pointer)
  (direct :pointer))

(cffi:defcfun ("glXMakeContextCurrent" glXMakeContextCurrent) :pointer
  (dpy :pointer)
  (draw :pointer)
  (read :pointer)
  (ctx :pointer))

(cffi:defcfun ("glXGetCurrentReadDrawable" glXGetCurrentReadDrawable) :pointer)

(cffi:defcfun ("glXQueryContext" glXQueryContext) :int
  (dpy :pointer)
  (ctx :pointer)
  (attribute :int)
  (value :pointer))

(cffi:defcfun ("glXSelectEvent" glXSelectEvent) :void
  (dpy :pointer)
  (drawable :pointer)
  (mask :unsigned-long))

(cffi:defcfun ("glXGetSelectedEvent" glXGetSelectedEvent) :void
  (dpy :pointer)
  (drawable :pointer)
  (mask :pointer))

(cffi:defcfun ("glXGetProcAddress" glXGetProcAddress) :pointer
  (procname :pointer))

(cffi:defcfun ("glXAllocateMemoryNV" glXAllocateMemoryNV) :pointer
  (size :pointer)
  (readfreq :pointer)
  (writefreq :pointer)
  (priority :pointer))

(cffi:defcfun ("glXFreeMemoryNV" glXFreeMemoryNV) :void
  (pointer :pointer))

(alexandria:define-constant GLX_MESA_allocate_memory 1)

(cffi:defcfun ("glXAllocateMemoryMESA" glXAllocateMemoryMESA) :pointer
  (dpy :pointer)
  (scrn :int)
  (size :pointer)
  (readfreq :float)
  (writefreq :float)
  (priority :float))

(cffi:defcfun ("glXFreeMemoryMESA" glXFreeMemoryMESA) :void
  (dpy :pointer)
  (scrn :int)
  (pointer :pointer))

(cffi:defcfun ("glXGetMemoryOffsetMESA" glXGetMemoryOffsetMESA) :pointer
  (dpy :pointer)
  (scrn :int)
  (pointer :pointer))

(alexandria:define-constant GLX_ARB_render_texture 1)

(cffi:defcfun ("glXBindTexImageARB" glXBindTexImageARB) :pointer
  (dpy :pointer)
  (pbuffer :pointer)
  (buffer :int))

(cffi:defcfun ("glXReleaseTexImageARB" glXReleaseTexImageARB) :pointer
  (dpy :pointer)
  (pbuffer :pointer)
  (buffer :int))

(cffi:defcfun ("glXDrawableAttribARB" glXDrawableAttribARB) :pointer
  (dpy :pointer)
  (draw :pointer)
  (attribList :pointer))

(alexandria:define-constant GLX_NV_float_buffer 1)

(alexandria:define-constant GLX_FLOAT_COMPONENTS_NV #x20B0)

(alexandria:define-constant GLX_MESA_swap_frame_usage 1)

(cffi:defcfun ("glXGetFrameUsageMESA" glXGetFrameUsageMESA) :pointer
  (dpy :pointer)
  (drawable :pointer)
  (usage :pointer))

(cffi:defcfun ("glXBeginFrameTrackingMESA" glXBeginFrameTrackingMESA) :pointer
  (dpy :pointer)
  (drawable :pointer))

(cffi:defcfun ("glXEndFrameTrackingMESA" glXEndFrameTrackingMESA) :pointer
  (dpy :pointer)
  (drawable :pointer))

(cffi:defcfun ("glXQueryFrameTrackingMESA" glXQueryFrameTrackingMESA) :pointer
  (dpy :pointer)
  (drawable :pointer)
  (swapCount :pointer)
  (missedFrames :pointer)
  (lastMissedUsage :pointer))

(alexandria:define-constant GLX_MESA_swap_control 1)

(cffi:defcfun ("glXSwapIntervalMESA" glXSwapIntervalMESA) :int
  (interval :unsigned-int))

(cffi:defcfun ("glXGetSwapIntervalMESA" glXGetSwapIntervalMESA) :int)

(alexandria:define-constant GLX_EXT_texture_from_pixmap 1)

(alexandria:define-constant GLX_BIND_TO_TEXTURE_RGB_EXT #x20D0)

(alexandria:define-constant GLX_BIND_TO_TEXTURE_RGBA_EXT #x20D1)

(alexandria:define-constant GLX_BIND_TO_MIPMAP_TEXTURE_EXT #x20D2)

(alexandria:define-constant GLX_BIND_TO_TEXTURE_TARGETS_EXT #x20D3)

(alexandria:define-constant GLX_Y_INVERTED_EXT #x20D4)

(alexandria:define-constant GLX_TEXTURE_FORMAT_EXT #x20D5)

(alexandria:define-constant GLX_TEXTURE_TARGET_EXT #x20D6)

(alexandria:define-constant GLX_MIPMAP_TEXTURE_EXT #x20D7)

(alexandria:define-constant GLX_TEXTURE_FORMAT_NONE_EXT #x20D8)

(alexandria:define-constant GLX_TEXTURE_FORMAT_RGB_EXT #x20D9)

(alexandria:define-constant GLX_TEXTURE_FORMAT_RGBA_EXT #x20DA)

(alexandria:define-constant GLX_TEXTURE_1D_BIT_EXT #x1)

(alexandria:define-constant GLX_TEXTURE_2D_BIT_EXT #x2)

(alexandria:define-constant GLX_TEXTURE_RECTANGLE_BIT_EXT #x4)

(alexandria:define-constant GLX_TEXTURE_1D_EXT #x20DB)

(alexandria:define-constant GLX_TEXTURE_2D_EXT #x20DC)

(alexandria:define-constant GLX_TEXTURE_RECTANGLE_EXT #x20DD)

(alexandria:define-constant GLX_FRONT_LEFT_EXT #x20DE)

(alexandria:define-constant GLX_FRONT_RIGHT_EXT #x20DF)

(alexandria:define-constant GLX_BACK_LEFT_EXT #x20E0)

(alexandria:define-constant GLX_BACK_RIGHT_EXT #x20E1)

(alexandria:define-constant GLX_FRONT_EXT GLX_FRONT_LEFT_EXT)

(alexandria:define-constant GLX_BACK_EXT GLX_BACK_LEFT_EXT)

(alexandria:define-constant GLX_AUX0_EXT #x20E2)

(alexandria:define-constant GLX_AUX1_EXT #x20E3)

(alexandria:define-constant GLX_AUX2_EXT #x20E4)

(alexandria:define-constant GLX_AUX3_EXT #x20E5)

(alexandria:define-constant GLX_AUX4_EXT #x20E6)

(alexandria:define-constant GLX_AUX5_EXT #x20E7)

(alexandria:define-constant GLX_AUX6_EXT #x20E8)

(alexandria:define-constant GLX_AUX7_EXT #x20E9)

(alexandria:define-constant GLX_AUX8_EXT #x20EA)

(alexandria:define-constant GLX_AUX9_EXT #x20EB)

(cffi:defcfun ("glXBindTexImageEXT" glXBindTexImageEXT) :void
  (dpy :pointer)
  (drawable :pointer)
  (buffer :int)
  (attrib_list :pointer))

(cffi:defcfun ("glXReleaseTexImageEXT" glXReleaseTexImageEXT) :void
  (dpy :pointer)
  (drawable :pointer)
  (buffer :int))

(cffi:defcstruct GLXPbufferClobberEvent
    (event_type :int)
  (draw_type :int)
  (serial :unsigned-long)
  (send_event :pointer)
  (display :pointer)
  (drawable :pointer)
  (buffer_mask :unsigned-int)
  (aux_buffer :unsigned-int)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (count :int))

(cffi:defcunion GLXEvent
    (glxpbufferclobber GLXPbufferClobberEvent)
  (pad :pointer))

;;================================
;; from glint.h
;; $ swig -cffi -module x11 -o x11.lisp /usr/X11/include/GL/glxint.h
;;================================
(cffi:defcstruct __GLXvisualConfigRec
    (vid :pointer)
  (class :int)
  (rgba :pointer)
  (redSize :int)
  (greenSize :int)
  (blueSize :int)
  (alphaSize :int)
  (redMask :unsigned-long)
  (greenMask :unsigned-long)
  (blueMask :unsigned-long)
  (alphaMask :unsigned-long)
  (accumRedSize :int)
  (accumGreenSize :int)
  (accumBlueSize :int)
  (accumAlphaSize :int)
  (doubleBuffer :pointer)
  (stereo :pointer)
  (bufferSize :int)
  (depthSize :int)
  (stencilSize :int)
  (auxBuffers :int)
  (level :int)
  (visualRating :int)
  (transparentPixel :int)
  (transparentRed :int)
  (transparentGreen :int)
  (transparentBlue :int)
  (transparentAlpha :int)
  (transparentIndex :int)
  (multiSampleSize :int)
  (nMultiSampleBuffers :int)
  (visualSelectGroup :int))

(alexandria:define-constant __GLX_MIN_CONFIG_PROPS 18)

(alexandria:define-constant __GLX_MAX_CONFIG_PROPS 500)

(alexandria:define-constant __GLX_EXT_CONFIG_PROPS 10)

(alexandria:define-constant __GLX_TOTAL_CONFIG (cl:* (cl:+ 18 2) 10))

(cffi:defcstruct __GLXFBConfigRec
    (visualType :int)
  (transparentType :int)
  (transparentRed :int)
  (transparentGreen :int)
  (transparentBlue :int)
  (transparentAlpha :int)
  (transparentIndex :int)
  (visualCaveat :int)
  (associatedVisualId :int)
  (screen :int)
  (drawableType :int)
  (renderType :int)
  (maxPbufferWidth :int)
  (maxPbufferHeight :int)
  (maxPbufferPixels :int)
  (optimalPbufferWidth :int)
  (optimalPbufferHeight :int)
  (visualSelectGroup :int)
  (id :unsigned-int)
  (rgbMode :pointer)
  (colorIndexMode :pointer)
  (doubleBufferMode :pointer)
  (stereoMode :pointer)
  (haveAccumBuffer :pointer)
  (haveDepthBuffer :pointer)
  (haveStencilBuffer :pointer)
  (accumRedBits :pointer)
  (accumGreenBits :pointer)
  (accumBlueBits :pointer)
  (accumAlphaBits :pointer)
  (depthBits :pointer)
  (stencilBits :pointer)
  (indexBits :pointer)
  (redBits :pointer)
  (greenBits :pointer)
  (blueBits :pointer)
  (alphaBits :pointer)
  (redMask :pointer)
  (greenMask :pointer)
  (blueMask :pointer)
  (alphaMask :pointer)
  (multiSampleSize :pointer)
  (nMultiSampleBuffers :pointer)
  (maxAuxBuffers :pointer)
  (level :pointer)
  (extendedRange :pointer)
  (minRed :pointer)
  (maxRed :pointer)
  (minGreen :pointer)
  (maxGreen :pointer)
  (minBlue :pointer)
  (maxBlue :pointer)
  (minAlpha :pointer)
  (maxAlpha :pointer))

(alexandria:define-constant __GLX_TOTAL_FBCONFIG_PROPS 35)
