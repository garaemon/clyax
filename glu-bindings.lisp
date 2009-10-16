;;================================================
;; glu-bindings.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================
(declaim (optimize (debug 3)
                   (safety 3)))


(in-package :glu)


(alexandria:define-constant GLU_EXT_object_space_tess 1)

(alexandria:define-constant GLU_EXT_nurbs_tessellator 1)

(alexandria:define-constant GLU_FALSE 0)

(alexandria:define-constant GLU_TRUE 1)

(alexandria:define-constant GLU_VERSION_1_1 1)

(alexandria:define-constant GLU_VERSION_1_2 1)

(alexandria:define-constant GLU_VERSION_1_3 1)

(alexandria:define-constant GLU_VERSION 100800)

(alexandria:define-constant GLU_EXTENSIONS 100801)

(alexandria:define-constant GLU_INVALID_ENUM 100900)

(alexandria:define-constant GLU_INVALID_VALUE 100901)

(alexandria:define-constant GLU_OUT_OF_MEMORY 100902)

(alexandria:define-constant GLU_INCOMPATIBLE_GL_VERSION 100903)

(alexandria:define-constant GLU_INVALID_OPERATION 100904)

(alexandria:define-constant GLU_OUTLINE_POLYGON 100240)

(alexandria:define-constant GLU_OUTLINE_PATCH 100241)

(alexandria:define-constant GLU_NURBS_ERROR 100103)

(alexandria:define-constant GLU_ERROR 100103)

(alexandria:define-constant GLU_NURBS_BEGIN 100164)

(alexandria:define-constant GLU_NURBS_BEGIN_EXT 100164)

(alexandria:define-constant GLU_NURBS_VERTEX 100165)

(alexandria:define-constant GLU_NURBS_VERTEX_EXT 100165)

(alexandria:define-constant GLU_NURBS_NORMAL 100166)

(alexandria:define-constant GLU_NURBS_NORMAL_EXT 100166)

(alexandria:define-constant GLU_NURBS_COLOR 100167)

(alexandria:define-constant GLU_NURBS_COLOR_EXT 100167)

(alexandria:define-constant GLU_NURBS_TEXTURE_COORD 100168)

(alexandria:define-constant GLU_NURBS_TEX_COORD_EXT 100168)

(alexandria:define-constant GLU_NURBS_END 100169)

(alexandria:define-constant GLU_NURBS_END_EXT 100169)

(alexandria:define-constant GLU_NURBS_BEGIN_DATA 100170)

(alexandria:define-constant GLU_NURBS_BEGIN_DATA_EXT 100170)

(alexandria:define-constant GLU_NURBS_VERTEX_DATA 100171)

(alexandria:define-constant GLU_NURBS_VERTEX_DATA_EXT 100171)

(alexandria:define-constant GLU_NURBS_NORMAL_DATA 100172)

(alexandria:define-constant GLU_NURBS_NORMAL_DATA_EXT 100172)

(alexandria:define-constant GLU_NURBS_COLOR_DATA 100173)

(alexandria:define-constant GLU_NURBS_COLOR_DATA_EXT 100173)

(alexandria:define-constant GLU_NURBS_TEXTURE_COORD_DATA 100174)

(alexandria:define-constant GLU_NURBS_TEX_COORD_DATA_EXT 100174)

(alexandria:define-constant GLU_NURBS_END_DATA 100175)

(alexandria:define-constant GLU_NURBS_END_DATA_EXT 100175)

(alexandria:define-constant GLU_NURBS_ERROR1 100251)

(alexandria:define-constant GLU_NURBS_ERROR2 100252)

(alexandria:define-constant GLU_NURBS_ERROR3 100253)

(alexandria:define-constant GLU_NURBS_ERROR4 100254)

(alexandria:define-constant GLU_NURBS_ERROR5 100255)

(alexandria:define-constant GLU_NURBS_ERROR6 100256)

(alexandria:define-constant GLU_NURBS_ERROR7 100257)

(alexandria:define-constant GLU_NURBS_ERROR8 100258)

(alexandria:define-constant GLU_NURBS_ERROR9 100259)

(alexandria:define-constant GLU_NURBS_ERROR10 100260)

(alexandria:define-constant GLU_NURBS_ERROR11 100261)

(alexandria:define-constant GLU_NURBS_ERROR12 100262)

(alexandria:define-constant GLU_NURBS_ERROR13 100263)

(alexandria:define-constant GLU_NURBS_ERROR14 100264)

(alexandria:define-constant GLU_NURBS_ERROR15 100265)

(alexandria:define-constant GLU_NURBS_ERROR16 100266)

(alexandria:define-constant GLU_NURBS_ERROR17 100267)

(alexandria:define-constant GLU_NURBS_ERROR18 100268)

(alexandria:define-constant GLU_NURBS_ERROR19 100269)

(alexandria:define-constant GLU_NURBS_ERROR20 100270)

(alexandria:define-constant GLU_NURBS_ERROR21 100271)

(alexandria:define-constant GLU_NURBS_ERROR22 100272)

(alexandria:define-constant GLU_NURBS_ERROR23 100273)

(alexandria:define-constant GLU_NURBS_ERROR24 100274)

(alexandria:define-constant GLU_NURBS_ERROR25 100275)

(alexandria:define-constant GLU_NURBS_ERROR26 100276)

(alexandria:define-constant GLU_NURBS_ERROR27 100277)

(alexandria:define-constant GLU_NURBS_ERROR28 100278)

(alexandria:define-constant GLU_NURBS_ERROR29 100279)

(alexandria:define-constant GLU_NURBS_ERROR30 100280)

(alexandria:define-constant GLU_NURBS_ERROR31 100281)

(alexandria:define-constant GLU_NURBS_ERROR32 100282)

(alexandria:define-constant GLU_NURBS_ERROR33 100283)

(alexandria:define-constant GLU_NURBS_ERROR34 100284)

(alexandria:define-constant GLU_NURBS_ERROR35 100285)

(alexandria:define-constant GLU_NURBS_ERROR36 100286)

(alexandria:define-constant GLU_NURBS_ERROR37 100287)

(alexandria:define-constant GLU_AUTO_LOAD_MATRIX 100200)

(alexandria:define-constant GLU_CULLING 100201)

(alexandria:define-constant GLU_SAMPLING_TOLERANCE 100203)

(alexandria:define-constant GLU_DISPLAY_MODE 100204)

(alexandria:define-constant GLU_PARAMETRIC_TOLERANCE 100202)

(alexandria:define-constant GLU_SAMPLING_METHOD 100205)

(alexandria:define-constant GLU_U_STEP 100206)

(alexandria:define-constant GLU_V_STEP 100207)

(alexandria:define-constant GLU_NURBS_MODE 100160)

(alexandria:define-constant GLU_NURBS_MODE_EXT 100160)

(alexandria:define-constant GLU_NURBS_TESSELLATOR 100161)

(alexandria:define-constant GLU_NURBS_TESSELLATOR_EXT 100161)

(alexandria:define-constant GLU_NURBS_RENDERER 100162)

(alexandria:define-constant GLU_NURBS_RENDERER_EXT 100162)

(alexandria:define-constant GLU_OBJECT_PARAMETRIC_ERROR 100208)

(alexandria:define-constant GLU_OBJECT_PARAMETRIC_ERROR_EXT 100208)

(alexandria:define-constant GLU_OBJECT_PATH_LENGTH 100209)

(alexandria:define-constant GLU_OBJECT_PATH_LENGTH_EXT 100209)

(alexandria:define-constant GLU_PATH_LENGTH 100215)

(alexandria:define-constant GLU_PARAMETRIC_ERROR 100216)

(alexandria:define-constant GLU_DOMAIN_DISTANCE 100217)

(alexandria:define-constant GLU_MAP1_TRIM_2 100210)

(alexandria:define-constant GLU_MAP1_TRIM_3 100211)

(alexandria:define-constant GLU_POINT 100010)

(alexandria:define-constant GLU_LINE 100011)

(alexandria:define-constant GLU_FILL 100012)

(alexandria:define-constant GLU_SILHOUETTE 100013)

(alexandria:define-constant GLU_SMOOTH 100000)

(alexandria:define-constant GLU_FLAT 100001)

(alexandria:define-constant GLU_NONE 100002)

(alexandria:define-constant GLU_OUTSIDE 100020)

(alexandria:define-constant GLU_INSIDE 100021)

(alexandria:define-constant GLU_TESS_BEGIN 100100)

(alexandria:define-constant GLU_BEGIN 100100)

(alexandria:define-constant GLU_TESS_VERTEX 100101)

(alexandria:define-constant GLU_VERTEX 100101)

(alexandria:define-constant GLU_TESS_END 100102)

(alexandria:define-constant GLU_END 100102)

(alexandria:define-constant GLU_TESS_ERROR 100103)

(alexandria:define-constant GLU_TESS_EDGE_FLAG 100104)

(alexandria:define-constant GLU_EDGE_FLAG 100104)

(alexandria:define-constant GLU_TESS_COMBINE 100105)

(alexandria:define-constant GLU_TESS_BEGIN_DATA 100106)

(alexandria:define-constant GLU_TESS_VERTEX_DATA 100107)

(alexandria:define-constant GLU_TESS_END_DATA 100108)

(alexandria:define-constant GLU_TESS_ERROR_DATA 100109)

(alexandria:define-constant GLU_TESS_EDGE_FLAG_DATA 100110)

(alexandria:define-constant GLU_TESS_COMBINE_DATA 100111)

(alexandria:define-constant GLU_CW 100120)

(alexandria:define-constant GLU_CCW 100121)

(alexandria:define-constant GLU_INTERIOR 100122)

(alexandria:define-constant GLU_EXTERIOR 100123)

(alexandria:define-constant GLU_UNKNOWN 100124)

(alexandria:define-constant GLU_TESS_WINDING_RULE 100140)

(alexandria:define-constant GLU_TESS_BOUNDARY_ONLY 100141)

(alexandria:define-constant GLU_TESS_TOLERANCE 100142)

(alexandria:define-constant GLU_TESS_ERROR1 100151)

(alexandria:define-constant GLU_TESS_ERROR2 100152)

(alexandria:define-constant GLU_TESS_ERROR3 100153)

(alexandria:define-constant GLU_TESS_ERROR4 100154)

(alexandria:define-constant GLU_TESS_ERROR5 100155)

(alexandria:define-constant GLU_TESS_ERROR6 100156)

(alexandria:define-constant GLU_TESS_ERROR7 100157)

(alexandria:define-constant GLU_TESS_ERROR8 100158)

(alexandria:define-constant GLU_TESS_MISSING_BEGIN_POLYGON 100151)

(alexandria:define-constant GLU_TESS_MISSING_BEGIN_CONTOUR 100152)

(alexandria:define-constant GLU_TESS_MISSING_END_POLYGON 100153)

(alexandria:define-constant GLU_TESS_MISSING_END_CONTOUR 100154)

(alexandria:define-constant GLU_TESS_COORD_TOO_LARGE 100155)

(alexandria:define-constant GLU_TESS_NEED_COMBINE_CALLBACK 100156)

(alexandria:define-constant GLU_TESS_WINDING_ODD 100130)

(alexandria:define-constant GLU_TESS_WINDING_NONZERO 100131)

(alexandria:define-constant GLU_TESS_WINDING_POSITIVE 100132)

(alexandria:define-constant GLU_TESS_WINDING_NEGATIVE 100133)

(alexandria:define-constant GLU_TESS_WINDING_ABS_GEQ_TWO 100134)

(alexandria:define-constant GLU_TESS_MAX_COORD 1.0d150)

(cffi:defcfun ("gluBeginCurve" gluBeginCurve) :void
  (nurb :pointer))

(cffi:defcfun ("gluBeginPolygon" gluBeginPolygon) :void
  (tess :pointer))

(cffi:defcfun ("gluBeginSurface" gluBeginSurface) :void
  (nurb :pointer))

(cffi:defcfun ("gluBeginTrim" gluBeginTrim) :void
  (nurb :pointer))

(cffi:defcfun ("gluBuild1DMipmapLevels" gluBuild1DMipmapLevels) :pointer
  (target :pointer)
  (internalFormat :pointer)
  (width :pointer)
  (format :pointer)
  (type :pointer)
  (level :pointer)
  (base :pointer)
  (max :pointer)
  (data :pointer))

(cffi:defcfun ("gluBuild1DMipmaps" gluBuild1DMipmaps) :pointer
  (target :pointer)
  (internalFormat :pointer)
  (width :pointer)
  (format :pointer)
  (type :pointer)
  (data :pointer))

(cffi:defcfun ("gluBuild2DMipmapLevels" gluBuild2DMipmapLevels) :pointer
  (target :pointer)
  (internalFormat :pointer)
  (width :pointer)
  (height :pointer)
  (format :pointer)
  (type :pointer)
  (level :pointer)
  (base :pointer)
  (max :pointer)
  (data :pointer))

(cffi:defcfun ("gluBuild2DMipmaps" gluBuild2DMipmaps) :pointer
  (target :pointer)
  (internalFormat :pointer)
  (width :pointer)
  (height :pointer)
  (format :pointer)
  (type :pointer)
  (data :pointer))

(cffi:defcfun ("gluBuild3DMipmapLevels" gluBuild3DMipmapLevels) :pointer
  (target :pointer)
  (internalFormat :pointer)
  (width :pointer)
  (height :pointer)
  (depth :pointer)
  (format :pointer)
  (type :pointer)
  (level :pointer)
  (base :pointer)
  (max :pointer)
  (data :pointer))

(cffi:defcfun ("gluBuild3DMipmaps" gluBuild3DMipmaps) :pointer
  (target :pointer)
  (internalFormat :pointer)
  (width :pointer)
  (height :pointer)
  (depth :pointer)
  (format :pointer)
  (type :pointer)
  (data :pointer))

(cffi:defcfun ("gluCheckExtension" gluCheckExtension) :pointer
  (extName :pointer)
  (extString :pointer))

(cffi:defcfun ("gluCylinder" gluCylinder) :void
  (quad :pointer)
  (base :pointer)
  (top :pointer)
  (height :pointer)
  (slices :pointer)
  (stacks :pointer))

(cffi:defcfun ("gluDeleteNurbsRenderer" gluDeleteNurbsRenderer) :void
  (nurb :pointer))

(cffi:defcfun ("gluDeleteQuadric" gluDeleteQuadric) :void
  (quad :pointer))

(cffi:defcfun ("gluDeleteTess" gluDeleteTess) :void
  (tess :pointer))

(cffi:defcfun ("gluDisk" gluDisk) :void
  (quad :pointer)
  (inner :pointer)
  (outer :pointer)
  (slices :pointer)
  (loops :pointer))

(cffi:defcfun ("gluEndCurve" gluEndCurve) :void
  (nurb :pointer))

(cffi:defcfun ("gluEndPolygon" gluEndPolygon) :void
  (tess :pointer))

(cffi:defcfun ("gluEndSurface" gluEndSurface) :void
  (nurb :pointer))

(cffi:defcfun ("gluEndTrim" gluEndTrim) :void
  (nurb :pointer))

(cffi:defcfun ("gluErrorString" gluErrorString) :pointer
  (error :pointer))

(cffi:defcfun ("gluGetNurbsProperty" gluGetNurbsProperty) :void
  (nurb :pointer)
  (property :pointer)
  (data :pointer))

(cffi:defcfun ("gluGetString" gluGetString) :pointer
  (name :pointer))

(cffi:defcfun ("gluGetTessProperty" gluGetTessProperty) :void
  (tess :pointer)
  (which :pointer)
  (data :pointer))

(cffi:defcfun ("gluLoadSamplingMatrices" gluLoadSamplingMatrices) :void
  (nurb :pointer)
  (model :pointer)
  (perspective :pointer)
  (view :pointer))

(cffi:defcfun ("gluLookAt" gluLookAt) :void
  (eyeX :double)
  (eyeY :double)
  (eyeZ :double)
  (centerX :double)
  (centerY :double)
  (centerZ :double)
  (upX :double)
  (upY :double)
  (upZ :double))

(cffi:defcfun ("gluNewNurbsRenderer" gluNewNurbsRenderer) :pointer)

(cffi:defcfun ("gluNewQuadric" gluNewQuadric) :pointer)

(cffi:defcfun ("gluNewTess" gluNewTess) :pointer)

(cffi:defcfun ("gluNextContour" gluNextContour) :void
  (tess :pointer)
  (type :pointer))

(cffi:defcfun ("gluNurbsCallback" gluNurbsCallback) :void
  (nurb :pointer)
  (which :pointer)
  (CallBackFunc :pointer))

(cffi:defcfun ("gluNurbsCallbackData" gluNurbsCallbackData) :void
  (nurb :pointer)
  (userData :pointer))

(cffi:defcfun ("gluNurbsCallbackDataEXT" gluNurbsCallbackDataEXT) :void
  (nurb :pointer)
  (userData :pointer))

(cffi:defcfun ("gluNurbsCurve" gluNurbsCurve) :void
  (nurb :pointer)
  (knotCount :pointer)
  (knots :pointer)
  (stride :pointer)
  (control :pointer)
  (order :pointer)
  (type :pointer))

(cffi:defcfun ("gluNurbsProperty" gluNurbsProperty) :void
  (nurb :pointer)
  (property :pointer)
  (value :pointer))

(cffi:defcfun ("gluNurbsSurface" gluNurbsSurface) :void
  (nurb :pointer)
  (sKnotCount :pointer)
  (sKnots :pointer)
  (tKnotCount :pointer)
  (tKnots :pointer)
  (sStride :pointer)
  (tStride :pointer)
  (control :pointer)
  (sOrder :pointer)
  (tOrder :pointer)
  (type :pointer))

(cffi:defcfun ("gluOrtho2D" gluOrtho2D) :void
  (left :pointer)
  (right :pointer)
  (bottom :pointer)
  (top :pointer))

(cffi:defcfun ("gluPartialDisk" gluPartialDisk) :void
  (quad :pointer)
  (inner :pointer)
  (outer :pointer)
  (slices :pointer)
  (loops :pointer)
  (start :pointer)
  (sweep :pointer))

(cffi:defcfun ("gluPerspective" gluPerspective) :void
  (fovy :double)
  (aspect :double)
  (zNear :double)
  (zFar :double))

(cffi:defcfun ("gluPickMatrix" gluPickMatrix) :void
  (x :pointer)
  (y :pointer)
  (delX :pointer)
  (delY :pointer)
  (viewport :pointer))

(cffi:defcfun ("gluProject" gluProject) :pointer
  (objX :pointer)
  (objY :pointer)
  (objZ :pointer)
  (model :pointer)
  (proj :pointer)
  (view :pointer)
  (winX :pointer)
  (winY :pointer)
  (winZ :pointer))

(cffi:defcfun ("gluPwlCurve" gluPwlCurve) :void
  (nurb :pointer)
  (count :pointer)
  (data :pointer)
  (stride :pointer)
  (type :pointer))

(cffi:defcfun ("gluQuadricCallback" gluQuadricCallback) :void
  (quad :pointer)
  (which :pointer)
  (CallBackFunc :pointer))

(cffi:defcfun ("gluQuadricDrawStyle" gluQuadricDrawStyle) :void
  (quad :pointer)
  (draw :pointer))

(cffi:defcfun ("gluQuadricNormals" gluQuadricNormals) :void
  (quad :pointer)
  (normal :pointer))

(cffi:defcfun ("gluQuadricOrientation" gluQuadricOrientation) :void
  (quad :pointer)
  (orientation :pointer))

(cffi:defcfun ("gluQuadricTexture" gluQuadricTexture) :void
  (quad :pointer)
  (texture :pointer))

(cffi:defcfun ("gluScaleImage" gluScaleImage) :pointer
  (format :pointer)
  (wIn :pointer)
  (hIn :pointer)
  (typeIn :pointer)
  (dataIn :pointer)
  (wOut :pointer)
  (hOut :pointer)
  (typeOut :pointer)
  (dataOut :pointer))

(cffi:defcfun ("gluSphere" gluSphere) :void
  (quad :pointer)
  (radius :pointer)
  (slices :pointer)
  (stacks :pointer))

(cffi:defcfun ("gluTessBeginContour" gluTessBeginContour) :void
  (tess :pointer))

(cffi:defcfun ("gluTessBeginPolygon" gluTessBeginPolygon) :void
  (tess :pointer)
  (data :pointer))

(cffi:defcfun ("gluTessCallback" gluTessCallback) :void
  (tess :pointer)
  (which :pointer)
  (CallBackFunc :pointer))

(cffi:defcfun ("gluTessEndContour" gluTessEndContour) :void
  (tess :pointer))

(cffi:defcfun ("gluTessEndPolygon" gluTessEndPolygon) :void
  (tess :pointer))

(cffi:defcfun ("gluTessNormal" gluTessNormal) :void
  (tess :pointer)
  (valueX :pointer)
  (valueY :pointer)
  (valueZ :pointer))

(cffi:defcfun ("gluTessProperty" gluTessProperty) :void
  (tess :pointer)
  (which :pointer)
  (data :pointer))

(cffi:defcfun ("gluTessVertex" gluTessVertex) :void
  (tess :pointer)
  (location :pointer)
  (data :pointer))

(cffi:defcfun ("gluUnProject" gluUnProject) :pointer
  (winX :pointer)
  (winY :pointer)
  (winZ :pointer)
  (model :pointer)
  (proj :pointer)
  (view :pointer)
  (objX :pointer)
  (objY :pointer)
  (objZ :pointer))

(cffi:defcfun ("gluUnProject4" gluUnProject4) :pointer
  (winX :pointer)
  (winY :pointer)
  (winZ :pointer)
  (clipW :pointer)
  (model :pointer)
  (proj :pointer)
  (view :pointer)
  (nearVal :pointer)
  (farVal :pointer)
  (objX :pointer)
  (objY :pointer)
  (objZ :pointer)
  (objW :pointer))
