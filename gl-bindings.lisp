;;================================================
;; gl-bindings.lisp
;;
;; written by R.Ueda (garaemon)
;;================================================
(declaim (optimize (debug 3)
                   (safety 3)))

#|
(defmacro alexandria:define-constant (a dummy)
  (let ((constant-name (string a)))
    (let ((lisp-symbol-name
           (string-downcase
            (format nil "+~A+"
                    (cl-ppcre:regex-replace "GL_" constant-name "")))))
      (format t "(alexandria:define-constant ~A ~A)~%" lisp-symbol-name constant-name)
      )))
|#

(in-package :gl)


(alexandria:define-constant GL_VERSION_1_1 1)

(alexandria:define-constant GL_VERSION_1_2 1)

(alexandria:define-constant GL_VERSION_1_3 1)

(alexandria:define-constant GL_VERSION_1_4 1)

(alexandria:define-constant GL_VERSION_1_5 1)

(alexandria:define-constant GL_VERSION_2_0 1)

(alexandria:define-constant GL_VERSION_2_1 1)

(alexandria:define-constant GL_ACCUM #x0100)

(alexandria:define-constant GL_LOAD #x0101)

(alexandria:define-constant GL_RETURN #x0102)

(alexandria:define-constant GL_MULT #x0103)

(alexandria:define-constant GL_ADD #x0104)

(alexandria:define-constant GL_NEVER #x0200)

(alexandria:define-constant GL_LESS #x0201)

(alexandria:define-constant GL_EQUAL #x0202)

(alexandria:define-constant GL_LEQUAL #x0203)

(alexandria:define-constant GL_GREATER #x0204)

(alexandria:define-constant GL_NOTEQUAL #x0205)

(alexandria:define-constant GL_GEQUAL #x0206)

(alexandria:define-constant GL_ALWAYS #x0207)

(alexandria:define-constant GL_CURRENT_BIT #x00000001)

(alexandria:define-constant GL_POINT_BIT #x00000002)

(alexandria:define-constant GL_LINE_BIT #x00000004)

(alexandria:define-constant GL_POLYGON_BIT #x00000008)

(alexandria:define-constant GL_POLYGON_STIPPLE_BIT #x00000010)

(alexandria:define-constant GL_PIXEL_MODE_BIT #x00000020)

(alexandria:define-constant GL_LIGHTING_BIT #x00000040)

(alexandria:define-constant GL_FOG_BIT #x00000080)

(alexandria:define-constant GL_DEPTH_BUFFER_BIT #x00000100)

(alexandria:define-constant GL_ACCUM_BUFFER_BIT #x00000200)

(alexandria:define-constant GL_STENCIL_BUFFER_BIT #x00000400)

(alexandria:define-constant GL_VIEWPORT_BIT #x00000800)

(alexandria:define-constant GL_TRANSFORM_BIT #x00001000)

(alexandria:define-constant GL_ENABLE_BIT #x00002000)

(alexandria:define-constant GL_COLOR_BUFFER_BIT #x00004000)

(alexandria:define-constant GL_HINT_BIT #x00008000)

(alexandria:define-constant GL_EVAL_BIT #x00010000)

(alexandria:define-constant GL_LIST_BIT #x00020000)

(alexandria:define-constant GL_TEXTURE_BIT #x00040000)

(alexandria:define-constant GL_SCISSOR_BIT #x00080000)

(alexandria:define-constant GL_ALL_ATTRIB_BITS #x000fffff)

(alexandria:define-constant GL_POINTS #x0000)

(alexandria:define-constant GL_LINES #x0001)

(alexandria:define-constant GL_LINE_LOOP #x0002)

(alexandria:define-constant GL_LINE_STRIP #x0003)

(alexandria:define-constant GL_TRIANGLES #x0004)

(alexandria:define-constant GL_TRIANGLE_STRIP #x0005)

(alexandria:define-constant GL_TRIANGLE_FAN #x0006)

(alexandria:define-constant GL_QUADS #x0007)

(alexandria:define-constant GL_QUAD_STRIP #x0008)

(alexandria:define-constant GL_POLYGON #x0009)

(alexandria:define-constant GL_ZERO 0)

(alexandria:define-constant GL_ONE 1)

(alexandria:define-constant GL_SRC_COLOR #x0300)

(alexandria:define-constant GL_ONE_MINUS_SRC_COLOR #x0301)

(alexandria:define-constant GL_SRC_ALPHA #x0302)

(alexandria:define-constant GL_ONE_MINUS_SRC_ALPHA #x0303)

(alexandria:define-constant GL_DST_ALPHA #x0304)

(alexandria:define-constant GL_ONE_MINUS_DST_ALPHA #x0305)

(alexandria:define-constant GL_DST_COLOR #x0306)

(alexandria:define-constant GL_ONE_MINUS_DST_COLOR #x0307)

(alexandria:define-constant GL_SRC_ALPHA_SATURATE #x0308)

(alexandria:define-constant GL_TRUE 1)

(alexandria:define-constant GL_FALSE 0)

(alexandria:define-constant GL_CLIP_PLANE0 #x3000)

(alexandria:define-constant GL_CLIP_PLANE1 #x3001)

(alexandria:define-constant GL_CLIP_PLANE2 #x3002)

(alexandria:define-constant GL_CLIP_PLANE3 #x3003)

(alexandria:define-constant GL_CLIP_PLANE4 #x3004)

(alexandria:define-constant GL_CLIP_PLANE5 #x3005)

(alexandria:define-constant GL_BYTE #x1400)

(alexandria:define-constant GL_UNSIGNED_BYTE #x1401)

(alexandria:define-constant GL_SHORT #x1402)

(alexandria:define-constant GL_UNSIGNED_SHORT #x1403)

(alexandria:define-constant GL_INT #x1404)

(alexandria:define-constant GL_UNSIGNED_INT #x1405)

(alexandria:define-constant GL_FLOAT #x1406)

(alexandria:define-constant GL_2_BYTES #x1407)

(alexandria:define-constant GL_3_BYTES #x1408)

(alexandria:define-constant GL_4_BYTES #x1409)

(alexandria:define-constant GL_DOUBLE #x140A)

(alexandria:define-constant GL_NONE 0)

(alexandria:define-constant GL_FRONT_LEFT #x0400)

(alexandria:define-constant GL_FRONT_RIGHT #x0401)

(alexandria:define-constant GL_BACK_LEFT #x0402)

(alexandria:define-constant GL_BACK_RIGHT #x0403)

(alexandria:define-constant GL_FRONT #x0404)

(alexandria:define-constant GL_BACK #x0405)

(alexandria:define-constant GL_LEFT #x0406)

(alexandria:define-constant GL_RIGHT #x0407)

(alexandria:define-constant GL_FRONT_AND_BACK #x0408)

(alexandria:define-constant GL_AUX0 #x0409)

(alexandria:define-constant GL_AUX1 #x040A)

(alexandria:define-constant GL_AUX2 #x040B)

(alexandria:define-constant GL_AUX3 #x040C)

(alexandria:define-constant GL_NO_ERROR 0)

(alexandria:define-constant GL_INVALID_ENUM #x0500)

(alexandria:define-constant GL_INVALID_VALUE #x0501)

(alexandria:define-constant GL_INVALID_OPERATION #x0502)

(alexandria:define-constant GL_STACK_OVERFLOW #x0503)

(alexandria:define-constant GL_STACK_UNDERFLOW #x0504)

(alexandria:define-constant GL_OUT_OF_MEMORY #x0505)

(alexandria:define-constant GL_2D #x0600)

(alexandria:define-constant GL_3D #x0601)

(alexandria:define-constant GL_3D_COLOR #x0602)

(alexandria:define-constant GL_3D_COLOR_TEXTURE #x0603)

(alexandria:define-constant GL_4D_COLOR_TEXTURE #x0604)

(alexandria:define-constant GL_PASS_THROUGH_TOKEN #x0700)

(alexandria:define-constant GL_POINT_TOKEN #x0701)

(alexandria:define-constant GL_LINE_TOKEN #x0702)

(alexandria:define-constant GL_POLYGON_TOKEN #x0703)

(alexandria:define-constant GL_BITMAP_TOKEN #x0704)

(alexandria:define-constant GL_DRAW_PIXEL_TOKEN #x0705)

(alexandria:define-constant GL_COPY_PIXEL_TOKEN #x0706)

(alexandria:define-constant GL_LINE_RESET_TOKEN #x0707)

(alexandria:define-constant GL_EXP #x0800)

(alexandria:define-constant GL_EXP2 #x0801)

(alexandria:define-constant GL_CW #x0900)

(alexandria:define-constant GL_CCW #x0901)

(alexandria:define-constant GL_COEFF #x0A00)

(alexandria:define-constant GL_ORDER #x0A01)

(alexandria:define-constant GL_DOMAIN #x0A02)

(alexandria:define-constant GL_CURRENT_COLOR #x0B00)

(alexandria:define-constant GL_CURRENT_INDEX #x0B01)

(alexandria:define-constant GL_CURRENT_NORMAL #x0B02)

(alexandria:define-constant GL_CURRENT_TEXTURE_COORDS #x0B03)

(alexandria:define-constant GL_CURRENT_RASTER_COLOR #x0B04)

(alexandria:define-constant GL_CURRENT_RASTER_INDEX #x0B05)

(alexandria:define-constant GL_CURRENT_RASTER_TEXTURE_COORDS #x0B06)

(alexandria:define-constant GL_CURRENT_RASTER_POSITION #x0B07)

(alexandria:define-constant GL_CURRENT_RASTER_POSITION_VALID #x0B08)

(alexandria:define-constant GL_CURRENT_RASTER_DISTANCE #x0B09)

(alexandria:define-constant GL_POINT_SMOOTH #x0B10)

(alexandria:define-constant GL_POINT_SIZE #x0B11)

(alexandria:define-constant GL_POINT_SIZE_RANGE #x0B12)

(alexandria:define-constant GL_POINT_SIZE_GRANULARITY #x0B13)

(alexandria:define-constant GL_LINE_SMOOTH #x0B20)

(alexandria:define-constant GL_LINE_WIDTH #x0B21)

(alexandria:define-constant GL_LINE_WIDTH_RANGE #x0B22)

(alexandria:define-constant GL_LINE_WIDTH_GRANULARITY #x0B23)

(alexandria:define-constant GL_LINE_STIPPLE #x0B24)

(alexandria:define-constant GL_LINE_STIPPLE_PATTERN #x0B25)

(alexandria:define-constant GL_LINE_STIPPLE_REPEAT #x0B26)

(alexandria:define-constant GL_LIST_MODE #x0B30)

(alexandria:define-constant GL_MAX_LIST_NESTING #x0B31)

(alexandria:define-constant GL_LIST_BASE #x0B32)

(alexandria:define-constant GL_LIST_INDEX #x0B33)

(alexandria:define-constant GL_POLYGON_MODE #x0B40)

(alexandria:define-constant GL_POLYGON_SMOOTH #x0B41)

(alexandria:define-constant GL_POLYGON_STIPPLE #x0B42)

(alexandria:define-constant GL_EDGE_FLAG #x0B43)

(alexandria:define-constant GL_CULL_FACE #x0B44)

(alexandria:define-constant GL_CULL_FACE_MODE #x0B45)

(alexandria:define-constant GL_FRONT_FACE #x0B46)

(alexandria:define-constant GL_LIGHTING #x0B50)

(alexandria:define-constant GL_LIGHT_MODEL_LOCAL_VIEWER #x0B51)

(alexandria:define-constant GL_LIGHT_MODEL_TWO_SIDE #x0B52)

(alexandria:define-constant GL_LIGHT_MODEL_AMBIENT #x0B53)

(alexandria:define-constant GL_SHADE_MODEL #x0B54)

(alexandria:define-constant GL_COLOR_MATERIAL_FACE #x0B55)

(alexandria:define-constant GL_COLOR_MATERIAL_PARAMETER #x0B56)

(alexandria:define-constant GL_COLOR_MATERIAL #x0B57)

(alexandria:define-constant GL_FOG #x0B60)

(alexandria:define-constant GL_FOG_INDEX #x0B61)

(alexandria:define-constant GL_FOG_DENSITY #x0B62)

(alexandria:define-constant GL_FOG_START #x0B63)

(alexandria:define-constant GL_FOG_END #x0B64)

(alexandria:define-constant GL_FOG_MODE #x0B65)

(alexandria:define-constant GL_FOG_COLOR #x0B66)

(alexandria:define-constant GL_DEPTH_RANGE #x0B70)

(alexandria:define-constant GL_DEPTH_TEST #x0B71)

(alexandria:define-constant GL_DEPTH_WRITEMASK #x0B72)

(alexandria:define-constant GL_DEPTH_CLEAR_VALUE #x0B73)

(alexandria:define-constant GL_DEPTH_FUNC #x0B74)

(alexandria:define-constant GL_ACCUM_CLEAR_VALUE #x0B80)

(alexandria:define-constant GL_STENCIL_TEST #x0B90)

(alexandria:define-constant GL_STENCIL_CLEAR_VALUE #x0B91)

(alexandria:define-constant GL_STENCIL_FUNC #x0B92)

(alexandria:define-constant GL_STENCIL_VALUE_MASK #x0B93)

(alexandria:define-constant GL_STENCIL_FAIL #x0B94)

(alexandria:define-constant GL_STENCIL_PASS_DEPTH_FAIL #x0B95)

(alexandria:define-constant GL_STENCIL_PASS_DEPTH_PASS #x0B96)

(alexandria:define-constant GL_STENCIL_REF #x0B97)

(alexandria:define-constant GL_STENCIL_WRITEMASK #x0B98)

(alexandria:define-constant GL_MATRIX_MODE #x0BA0)

(alexandria:define-constant GL_NORMALIZE #x0BA1)

(alexandria:define-constant GL_VIEWPORT #x0BA2)

(alexandria:define-constant GL_MODELVIEW_STACK_DEPTH #x0BA3)

(alexandria:define-constant GL_PROJECTION_STACK_DEPTH #x0BA4)

(alexandria:define-constant GL_TEXTURE_STACK_DEPTH #x0BA5)

(alexandria:define-constant GL_MODELVIEW_MATRIX #x0BA6)

(alexandria:define-constant GL_PROJECTION_MATRIX #x0BA7)

(alexandria:define-constant GL_TEXTURE_MATRIX #x0BA8)

(alexandria:define-constant GL_ATTRIB_STACK_DEPTH #x0BB0)

(alexandria:define-constant GL_CLIENT_ATTRIB_STACK_DEPTH #x0BB1)

(alexandria:define-constant GL_ALPHA_TEST #x0BC0)

(alexandria:define-constant GL_ALPHA_TEST_FUNC #x0BC1)

(alexandria:define-constant GL_ALPHA_TEST_REF #x0BC2)

(alexandria:define-constant GL_DITHER #x0BD0)

(alexandria:define-constant GL_BLEND_DST #x0BE0)

(alexandria:define-constant GL_BLEND_SRC #x0BE1)

(alexandria:define-constant GL_BLEND #x0BE2)

(alexandria:define-constant GL_LOGIC_OP_MODE #x0BF0)

(alexandria:define-constant GL_INDEX_LOGIC_OP #x0BF1)

(alexandria:define-constant GL_COLOR_LOGIC_OP #x0BF2)

(alexandria:define-constant GL_AUX_BUFFERS #x0C00)

(alexandria:define-constant GL_DRAW_BUFFER #x0C01)

(alexandria:define-constant GL_READ_BUFFER #x0C02)

(alexandria:define-constant GL_SCISSOR_BOX #x0C10)

(alexandria:define-constant GL_SCISSOR_TEST #x0C11)

(alexandria:define-constant GL_INDEX_CLEAR_VALUE #x0C20)

(alexandria:define-constant GL_INDEX_WRITEMASK #x0C21)

(alexandria:define-constant GL_COLOR_CLEAR_VALUE #x0C22)

(alexandria:define-constant GL_COLOR_WRITEMASK #x0C23)

(alexandria:define-constant GL_INDEX_MODE #x0C30)

(alexandria:define-constant GL_RGBA_MODE #x0C31)

(alexandria:define-constant GL_DOUBLEBUFFER #x0C32)

(alexandria:define-constant GL_STEREO #x0C33)

(alexandria:define-constant GL_RENDER_MODE #x0C40)

(alexandria:define-constant GL_PERSPECTIVE_CORRECTION_HINT #x0C50)

(alexandria:define-constant GL_POINT_SMOOTH_HINT #x0C51)

(alexandria:define-constant GL_LINE_SMOOTH_HINT #x0C52)

(alexandria:define-constant GL_POLYGON_SMOOTH_HINT #x0C53)

(alexandria:define-constant GL_FOG_HINT #x0C54)

(alexandria:define-constant GL_TEXTURE_GEN_S #x0C60)

(alexandria:define-constant GL_TEXTURE_GEN_T #x0C61)

(alexandria:define-constant GL_TEXTURE_GEN_R #x0C62)

(alexandria:define-constant GL_TEXTURE_GEN_Q #x0C63)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_I #x0C70)

(alexandria:define-constant GL_PIXEL_MAP_S_TO_S #x0C71)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_R #x0C72)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_G #x0C73)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_B #x0C74)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_A #x0C75)

(alexandria:define-constant GL_PIXEL_MAP_R_TO_R #x0C76)

(alexandria:define-constant GL_PIXEL_MAP_G_TO_G #x0C77)

(alexandria:define-constant GL_PIXEL_MAP_B_TO_B #x0C78)

(alexandria:define-constant GL_PIXEL_MAP_A_TO_A #x0C79)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_I_SIZE #x0CB0)

(alexandria:define-constant GL_PIXEL_MAP_S_TO_S_SIZE #x0CB1)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_R_SIZE #x0CB2)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_G_SIZE #x0CB3)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_B_SIZE #x0CB4)

(alexandria:define-constant GL_PIXEL_MAP_I_TO_A_SIZE #x0CB5)

(alexandria:define-constant GL_PIXEL_MAP_R_TO_R_SIZE #x0CB6)

(alexandria:define-constant GL_PIXEL_MAP_G_TO_G_SIZE #x0CB7)

(alexandria:define-constant GL_PIXEL_MAP_B_TO_B_SIZE #x0CB8)

(alexandria:define-constant GL_PIXEL_MAP_A_TO_A_SIZE #x0CB9)

(alexandria:define-constant GL_UNPACK_SWAP_BYTES #x0CF0)

(alexandria:define-constant GL_UNPACK_LSB_FIRST #x0CF1)

(alexandria:define-constant GL_UNPACK_ROW_LENGTH #x0CF2)

(alexandria:define-constant GL_UNPACK_SKIP_ROWS #x0CF3)

(alexandria:define-constant GL_UNPACK_SKIP_PIXELS #x0CF4)

(alexandria:define-constant GL_UNPACK_ALIGNMENT #x0CF5)

(alexandria:define-constant GL_PACK_SWAP_BYTES #x0D00)

(alexandria:define-constant GL_PACK_LSB_FIRST #x0D01)

(alexandria:define-constant GL_PACK_ROW_LENGTH #x0D02)

(alexandria:define-constant GL_PACK_SKIP_ROWS #x0D03)

(alexandria:define-constant GL_PACK_SKIP_PIXELS #x0D04)

(alexandria:define-constant GL_PACK_ALIGNMENT #x0D05)

(alexandria:define-constant GL_MAP_COLOR #x0D10)

(alexandria:define-constant GL_MAP_STENCIL #x0D11)

(alexandria:define-constant GL_INDEX_SHIFT #x0D12)

(alexandria:define-constant GL_INDEX_OFFSET #x0D13)

(alexandria:define-constant GL_RED_SCALE #x0D14)

(alexandria:define-constant GL_RED_BIAS #x0D15)

(alexandria:define-constant GL_ZOOM_X #x0D16)

(alexandria:define-constant GL_ZOOM_Y #x0D17)

(alexandria:define-constant GL_GREEN_SCALE #x0D18)

(alexandria:define-constant GL_GREEN_BIAS #x0D19)

(alexandria:define-constant GL_BLUE_SCALE #x0D1A)

(alexandria:define-constant GL_BLUE_BIAS #x0D1B)

(alexandria:define-constant GL_ALPHA_SCALE #x0D1C)

(alexandria:define-constant GL_ALPHA_BIAS #x0D1D)

(alexandria:define-constant GL_DEPTH_SCALE #x0D1E)

(alexandria:define-constant GL_DEPTH_BIAS #x0D1F)

(alexandria:define-constant GL_MAX_EVAL_ORDER #x0D30)

(alexandria:define-constant GL_MAX_LIGHTS #x0D31)

(alexandria:define-constant GL_MAX_CLIP_PLANES #x0D32)

(alexandria:define-constant GL_MAX_TEXTURE_SIZE #x0D33)

(alexandria:define-constant GL_MAX_PIXEL_MAP_TABLE #x0D34)

(alexandria:define-constant GL_MAX_ATTRIB_STACK_DEPTH #x0D35)

(alexandria:define-constant GL_MAX_MODELVIEW_STACK_DEPTH #x0D36)

(alexandria:define-constant GL_MAX_NAME_STACK_DEPTH #x0D37)

(alexandria:define-constant GL_MAX_PROJECTION_STACK_DEPTH #x0D38)

(alexandria:define-constant GL_MAX_TEXTURE_STACK_DEPTH #x0D39)

(alexandria:define-constant GL_MAX_VIEWPORT_DIMS #x0D3A)

(alexandria:define-constant GL_MAX_CLIENT_ATTRIB_STACK_DEPTH #x0D3B)

(alexandria:define-constant GL_SUBPIXEL_BITS #x0D50)

(alexandria:define-constant GL_INDEX_BITS #x0D51)

(alexandria:define-constant GL_RED_BITS #x0D52)

(alexandria:define-constant GL_GREEN_BITS #x0D53)

(alexandria:define-constant GL_BLUE_BITS #x0D54)

(alexandria:define-constant GL_ALPHA_BITS #x0D55)

(alexandria:define-constant GL_DEPTH_BITS #x0D56)

(alexandria:define-constant GL_STENCIL_BITS #x0D57)

(alexandria:define-constant GL_ACCUM_RED_BITS #x0D58)

(alexandria:define-constant GL_ACCUM_GREEN_BITS #x0D59)

(alexandria:define-constant GL_ACCUM_BLUE_BITS #x0D5A)

(alexandria:define-constant GL_ACCUM_ALPHA_BITS #x0D5B)

(alexandria:define-constant GL_NAME_STACK_DEPTH #x0D70)

(alexandria:define-constant GL_AUTO_NORMAL #x0D80)

(alexandria:define-constant GL_MAP1_COLOR_4 #x0D90)

(alexandria:define-constant GL_MAP1_INDEX #x0D91)

(alexandria:define-constant GL_MAP1_NORMAL #x0D92)

(alexandria:define-constant GL_MAP1_TEXTURE_COORD_1 #x0D93)

(alexandria:define-constant GL_MAP1_TEXTURE_COORD_2 #x0D94)

(alexandria:define-constant GL_MAP1_TEXTURE_COORD_3 #x0D95)

(alexandria:define-constant GL_MAP1_TEXTURE_COORD_4 #x0D96)

(alexandria:define-constant GL_MAP1_VERTEX_3 #x0D97)

(alexandria:define-constant GL_MAP1_VERTEX_4 #x0D98)

(alexandria:define-constant GL_MAP2_COLOR_4 #x0DB0)

(alexandria:define-constant GL_MAP2_INDEX #x0DB1)

(alexandria:define-constant GL_MAP2_NORMAL #x0DB2)

(alexandria:define-constant GL_MAP2_TEXTURE_COORD_1 #x0DB3)

(alexandria:define-constant GL_MAP2_TEXTURE_COORD_2 #x0DB4)

(alexandria:define-constant GL_MAP2_TEXTURE_COORD_3 #x0DB5)

(alexandria:define-constant GL_MAP2_TEXTURE_COORD_4 #x0DB6)

(alexandria:define-constant GL_MAP2_VERTEX_3 #x0DB7)

(alexandria:define-constant GL_MAP2_VERTEX_4 #x0DB8)

(alexandria:define-constant GL_MAP1_GRID_DOMAIN #x0DD0)

(alexandria:define-constant GL_MAP1_GRID_SEGMENTS #x0DD1)

(alexandria:define-constant GL_MAP2_GRID_DOMAIN #x0DD2)

(alexandria:define-constant GL_MAP2_GRID_SEGMENTS #x0DD3)

(alexandria:define-constant GL_TEXTURE_1D #x0DE0)

(alexandria:define-constant GL_TEXTURE_2D #x0DE1)

(alexandria:define-constant GL_FEEDBACK_BUFFER_POINTER #x0DF0)

(alexandria:define-constant GL_FEEDBACK_BUFFER_SIZE #x0DF1)

(alexandria:define-constant GL_FEEDBACK_BUFFER_TYPE #x0DF2)

(alexandria:define-constant GL_SELECTION_BUFFER_POINTER #x0DF3)

(alexandria:define-constant GL_SELECTION_BUFFER_SIZE #x0DF4)

(alexandria:define-constant GL_TEXTURE_WIDTH #x1000)

(alexandria:define-constant GL_TEXTURE_HEIGHT #x1001)

(alexandria:define-constant GL_TEXTURE_INTERNAL_FORMAT #x1003)

(alexandria:define-constant GL_TEXTURE_BORDER_COLOR #x1004)

(alexandria:define-constant GL_TEXTURE_BORDER #x1005)

(alexandria:define-constant GL_DONT_CARE #x1100)

(alexandria:define-constant GL_FASTEST #x1101)

(alexandria:define-constant GL_NICEST #x1102)

(alexandria:define-constant GL_LIGHT0 #x4000)

(alexandria:define-constant GL_LIGHT1 #x4001)

(alexandria:define-constant GL_LIGHT2 #x4002)

(alexandria:define-constant GL_LIGHT3 #x4003)

(alexandria:define-constant GL_LIGHT4 #x4004)

(alexandria:define-constant GL_LIGHT5 #x4005)

(alexandria:define-constant GL_LIGHT6 #x4006)

(alexandria:define-constant GL_LIGHT7 #x4007)

(alexandria:define-constant GL_AMBIENT #x1200)

(alexandria:define-constant GL_DIFFUSE #x1201)

(alexandria:define-constant GL_SPECULAR #x1202)

(alexandria:define-constant GL_POSITION #x1203)

(alexandria:define-constant GL_SPOT_DIRECTION #x1204)

(alexandria:define-constant GL_SPOT_EXPONENT #x1205)

(alexandria:define-constant GL_SPOT_CUTOFF #x1206)

(alexandria:define-constant GL_CONSTANT_ATTENUATION #x1207)

(alexandria:define-constant GL_LINEAR_ATTENUATION #x1208)

(alexandria:define-constant GL_QUADRATIC_ATTENUATION #x1209)

(alexandria:define-constant GL_COMPILE #x1300)

(alexandria:define-constant GL_COMPILE_AND_EXECUTE #x1301)

(alexandria:define-constant GL_CLEAR #x1500)

(alexandria:define-constant GL_AND #x1501)

(alexandria:define-constant GL_AND_REVERSE #x1502)

(alexandria:define-constant GL_COPY #x1503)

(alexandria:define-constant GL_AND_INVERTED #x1504)

(alexandria:define-constant GL_NOOP #x1505)

(alexandria:define-constant GL_XOR #x1506)

(alexandria:define-constant GL_OR #x1507)

(alexandria:define-constant GL_NOR #x1508)

(alexandria:define-constant GL_EQUIV #x1509)

(alexandria:define-constant GL_INVERT #x150A)

(alexandria:define-constant GL_OR_REVERSE #x150B)

(alexandria:define-constant GL_COPY_INVERTED #x150C)

(alexandria:define-constant GL_OR_INVERTED #x150D)

(alexandria:define-constant GL_NAND #x150E)

(alexandria:define-constant GL_SET #x150F)

(alexandria:define-constant GL_EMISSION #x1600)

(alexandria:define-constant GL_SHININESS #x1601)

(alexandria:define-constant GL_AMBIENT_AND_DIFFUSE #x1602)

(alexandria:define-constant GL_COLOR_INDEXES #x1603)

(alexandria:define-constant GL_MODELVIEW #x1700)

(alexandria:define-constant GL_PROJECTION #x1701)

(alexandria:define-constant GL_TEXTURE #x1702)

(alexandria:define-constant GL_COLOR #x1800)

(alexandria:define-constant GL_DEPTH #x1801)

(alexandria:define-constant GL_STENCIL #x1802)

(alexandria:define-constant GL_COLOR_INDEX #x1900)

(alexandria:define-constant GL_STENCIL_INDEX #x1901)

(alexandria:define-constant GL_DEPTH_COMPONENT #x1902)

(alexandria:define-constant GL_RED #x1903)

(alexandria:define-constant GL_GREEN #x1904)

(alexandria:define-constant GL_BLUE #x1905)

(alexandria:define-constant GL_ALPHA #x1906)

(alexandria:define-constant GL_RGB #x1907)

(alexandria:define-constant GL_RGBA #x1908)

(alexandria:define-constant GL_LUMINANCE #x1909)

(alexandria:define-constant GL_LUMINANCE_ALPHA #x190A)

(alexandria:define-constant GL_BITMAP #x1A00)

(alexandria:define-constant GL_POINT #x1B00)

(alexandria:define-constant GL_LINE #x1B01)

(alexandria:define-constant GL_FILL #x1B02)

(alexandria:define-constant GL_RENDER #x1C00)

(alexandria:define-constant GL_FEEDBACK #x1C01)

(alexandria:define-constant GL_SELECT #x1C02)

(alexandria:define-constant GL_FLAT #x1D00)

(alexandria:define-constant GL_SMOOTH #x1D01)

(alexandria:define-constant GL_KEEP #x1E00)

(alexandria:define-constant GL_REPLACE #x1E01)

(alexandria:define-constant GL_INCR #x1E02)

(alexandria:define-constant GL_DECR #x1E03)

(alexandria:define-constant GL_VENDOR #x1F00)

(alexandria:define-constant GL_RENDERER #x1F01)

(alexandria:define-constant GL_VERSION #x1F02)

(alexandria:define-constant GL_EXTENSIONS #x1F03)

(alexandria:define-constant GL_S #x2000)

(alexandria:define-constant GL_T #x2001)

(alexandria:define-constant GL_R #x2002)

(alexandria:define-constant GL_Q #x2003)

(alexandria:define-constant GL_MODULATE #x2100)

(alexandria:define-constant GL_DECAL #x2101)

(alexandria:define-constant GL_TEXTURE_ENV_MODE #x2200)

(alexandria:define-constant GL_TEXTURE_ENV_COLOR #x2201)

(alexandria:define-constant GL_TEXTURE_ENV #x2300)

(alexandria:define-constant GL_EYE_LINEAR #x2400)

(alexandria:define-constant GL_OBJECT_LINEAR #x2401)

(alexandria:define-constant GL_SPHERE_MAP #x2402)

(alexandria:define-constant GL_TEXTURE_GEN_MODE #x2500)

(alexandria:define-constant GL_OBJECT_PLANE #x2501)

(alexandria:define-constant GL_EYE_PLANE #x2502)

(alexandria:define-constant GL_NEAREST #x2600)

(alexandria:define-constant GL_LINEAR #x2601)

(alexandria:define-constant GL_NEAREST_MIPMAP_NEAREST #x2700)

(alexandria:define-constant GL_LINEAR_MIPMAP_NEAREST #x2701)

(alexandria:define-constant GL_NEAREST_MIPMAP_LINEAR #x2702)

(alexandria:define-constant GL_LINEAR_MIPMAP_LINEAR #x2703)

(alexandria:define-constant GL_TEXTURE_MAG_FILTER #x2800)

(alexandria:define-constant GL_TEXTURE_MIN_FILTER #x2801)

(alexandria:define-constant GL_TEXTURE_WRAP_S #x2802)

(alexandria:define-constant GL_TEXTURE_WRAP_T #x2803)

(alexandria:define-constant GL_CLAMP #x2900)

(alexandria:define-constant GL_REPEAT #x2901)

(alexandria:define-constant GL_CLIENT_PIXEL_STORE_BIT #x00000001)

(alexandria:define-constant GL_CLIENT_VERTEX_ARRAY_BIT #x00000002)

(alexandria:define-constant GL_CLIENT_ALL_ATTRIB_BITS #xffffffff)

(alexandria:define-constant GL_POLYGON_OFFSET_FACTOR #x8038)

(alexandria:define-constant GL_POLYGON_OFFSET_UNITS #x2A00)

(alexandria:define-constant GL_POLYGON_OFFSET_POINT #x2A01)

(alexandria:define-constant GL_POLYGON_OFFSET_LINE #x2A02)

(alexandria:define-constant GL_POLYGON_OFFSET_FILL #x8037)

(alexandria:define-constant GL_ALPHA4 #x803B)

(alexandria:define-constant GL_ALPHA8 #x803C)

(alexandria:define-constant GL_ALPHA12 #x803D)

(alexandria:define-constant GL_ALPHA16 #x803E)

(alexandria:define-constant GL_LUMINANCE4 #x803F)

(alexandria:define-constant GL_LUMINANCE8 #x8040)

(alexandria:define-constant GL_LUMINANCE12 #x8041)

(alexandria:define-constant GL_LUMINANCE16 #x8042)

(alexandria:define-constant GL_LUMINANCE4_ALPHA4 #x8043)

(alexandria:define-constant GL_LUMINANCE6_ALPHA2 #x8044)

(alexandria:define-constant GL_LUMINANCE8_ALPHA8 #x8045)

(alexandria:define-constant GL_LUMINANCE12_ALPHA4 #x8046)

(alexandria:define-constant GL_LUMINANCE12_ALPHA12 #x8047)

(alexandria:define-constant GL_LUMINANCE16_ALPHA16 #x8048)

(alexandria:define-constant GL_INTENSITY #x8049)

(alexandria:define-constant GL_INTENSITY4 #x804A)

(alexandria:define-constant GL_INTENSITY8 #x804B)

(alexandria:define-constant GL_INTENSITY12 #x804C)

(alexandria:define-constant GL_INTENSITY16 #x804D)

(alexandria:define-constant GL_R3_G3_B2 #x2A10)

(alexandria:define-constant GL_RGB4 #x804F)

(alexandria:define-constant GL_RGB5 #x8050)

(alexandria:define-constant GL_RGB8 #x8051)

(alexandria:define-constant GL_RGB10 #x8052)

(alexandria:define-constant GL_RGB12 #x8053)

(alexandria:define-constant GL_RGB16 #x8054)

(alexandria:define-constant GL_RGBA2 #x8055)

(alexandria:define-constant GL_RGBA4 #x8056)

(alexandria:define-constant GL_RGB5_A1 #x8057)

(alexandria:define-constant GL_RGBA8 #x8058)

(alexandria:define-constant GL_RGB10_A2 #x8059)

(alexandria:define-constant GL_RGBA12 #x805A)

(alexandria:define-constant GL_RGBA16 #x805B)

(alexandria:define-constant GL_TEXTURE_RED_SIZE #x805C)

(alexandria:define-constant GL_TEXTURE_GREEN_SIZE #x805D)

(alexandria:define-constant GL_TEXTURE_BLUE_SIZE #x805E)

(alexandria:define-constant GL_TEXTURE_ALPHA_SIZE #x805F)

(alexandria:define-constant GL_TEXTURE_LUMINANCE_SIZE #x8060)

(alexandria:define-constant GL_TEXTURE_INTENSITY_SIZE #x8061)

(alexandria:define-constant GL_PROXY_TEXTURE_1D #x8063)

(alexandria:define-constant GL_PROXY_TEXTURE_2D #x8064)

(alexandria:define-constant GL_TEXTURE_PRIORITY #x8066)

(alexandria:define-constant GL_TEXTURE_RESIDENT #x8067)

(alexandria:define-constant GL_TEXTURE_BINDING_1D #x8068)

(alexandria:define-constant GL_TEXTURE_BINDING_2D #x8069)

(alexandria:define-constant GL_TEXTURE_BINDING_3D #x806A)

(alexandria:define-constant GL_VERTEX_ARRAY #x8074)

(alexandria:define-constant GL_NORMAL_ARRAY #x8075)

(alexandria:define-constant GL_COLOR_ARRAY #x8076)

(alexandria:define-constant GL_INDEX_ARRAY #x8077)

(alexandria:define-constant GL_TEXTURE_COORD_ARRAY #x8078)

(alexandria:define-constant GL_EDGE_FLAG_ARRAY #x8079)

(alexandria:define-constant GL_VERTEX_ARRAY_SIZE #x807A)

(alexandria:define-constant GL_VERTEX_ARRAY_TYPE #x807B)

(alexandria:define-constant GL_VERTEX_ARRAY_STRIDE #x807C)

(alexandria:define-constant GL_NORMAL_ARRAY_TYPE #x807E)

(alexandria:define-constant GL_NORMAL_ARRAY_STRIDE #x807F)

(alexandria:define-constant GL_COLOR_ARRAY_SIZE #x8081)

(alexandria:define-constant GL_COLOR_ARRAY_TYPE #x8082)

(alexandria:define-constant GL_COLOR_ARRAY_STRIDE #x8083)

(alexandria:define-constant GL_INDEX_ARRAY_TYPE #x8085)

(alexandria:define-constant GL_INDEX_ARRAY_STRIDE #x8086)

(alexandria:define-constant GL_TEXTURE_COORD_ARRAY_SIZE #x8088)

(alexandria:define-constant GL_TEXTURE_COORD_ARRAY_TYPE #x8089)

(alexandria:define-constant GL_TEXTURE_COORD_ARRAY_STRIDE #x808A)

(alexandria:define-constant GL_EDGE_FLAG_ARRAY_STRIDE #x808C)

(alexandria:define-constant GL_VERTEX_ARRAY_POINTER #x808E)

(alexandria:define-constant GL_NORMAL_ARRAY_POINTER #x808F)

(alexandria:define-constant GL_COLOR_ARRAY_POINTER #x8090)

(alexandria:define-constant GL_INDEX_ARRAY_POINTER #x8091)

(alexandria:define-constant GL_TEXTURE_COORD_ARRAY_POINTER #x8092)

(alexandria:define-constant GL_EDGE_FLAG_ARRAY_POINTER #x8093)

(alexandria:define-constant GL_V2F #x2A20)

(alexandria:define-constant GL_V3F #x2A21)

(alexandria:define-constant GL_C4UB_V2F #x2A22)

(alexandria:define-constant GL_C4UB_V3F #x2A23)

(alexandria:define-constant GL_C3F_V3F #x2A24)

(alexandria:define-constant GL_N3F_V3F #x2A25)

(alexandria:define-constant GL_C4F_N3F_V3F #x2A26)

(alexandria:define-constant GL_T2F_V3F #x2A27)

(alexandria:define-constant GL_T4F_V4F #x2A28)

(alexandria:define-constant GL_T2F_C4UB_V3F #x2A29)

(alexandria:define-constant GL_T2F_C3F_V3F #x2A2A)

(alexandria:define-constant GL_T2F_N3F_V3F #x2A2B)

(alexandria:define-constant GL_T2F_C4F_N3F_V3F #x2A2C)

(alexandria:define-constant GL_T4F_C4F_N3F_V4F #x2A2D)

(alexandria:define-constant GL_BGR #x80E0)

(alexandria:define-constant GL_BGRA #x80E1)

(alexandria:define-constant GL_CONSTANT_COLOR #x8001)

(alexandria:define-constant GL_ONE_MINUS_CONSTANT_COLOR #x8002)

(alexandria:define-constant GL_CONSTANT_ALPHA #x8003)

(alexandria:define-constant GL_ONE_MINUS_CONSTANT_ALPHA #x8004)

(alexandria:define-constant GL_BLEND_COLOR #x8005)

(alexandria:define-constant GL_FUNC_ADD #x8006)

(alexandria:define-constant GL_MIN #x8007)

(alexandria:define-constant GL_MAX #x8008)

(alexandria:define-constant GL_BLEND_EQUATION #x8009)

(alexandria:define-constant GL_BLEND_EQUATION_RGB #x8009)

(alexandria:define-constant GL_BLEND_EQUATION_ALPHA #x883D)

(alexandria:define-constant GL_FUNC_SUBTRACT #x800A)

(alexandria:define-constant GL_FUNC_REVERSE_SUBTRACT #x800B)

(alexandria:define-constant GL_COLOR_MATRIX #x80B1)

(alexandria:define-constant GL_COLOR_MATRIX_STACK_DEPTH #x80B2)

(alexandria:define-constant GL_MAX_COLOR_MATRIX_STACK_DEPTH #x80B3)

(alexandria:define-constant GL_POST_COLOR_MATRIX_RED_SCALE #x80B4)

(alexandria:define-constant GL_POST_COLOR_MATRIX_GREEN_SCALE #x80B5)

(alexandria:define-constant GL_POST_COLOR_MATRIX_BLUE_SCALE #x80B6)

(alexandria:define-constant GL_POST_COLOR_MATRIX_ALPHA_SCALE #x80B7)

(alexandria:define-constant GL_POST_COLOR_MATRIX_RED_BIAS #x80B8)

(alexandria:define-constant GL_POST_COLOR_MATRIX_GREEN_BIAS #x80B9)

(alexandria:define-constant GL_POST_COLOR_MATRIX_BLUE_BIAS #x80BA)

(alexandria:define-constant GL_POST_COLOR_MATRIX_ALPHA_BIAS #x80BB)

(alexandria:define-constant GL_COLOR_TABLE #x80D0)

(alexandria:define-constant GL_POST_CONVOLUTION_COLOR_TABLE #x80D1)

(alexandria:define-constant GL_POST_COLOR_MATRIX_COLOR_TABLE #x80D2)

(alexandria:define-constant GL_PROXY_COLOR_TABLE #x80D3)

(alexandria:define-constant GL_PROXY_POST_CONVOLUTION_COLOR_TABLE #x80D4)

(alexandria:define-constant GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE #x80D5)

(alexandria:define-constant GL_COLOR_TABLE_SCALE #x80D6)

(alexandria:define-constant GL_COLOR_TABLE_BIAS #x80D7)

(alexandria:define-constant GL_COLOR_TABLE_FORMAT #x80D8)

(alexandria:define-constant GL_COLOR_TABLE_WIDTH #x80D9)

(alexandria:define-constant GL_COLOR_TABLE_RED_SIZE #x80DA)

(alexandria:define-constant GL_COLOR_TABLE_GREEN_SIZE #x80DB)

(alexandria:define-constant GL_COLOR_TABLE_BLUE_SIZE #x80DC)

(alexandria:define-constant GL_COLOR_TABLE_ALPHA_SIZE #x80DD)

(alexandria:define-constant GL_COLOR_TABLE_LUMINANCE_SIZE #x80DE)

(alexandria:define-constant GL_COLOR_TABLE_INTENSITY_SIZE #x80DF)

(alexandria:define-constant GL_CONVOLUTION_1D #x8010)

(alexandria:define-constant GL_CONVOLUTION_2D #x8011)

(alexandria:define-constant GL_SEPARABLE_2D #x8012)

(alexandria:define-constant GL_CONVOLUTION_BORDER_MODE #x8013)

(alexandria:define-constant GL_CONVOLUTION_FILTER_SCALE #x8014)

(alexandria:define-constant GL_CONVOLUTION_FILTER_BIAS #x8015)

(alexandria:define-constant GL_REDUCE #x8016)

(alexandria:define-constant GL_CONVOLUTION_FORMAT #x8017)

(alexandria:define-constant GL_CONVOLUTION_WIDTH #x8018)

(alexandria:define-constant GL_CONVOLUTION_HEIGHT #x8019)

(alexandria:define-constant GL_MAX_CONVOLUTION_WIDTH #x801A)

(alexandria:define-constant GL_MAX_CONVOLUTION_HEIGHT #x801B)

(alexandria:define-constant GL_POST_CONVOLUTION_RED_SCALE #x801C)

(alexandria:define-constant GL_POST_CONVOLUTION_GREEN_SCALE #x801D)

(alexandria:define-constant GL_POST_CONVOLUTION_BLUE_SCALE #x801E)

(alexandria:define-constant GL_POST_CONVOLUTION_ALPHA_SCALE #x801F)

(alexandria:define-constant GL_POST_CONVOLUTION_RED_BIAS #x8020)

(alexandria:define-constant GL_POST_CONVOLUTION_GREEN_BIAS #x8021)

(alexandria:define-constant GL_POST_CONVOLUTION_BLUE_BIAS #x8022)

(alexandria:define-constant GL_POST_CONVOLUTION_ALPHA_BIAS #x8023)

(alexandria:define-constant GL_CONSTANT_BORDER #x8151)

(alexandria:define-constant GL_REPLICATE_BORDER #x8153)

(alexandria:define-constant GL_CONVOLUTION_BORDER_COLOR #x8154)

(alexandria:define-constant GL_MAX_ELEMENTS_VERTICES #x80E8)

(alexandria:define-constant GL_MAX_ELEMENTS_INDICES #x80E9)

(alexandria:define-constant GL_HISTOGRAM #x8024)

(alexandria:define-constant GL_PROXY_HISTOGRAM #x8025)

(alexandria:define-constant GL_HISTOGRAM_WIDTH #x8026)

(alexandria:define-constant GL_HISTOGRAM_FORMAT #x8027)

(alexandria:define-constant GL_HISTOGRAM_RED_SIZE #x8028)

(alexandria:define-constant GL_HISTOGRAM_GREEN_SIZE #x8029)

(alexandria:define-constant GL_HISTOGRAM_BLUE_SIZE #x802A)

(alexandria:define-constant GL_HISTOGRAM_ALPHA_SIZE #x802B)

(alexandria:define-constant GL_HISTOGRAM_LUMINANCE_SIZE #x802C)

(alexandria:define-constant GL_HISTOGRAM_SINK #x802D)

(alexandria:define-constant GL_MINMAX #x802E)

(alexandria:define-constant GL_MINMAX_FORMAT #x802F)

(alexandria:define-constant GL_MINMAX_SINK #x8030)

(alexandria:define-constant GL_TABLE_TOO_LARGE #x8031)

(alexandria:define-constant GL_UNSIGNED_BYTE_3_3_2 #x8032)

(alexandria:define-constant GL_UNSIGNED_SHORT_4_4_4_4 #x8033)

(alexandria:define-constant GL_UNSIGNED_SHORT_5_5_5_1 #x8034)

(alexandria:define-constant GL_UNSIGNED_INT_8_8_8_8 #x8035)

(alexandria:define-constant GL_UNSIGNED_INT_10_10_10_2 #x8036)

(alexandria:define-constant GL_UNSIGNED_BYTE_2_3_3_REV #x8362)

(alexandria:define-constant GL_UNSIGNED_SHORT_5_6_5 #x8363)

(alexandria:define-constant GL_UNSIGNED_SHORT_5_6_5_REV #x8364)

(alexandria:define-constant GL_UNSIGNED_SHORT_4_4_4_4_REV #x8365)

(alexandria:define-constant GL_UNSIGNED_SHORT_1_5_5_5_REV #x8366)

(alexandria:define-constant GL_UNSIGNED_INT_8_8_8_8_REV #x8367)

(alexandria:define-constant GL_UNSIGNED_INT_2_10_10_10_REV #x8368)

(alexandria:define-constant GL_RESCALE_NORMAL #x803A)

(alexandria:define-constant GL_LIGHT_MODEL_COLOR_CONTROL #x81F8)

(alexandria:define-constant GL_SINGLE_COLOR #x81F9)

(alexandria:define-constant GL_SEPARATE_SPECULAR_COLOR #x81FA)

(alexandria:define-constant GL_PACK_SKIP_IMAGES #x806B)

(alexandria:define-constant GL_PACK_IMAGE_HEIGHT #x806C)

(alexandria:define-constant GL_UNPACK_SKIP_IMAGES #x806D)

(alexandria:define-constant GL_UNPACK_IMAGE_HEIGHT #x806E)

(alexandria:define-constant GL_TEXTURE_3D #x806F)

(alexandria:define-constant GL_PROXY_TEXTURE_3D #x8070)

(alexandria:define-constant GL_TEXTURE_DEPTH #x8071)

(alexandria:define-constant GL_TEXTURE_WRAP_R #x8072)

(alexandria:define-constant GL_MAX_3D_TEXTURE_SIZE #x8073)

(alexandria:define-constant GL_CLAMP_TO_EDGE #x812F)

(alexandria:define-constant GL_CLAMP_TO_BORDER #x812D)

(alexandria:define-constant GL_TEXTURE_MIN_LOD #x813A)

(alexandria:define-constant GL_TEXTURE_MAX_LOD #x813B)

(alexandria:define-constant GL_TEXTURE_BASE_LEVEL #x813C)

(alexandria:define-constant GL_TEXTURE_MAX_LEVEL #x813D)

(alexandria:define-constant GL_SMOOTH_POINT_SIZE_RANGE #x0B12)

(alexandria:define-constant GL_SMOOTH_POINT_SIZE_GRANULARITY #x0B13)

(alexandria:define-constant GL_SMOOTH_LINE_WIDTH_RANGE #x0B22)

(alexandria:define-constant GL_SMOOTH_LINE_WIDTH_GRANULARITY #x0B23)

(alexandria:define-constant GL_ALIASED_POINT_SIZE_RANGE #x846D)

(alexandria:define-constant GL_ALIASED_LINE_WIDTH_RANGE #x846E)

(alexandria:define-constant GL_TEXTURE0 #x84C0)

(alexandria:define-constant GL_TEXTURE1 #x84C1)

(alexandria:define-constant GL_TEXTURE2 #x84C2)

(alexandria:define-constant GL_TEXTURE3 #x84C3)

(alexandria:define-constant GL_TEXTURE4 #x84C4)

(alexandria:define-constant GL_TEXTURE5 #x84C5)

(alexandria:define-constant GL_TEXTURE6 #x84C6)

(alexandria:define-constant GL_TEXTURE7 #x84C7)

(alexandria:define-constant GL_TEXTURE8 #x84C8)

(alexandria:define-constant GL_TEXTURE9 #x84C9)

(alexandria:define-constant GL_TEXTURE10 #x84CA)

(alexandria:define-constant GL_TEXTURE11 #x84CB)

(alexandria:define-constant GL_TEXTURE12 #x84CC)

(alexandria:define-constant GL_TEXTURE13 #x84CD)

(alexandria:define-constant GL_TEXTURE14 #x84CE)

(alexandria:define-constant GL_TEXTURE15 #x84CF)

(alexandria:define-constant GL_TEXTURE16 #x84D0)

(alexandria:define-constant GL_TEXTURE17 #x84D1)

(alexandria:define-constant GL_TEXTURE18 #x84D2)

(alexandria:define-constant GL_TEXTURE19 #x84D3)

(alexandria:define-constant GL_TEXTURE20 #x84D4)

(alexandria:define-constant GL_TEXTURE21 #x84D5)

(alexandria:define-constant GL_TEXTURE22 #x84D6)

(alexandria:define-constant GL_TEXTURE23 #x84D7)

(alexandria:define-constant GL_TEXTURE24 #x84D8)

(alexandria:define-constant GL_TEXTURE25 #x84D9)

(alexandria:define-constant GL_TEXTURE26 #x84DA)

(alexandria:define-constant GL_TEXTURE27 #x84DB)

(alexandria:define-constant GL_TEXTURE28 #x84DC)

(alexandria:define-constant GL_TEXTURE29 #x84DD)

(alexandria:define-constant GL_TEXTURE30 #x84DE)

(alexandria:define-constant GL_TEXTURE31 #x84DF)

(alexandria:define-constant GL_ACTIVE_TEXTURE #x84E0)

(alexandria:define-constant GL_CLIENT_ACTIVE_TEXTURE #x84E1)

(alexandria:define-constant GL_MAX_TEXTURE_UNITS #x84E2)

(alexandria:define-constant GL_COMBINE #x8570)

(alexandria:define-constant GL_COMBINE_RGB #x8571)

(alexandria:define-constant GL_COMBINE_ALPHA #x8572)

(alexandria:define-constant GL_RGB_SCALE #x8573)

(alexandria:define-constant GL_ADD_SIGNED #x8574)

(alexandria:define-constant GL_INTERPOLATE #x8575)

(alexandria:define-constant GL_CONSTANT #x8576)

(alexandria:define-constant GL_PRIMARY_COLOR #x8577)

(alexandria:define-constant GL_PREVIOUS #x8578)

(alexandria:define-constant GL_SUBTRACT #x84E7)

(alexandria:define-constant GL_SRC0_RGB #x8580)

(alexandria:define-constant GL_SRC1_RGB #x8581)

(alexandria:define-constant GL_SRC2_RGB #x8582)

(alexandria:define-constant GL_SRC3_RGB #x8583)

(alexandria:define-constant GL_SRC4_RGB #x8584)

(alexandria:define-constant GL_SRC5_RGB #x8585)

(alexandria:define-constant GL_SRC6_RGB #x8586)

(alexandria:define-constant GL_SRC7_RGB #x8587)

(alexandria:define-constant GL_SRC0_ALPHA #x8588)

(alexandria:define-constant GL_SRC1_ALPHA #x8589)

(alexandria:define-constant GL_SRC2_ALPHA #x858A)

(alexandria:define-constant GL_SRC3_ALPHA #x858B)

(alexandria:define-constant GL_SRC4_ALPHA #x858C)

(alexandria:define-constant GL_SRC5_ALPHA #x858D)

(alexandria:define-constant GL_SRC6_ALPHA #x858E)

(alexandria:define-constant GL_SRC7_ALPHA #x858F)

(alexandria:define-constant GL_SOURCE0_RGB #x8580)

(alexandria:define-constant GL_SOURCE1_RGB #x8581)

(alexandria:define-constant GL_SOURCE2_RGB #x8582)

(alexandria:define-constant GL_SOURCE3_RGB #x8583)

(alexandria:define-constant GL_SOURCE4_RGB #x8584)

(alexandria:define-constant GL_SOURCE5_RGB #x8585)

(alexandria:define-constant GL_SOURCE6_RGB #x8586)

(alexandria:define-constant GL_SOURCE7_RGB #x8587)

(alexandria:define-constant GL_SOURCE0_ALPHA #x8588)

(alexandria:define-constant GL_SOURCE1_ALPHA #x8589)

(alexandria:define-constant GL_SOURCE2_ALPHA #x858A)

(alexandria:define-constant GL_SOURCE3_ALPHA #x858B)

(alexandria:define-constant GL_SOURCE4_ALPHA #x858C)

(alexandria:define-constant GL_SOURCE5_ALPHA #x858D)

(alexandria:define-constant GL_SOURCE6_ALPHA #x858E)

(alexandria:define-constant GL_SOURCE7_ALPHA #x858F)

(alexandria:define-constant GL_OPERAND0_RGB #x8590)

(alexandria:define-constant GL_OPERAND1_RGB #x8591)

(alexandria:define-constant GL_OPERAND2_RGB #x8592)

(alexandria:define-constant GL_OPERAND3_RGB #x8593)

(alexandria:define-constant GL_OPERAND4_RGB #x8594)

(alexandria:define-constant GL_OPERAND5_RGB #x8595)

(alexandria:define-constant GL_OPERAND6_RGB #x8596)

(alexandria:define-constant GL_OPERAND7_RGB #x8597)

(alexandria:define-constant GL_OPERAND0_ALPHA #x8598)

(alexandria:define-constant GL_OPERAND1_ALPHA #x8599)

(alexandria:define-constant GL_OPERAND2_ALPHA #x859A)

(alexandria:define-constant GL_OPERAND3_ALPHA #x859B)

(alexandria:define-constant GL_OPERAND4_ALPHA #x859C)

(alexandria:define-constant GL_OPERAND5_ALPHA #x859D)

(alexandria:define-constant GL_OPERAND6_ALPHA #x859E)

(alexandria:define-constant GL_OPERAND7_ALPHA #x859F)

(alexandria:define-constant GL_DOT3_RGB #x86AE)

(alexandria:define-constant GL_DOT3_RGBA #x86AF)

(alexandria:define-constant GL_TRANSPOSE_MODELVIEW_MATRIX #x84E3)

(alexandria:define-constant GL_TRANSPOSE_PROJECTION_MATRIX #x84E4)

(alexandria:define-constant GL_TRANSPOSE_TEXTURE_MATRIX #x84E5)

(alexandria:define-constant GL_TRANSPOSE_COLOR_MATRIX #x84E6)

(alexandria:define-constant GL_NORMAL_MAP #x8511)

(alexandria:define-constant GL_REFLECTION_MAP #x8512)

(alexandria:define-constant GL_TEXTURE_CUBE_MAP #x8513)

(alexandria:define-constant GL_TEXTURE_BINDING_CUBE_MAP #x8514)

(alexandria:define-constant GL_TEXTURE_CUBE_MAP_POSITIVE_X #x8515)

(alexandria:define-constant GL_TEXTURE_CUBE_MAP_NEGATIVE_X #x8516)

(alexandria:define-constant GL_TEXTURE_CUBE_MAP_POSITIVE_Y #x8517)

(alexandria:define-constant GL_TEXTURE_CUBE_MAP_NEGATIVE_Y #x8518)

(alexandria:define-constant GL_TEXTURE_CUBE_MAP_POSITIVE_Z #x8519)

(alexandria:define-constant GL_TEXTURE_CUBE_MAP_NEGATIVE_Z #x851A)

(alexandria:define-constant GL_PROXY_TEXTURE_CUBE_MAP #x851B)

(alexandria:define-constant GL_MAX_CUBE_MAP_TEXTURE_SIZE #x851C)

(alexandria:define-constant GL_COMPRESSED_ALPHA #x84E9)

(alexandria:define-constant GL_COMPRESSED_LUMINANCE #x84EA)

(alexandria:define-constant GL_COMPRESSED_LUMINANCE_ALPHA #x84EB)

(alexandria:define-constant GL_COMPRESSED_INTENSITY #x84EC)

(alexandria:define-constant GL_COMPRESSED_RGB #x84ED)

(alexandria:define-constant GL_COMPRESSED_RGBA #x84EE)

(alexandria:define-constant GL_TEXTURE_COMPRESSION_HINT #x84EF)

(alexandria:define-constant GL_TEXTURE_COMPRESSED_IMAGE_SIZE #x86A0)

(alexandria:define-constant GL_TEXTURE_COMPRESSED #x86A1)

(alexandria:define-constant GL_NUM_COMPRESSED_TEXTURE_FORMATS #x86A2)

(alexandria:define-constant GL_COMPRESSED_TEXTURE_FORMATS #x86A3)

(alexandria:define-constant GL_MULTISAMPLE #x809D)

(alexandria:define-constant GL_SAMPLE_ALPHA_TO_COVERAGE #x809E)

(alexandria:define-constant GL_SAMPLE_ALPHA_TO_ONE #x809F)

(alexandria:define-constant GL_SAMPLE_COVERAGE #x80A0)

(alexandria:define-constant GL_SAMPLE_BUFFERS #x80A8)

(alexandria:define-constant GL_SAMPLES #x80A9)

(alexandria:define-constant GL_SAMPLE_COVERAGE_VALUE #x80AA)

(alexandria:define-constant GL_SAMPLE_COVERAGE_INVERT #x80AB)

(alexandria:define-constant GL_MULTISAMPLE_BIT #x20000000)

(alexandria:define-constant GL_DEPTH_COMPONENT16 #x81A5)

(alexandria:define-constant GL_DEPTH_COMPONENT24 #x81A6)

(alexandria:define-constant GL_DEPTH_COMPONENT32 #x81A7)

(alexandria:define-constant GL_TEXTURE_DEPTH_SIZE #x884A)

(alexandria:define-constant GL_DEPTH_TEXTURE_MODE #x884B)

(alexandria:define-constant GL_TEXTURE_COMPARE_MODE #x884C)

(alexandria:define-constant GL_TEXTURE_COMPARE_FUNC #x884D)

(alexandria:define-constant GL_COMPARE_R_TO_TEXTURE #x884E)

(alexandria:define-constant GL_QUERY_COUNTER_BITS #x8864)

(alexandria:define-constant GL_CURRENT_QUERY #x8865)

(alexandria:define-constant GL_QUERY_RESULT #x8866)

(alexandria:define-constant GL_QUERY_RESULT_AVAILABLE #x8867)

(alexandria:define-constant GL_SAMPLES_PASSED #x8914)

(alexandria:define-constant GL_FOG_COORD_SRC #x8450)

(alexandria:define-constant GL_FOG_COORD #x8451)

(alexandria:define-constant GL_FRAGMENT_DEPTH #x8452)

(alexandria:define-constant GL_CURRENT_FOG_COORD #x8453)

(alexandria:define-constant GL_FOG_COORD_ARRAY_TYPE #x8454)

(alexandria:define-constant GL_FOG_COORD_ARRAY_STRIDE #x8455)

(alexandria:define-constant GL_FOG_COORD_ARRAY_POINTER #x8456)

(alexandria:define-constant GL_FOG_COORD_ARRAY #x8457)

(alexandria:define-constant GL_FOG_COORDINATE_SOURCE #x8450)

(alexandria:define-constant GL_FOG_COORDINATE #x8451)

(alexandria:define-constant GL_CURRENT_FOG_COORDINATE #x8453)

(alexandria:define-constant GL_FOG_COORDINATE_ARRAY_TYPE #x8454)

(alexandria:define-constant GL_FOG_COORDINATE_ARRAY_STRIDE #x8455)

(alexandria:define-constant GL_FOG_COORDINATE_ARRAY_POINTER #x8456)

(alexandria:define-constant GL_FOG_COORDINATE_ARRAY #x8457)

(alexandria:define-constant GL_COLOR_SUM #x8458)

(alexandria:define-constant GL_CURRENT_SECONDARY_COLOR #x8459)

(alexandria:define-constant GL_SECONDARY_COLOR_ARRAY_SIZE #x845A)

(alexandria:define-constant GL_SECONDARY_COLOR_ARRAY_TYPE #x845B)

(alexandria:define-constant GL_SECONDARY_COLOR_ARRAY_STRIDE #x845C)

(alexandria:define-constant GL_SECONDARY_COLOR_ARRAY_POINTER #x845D)

(alexandria:define-constant GL_SECONDARY_COLOR_ARRAY #x845E)

(alexandria:define-constant GL_POINT_SIZE_MIN #x8126)

(alexandria:define-constant GL_POINT_SIZE_MAX #x8127)

(alexandria:define-constant GL_POINT_FADE_THRESHOLD_SIZE #x8128)

(alexandria:define-constant GL_POINT_DISTANCE_ATTENUATION #x8129)

(alexandria:define-constant GL_BLEND_DST_RGB #x80C8)

(alexandria:define-constant GL_BLEND_SRC_RGB #x80C9)

(alexandria:define-constant GL_BLEND_DST_ALPHA #x80CA)

(alexandria:define-constant GL_BLEND_SRC_ALPHA #x80CB)

(alexandria:define-constant GL_GENERATE_MIPMAP #x8191)

(alexandria:define-constant GL_GENERATE_MIPMAP_HINT #x8192)

(alexandria:define-constant GL_INCR_WRAP #x8507)

(alexandria:define-constant GL_DECR_WRAP #x8508)

(alexandria:define-constant GL_MIRRORED_REPEAT #x8370)

(alexandria:define-constant GL_MAX_TEXTURE_LOD_BIAS #x84FD)

(alexandria:define-constant GL_TEXTURE_FILTER_CONTROL #x8500)

(alexandria:define-constant GL_TEXTURE_LOD_BIAS #x8501)

(alexandria:define-constant GL_ARRAY_BUFFER #x8892)

(alexandria:define-constant GL_ELEMENT_ARRAY_BUFFER #x8893)

(alexandria:define-constant GL_ARRAY_BUFFER_BINDING #x8894)

(alexandria:define-constant GL_ELEMENT_ARRAY_BUFFER_BINDING #x8895)

(alexandria:define-constant GL_VERTEX_ARRAY_BUFFER_BINDING #x8896)

(alexandria:define-constant GL_NORMAL_ARRAY_BUFFER_BINDING #x8897)

(alexandria:define-constant GL_COLOR_ARRAY_BUFFER_BINDING #x8898)

(alexandria:define-constant GL_INDEX_ARRAY_BUFFER_BINDING #x8899)

(alexandria:define-constant GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING #x889A)

(alexandria:define-constant GL_EDGE_FLAG_ARRAY_BUFFER_BINDING #x889B)

(alexandria:define-constant GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING #x889C)

(alexandria:define-constant GL_FOG_COORD_ARRAY_BUFFER_BINDING #x889D)

(alexandria:define-constant GL_WEIGHT_ARRAY_BUFFER_BINDING #x889E)

(alexandria:define-constant GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING #x889F)

(alexandria:define-constant GL_STREAM_DRAW #x88E0)

(alexandria:define-constant GL_STREAM_READ #x88E1)

(alexandria:define-constant GL_STREAM_COPY #x88E2)

(alexandria:define-constant GL_STATIC_DRAW #x88E4)

(alexandria:define-constant GL_STATIC_READ #x88E5)

(alexandria:define-constant GL_STATIC_COPY #x88E6)

(alexandria:define-constant GL_DYNAMIC_DRAW #x88E8)

(alexandria:define-constant GL_DYNAMIC_READ #x88E9)

(alexandria:define-constant GL_DYNAMIC_COPY #x88EA)

(alexandria:define-constant GL_READ_ONLY #x88B8)

(alexandria:define-constant GL_WRITE_ONLY #x88B9)

(alexandria:define-constant GL_READ_WRITE #x88BA)

(alexandria:define-constant GL_BUFFER_SIZE #x8764)

(alexandria:define-constant GL_BUFFER_USAGE #x8765)

(alexandria:define-constant GL_BUFFER_ACCESS #x88BB)

(alexandria:define-constant GL_BUFFER_MAPPED #x88BC)

(alexandria:define-constant GL_BUFFER_MAP_POINTER #x88BD)

(alexandria:define-constant GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING #x889D)

(alexandria:define-constant GL_CURRENT_PROGRAM #x8B8D)

(alexandria:define-constant GL_SHADER_TYPE #x8B4F)

(alexandria:define-constant GL_DELETE_STATUS #x8B80)

(alexandria:define-constant GL_COMPILE_STATUS #x8B81)

(alexandria:define-constant GL_LINK_STATUS #x8B82)

(alexandria:define-constant GL_VALIDATE_STATUS #x8B83)

(alexandria:define-constant GL_INFO_LOG_LENGTH #x8B84)

(alexandria:define-constant GL_ATTACHED_SHADERS #x8B85)

(alexandria:define-constant GL_ACTIVE_UNIFORMS #x8B86)

(alexandria:define-constant GL_ACTIVE_UNIFORM_MAX_LENGTH #x8B87)

(alexandria:define-constant GL_SHADER_SOURCE_LENGTH #x8B88)

(alexandria:define-constant GL_FLOAT_VEC2 #x8B50)

(alexandria:define-constant GL_FLOAT_VEC3 #x8B51)

(alexandria:define-constant GL_FLOAT_VEC4 #x8B52)

(alexandria:define-constant GL_INT_VEC2 #x8B53)

(alexandria:define-constant GL_INT_VEC3 #x8B54)

(alexandria:define-constant GL_INT_VEC4 #x8B55)

(alexandria:define-constant GL_BOOL #x8B56)

(alexandria:define-constant GL_BOOL_VEC2 #x8B57)

(alexandria:define-constant GL_BOOL_VEC3 #x8B58)

(alexandria:define-constant GL_BOOL_VEC4 #x8B59)

(alexandria:define-constant GL_FLOAT_MAT2 #x8B5A)

(alexandria:define-constant GL_FLOAT_MAT3 #x8B5B)

(alexandria:define-constant GL_FLOAT_MAT4 #x8B5C)

(alexandria:define-constant GL_SAMPLER_1D #x8B5D)

(alexandria:define-constant GL_SAMPLER_2D #x8B5E)

(alexandria:define-constant GL_SAMPLER_3D #x8B5F)

(alexandria:define-constant GL_SAMPLER_CUBE #x8B60)

(alexandria:define-constant GL_SAMPLER_1D_SHADOW #x8B61)

(alexandria:define-constant GL_SAMPLER_2D_SHADOW #x8B62)

(alexandria:define-constant GL_SHADING_LANGUAGE_VERSION #x8B8C)

(alexandria:define-constant GL_VERTEX_SHADER #x8B31)

(alexandria:define-constant GL_MAX_VERTEX_UNIFORM_COMPONENTS #x8B4A)

(alexandria:define-constant GL_MAX_VARYING_FLOATS #x8B4B)

(alexandria:define-constant GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS #x8B4C)

(alexandria:define-constant GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS #x8B4D)

(alexandria:define-constant GL_ACTIVE_ATTRIBUTES #x8B89)

(alexandria:define-constant GL_ACTIVE_ATTRIBUTE_MAX_LENGTH #x8B8A)

(alexandria:define-constant GL_FRAGMENT_SHADER #x8B30)

(alexandria:define-constant GL_MAX_FRAGMENT_UNIFORM_COMPONENTS #x8B49)

(alexandria:define-constant GL_FRAGMENT_SHADER_DERIVATIVE_HINT #x8B8B)

(alexandria:define-constant GL_MAX_VERTEX_ATTRIBS #x8869)

(alexandria:define-constant GL_VERTEX_ATTRIB_ARRAY_ENABLED #x8622)

(alexandria:define-constant GL_VERTEX_ATTRIB_ARRAY_SIZE #x8623)

(alexandria:define-constant GL_VERTEX_ATTRIB_ARRAY_STRIDE #x8624)

(alexandria:define-constant GL_VERTEX_ATTRIB_ARRAY_TYPE #x8625)

(alexandria:define-constant GL_VERTEX_ATTRIB_ARRAY_NORMALIZED #x886A)

(alexandria:define-constant GL_CURRENT_VERTEX_ATTRIB #x8626)

(alexandria:define-constant GL_VERTEX_ATTRIB_ARRAY_POINTER #x8645)

(alexandria:define-constant GL_VERTEX_PROGRAM_POINT_SIZE #x8642)

(alexandria:define-constant GL_VERTEX_PROGRAM_TWO_SIDE #x8643)

(alexandria:define-constant GL_MAX_TEXTURE_COORDS #x8871)

(alexandria:define-constant GL_MAX_TEXTURE_IMAGE_UNITS #x8872)

(alexandria:define-constant GL_MAX_DRAW_BUFFERS #x8824)

(alexandria:define-constant GL_DRAW_BUFFER0 #x8825)

(alexandria:define-constant GL_DRAW_BUFFER1 #x8826)

(alexandria:define-constant GL_DRAW_BUFFER2 #x8827)

(alexandria:define-constant GL_DRAW_BUFFER3 #x8828)

(alexandria:define-constant GL_DRAW_BUFFER4 #x8829)

(alexandria:define-constant GL_DRAW_BUFFER5 #x882A)

(alexandria:define-constant GL_DRAW_BUFFER6 #x882B)

(alexandria:define-constant GL_DRAW_BUFFER7 #x882C)

(alexandria:define-constant GL_DRAW_BUFFER8 #x882D)

(alexandria:define-constant GL_DRAW_BUFFER9 #x882E)

(alexandria:define-constant GL_DRAW_BUFFER10 #x882F)

(alexandria:define-constant GL_DRAW_BUFFER11 #x8830)

(alexandria:define-constant GL_DRAW_BUFFER12 #x8831)

(alexandria:define-constant GL_DRAW_BUFFER13 #x8832)

(alexandria:define-constant GL_DRAW_BUFFER14 #x8833)

(alexandria:define-constant GL_DRAW_BUFFER15 #x8834)

(alexandria:define-constant GL_POINT_SPRITE #x8861)

(alexandria:define-constant GL_COORD_REPLACE #x8862)

(alexandria:define-constant GL_POINT_SPRITE_COORD_ORIGIN #x8CA0)

(alexandria:define-constant GL_LOWER_LEFT #x8CA1)

(alexandria:define-constant GL_UPPER_LEFT #x8CA2)

(alexandria:define-constant GL_STENCIL_BACK_FUNC #x8800)

(alexandria:define-constant GL_STENCIL_BACK_VALUE_MASK #x8CA4)

(alexandria:define-constant GL_STENCIL_BACK_REF #x8CA3)

(alexandria:define-constant GL_STENCIL_BACK_FAIL #x8801)

(alexandria:define-constant GL_STENCIL_BACK_PASS_DEPTH_FAIL #x8802)

(alexandria:define-constant GL_STENCIL_BACK_PASS_DEPTH_PASS #x8803)

(alexandria:define-constant GL_STENCIL_BACK_WRITEMASK #x8CA5)

(alexandria:define-constant GL_CURRENT_RASTER_SECONDARY_COLOR #x845F)

(alexandria:define-constant GL_PIXEL_PACK_BUFFER #x88EB)

(alexandria:define-constant GL_PIXEL_UNPACK_BUFFER #x88EC)

(alexandria:define-constant GL_PIXEL_PACK_BUFFER_BINDING #x88ED)

(alexandria:define-constant GL_PIXEL_UNPACK_BUFFER_BINDING #x88EF)

(alexandria:define-constant GL_FLOAT_MAT2x3 #x8B65)

(alexandria:define-constant GL_FLOAT_MAT2x4 #x8B66)

(alexandria:define-constant GL_FLOAT_MAT3x2 #x8B67)

(alexandria:define-constant GL_FLOAT_MAT3x4 #x8B68)

(alexandria:define-constant GL_FLOAT_MAT4x2 #x8B69)

(alexandria:define-constant GL_FLOAT_MAT4x3 #x8B6A)

(alexandria:define-constant GL_SRGB #x8C40)

(alexandria:define-constant GL_SRGB8 #x8C41)

(alexandria:define-constant GL_SRGB_ALPHA #x8C42)

(alexandria:define-constant GL_SRGB8_ALPHA8 #x8C43)

(alexandria:define-constant GL_SLUMINANCE_ALPHA #x8C44)

(alexandria:define-constant GL_SLUMINANCE8_ALPHA8 #x8C45)

(alexandria:define-constant GL_SLUMINANCE #x8C46)

(alexandria:define-constant GL_SLUMINANCE8 #x8C47)

(alexandria:define-constant GL_COMPRESSED_SRGB #x8C48)

(alexandria:define-constant GL_COMPRESSED_SRGB_ALPHA #x8C49)

(alexandria:define-constant GL_COMPRESSED_SLUMINANCE #x8C4A)

(alexandria:define-constant GL_COMPRESSED_SLUMINANCE_ALPHA #x8C4B)

(cffi:defcfun ("glAccum" glAccum) :void
  (op :unsigned-int)
  (value :float))

(cffi:defcfun ("glAlphaFunc" glAlphaFunc) :void
  (func :unsigned-int)
  (ref :float))

(cffi:defcfun ("glAreTexturesResident" glAreTexturesResident) :unsigned-char
  (n :int)
  (textures :pointer)
  (residences :pointer))

(cffi:defcfun ("glArrayElement" glArrayElement) :void
  (i :int))

(cffi:defcfun ("glBegin" glBegin) :void
  (mode :unsigned-int))

(cffi:defcfun ("glBindTexture" glBindTexture) :void
  (target :unsigned-int)
  (texture :unsigned-int))

(cffi:defcfun ("glBitmap" glBitmap) :void
  (width :int)
  (height :int)
  (xorig :float)
  (yorig :float)
  (xmove :float)
  (ymove :float)
  (bitmap :pointer))

(cffi:defcfun ("glBlendColor" glBlendColor) :void
  (red :float)
  (green :float)
  (blue :float)
  (alpha :float))

(cffi:defcfun ("glBlendEquation" glBlendEquation) :void
  (mode :unsigned-int))

(cffi:defcfun ("glBlendEquationSeparate" glBlendEquationSeparate) :void
  (modeRGB :unsigned-int)
  (modeAlpha :unsigned-int))

(cffi:defcfun ("glBlendFunc" glBlendFunc) :void
  (sfactor :unsigned-int)
  (dfactor :unsigned-int))

(cffi:defcfun ("glCallList" glCallList) :void
  (list :unsigned-int))

(cffi:defcfun ("glCallLists" glCallLists) :void
  (n :int)
  (type :unsigned-int)
  (lists :pointer))

(cffi:defcfun ("glClear" glClear) :void
  (mask :unsigned-int))

(cffi:defcfun ("glClearAccum" glClearAccum) :void
  (red :float)
  (green :float)
  (blue :float)
  (alpha :float))

(cffi:defcfun ("glClearColor" glClearColor) :void
  (red :float)
  (green :float)
  (blue :float)
  (alpha :float))

(cffi:defcfun ("glClearDepth" glClearDepth) :void
  (depth :double))

(cffi:defcfun ("glClearIndex" glClearIndex) :void
  (c :float))

(cffi:defcfun ("glClearStencil" glClearStencil) :void
  (s :int))

(cffi:defcfun ("glClipPlane" glClipPlane) :void
  (plane :unsigned-int)
  (equation :pointer))

(cffi:defcfun ("glColor3b" glColor3b) :void
  (red :char)
  (green :char)
  (blue :char))

(cffi:defcfun ("glColor3bv" glColor3bv) :void
  (v :pointer))

(cffi:defcfun ("glColor3d" glColor3d) :void
  (red :double)
  (green :double)
  (blue :double))

(cffi:defcfun ("glColor3dv" glColor3dv) :void
  (v :pointer))

(cffi:defcfun ("glColor3f" glColor3f) :void
  (red :float)
  (green :float)
  (blue :float))

(cffi:defcfun ("glColor3fv" glColor3fv) :void
  (v :pointer))

(cffi:defcfun ("glColor3i" glColor3i) :void
  (red :int)
  (green :int)
  (blue :int))

(cffi:defcfun ("glColor3iv" glColor3iv) :void
  (v :pointer))

(cffi:defcfun ("glColor3s" glColor3s) :void
  (red :short)
  (green :short)
  (blue :short))

(cffi:defcfun ("glColor3sv" glColor3sv) :void
  (v :pointer))

(cffi:defcfun ("glColor3ub" glColor3ub) :void
  (red :unsigned-char)
  (green :unsigned-char)
  (blue :unsigned-char))

(cffi:defcfun ("glColor3ubv" glColor3ubv) :void
  (v :pointer))

(cffi:defcfun ("glColor3ui" glColor3ui) :void
  (red :unsigned-int)
  (green :unsigned-int)
  (blue :unsigned-int))

(cffi:defcfun ("glColor3uiv" glColor3uiv) :void
  (v :pointer))

(cffi:defcfun ("glColor3us" glColor3us) :void
  (red :unsigned-short)
  (green :unsigned-short)
  (blue :unsigned-short))

(cffi:defcfun ("glColor3usv" glColor3usv) :void
  (v :pointer))

(cffi:defcfun ("glColor4b" glColor4b) :void
  (red :char)
  (green :char)
  (blue :char)
  (alpha :char))

(cffi:defcfun ("glColor4bv" glColor4bv) :void
  (v :pointer))

(cffi:defcfun ("glColor4d" glColor4d) :void
  (red :double)
  (green :double)
  (blue :double)
  (alpha :double))

(cffi:defcfun ("glColor4dv" glColor4dv) :void
  (v :pointer))

(cffi:defcfun ("glColor4f" glColor4f) :void
  (red :float)
  (green :float)
  (blue :float)
  (alpha :float))

(cffi:defcfun ("glColor4fv" glColor4fv) :void
  (v :pointer))

(cffi:defcfun ("glColor4i" glColor4i) :void
  (red :int)
  (green :int)
  (blue :int)
  (alpha :int))

(cffi:defcfun ("glColor4iv" glColor4iv) :void
  (v :pointer))

(cffi:defcfun ("glColor4s" glColor4s) :void
  (red :short)
  (green :short)
  (blue :short)
  (alpha :short))

(cffi:defcfun ("glColor4sv" glColor4sv) :void
  (v :pointer))

(cffi:defcfun ("glColor4ub" glColor4ub) :void
  (red :unsigned-char)
  (green :unsigned-char)
  (blue :unsigned-char)
  (alpha :unsigned-char))

(cffi:defcfun ("glColor4ubv" glColor4ubv) :void
  (v :pointer))

(cffi:defcfun ("glColor4ui" glColor4ui) :void
  (red :unsigned-int)
  (green :unsigned-int)
  (blue :unsigned-int)
  (alpha :unsigned-int))

(cffi:defcfun ("glColor4uiv" glColor4uiv) :void
  (v :pointer))

(cffi:defcfun ("glColor4us" glColor4us) :void
  (red :unsigned-short)
  (green :unsigned-short)
  (blue :unsigned-short)
  (alpha :unsigned-short))

(cffi:defcfun ("glColor4usv" glColor4usv) :void
  (v :pointer))

(cffi:defcfun ("glColorMask" glColorMask) :void
  (red :unsigned-char)
  (green :unsigned-char)
  (blue :unsigned-char)
  (alpha :unsigned-char))

(cffi:defcfun ("glColorMaterial" glColorMaterial) :void
  (face :unsigned-int)
  (mode :unsigned-int))

(cffi:defcfun ("glColorPointer" glColorPointer) :void
  (size :int)
  (type :unsigned-int)
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glColorSubTable" glColorSubTable) :void
  (target :unsigned-int)
  (start :int)
  (count :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (data :pointer))

(cffi:defcfun ("glColorTable" glColorTable) :void
  (target :unsigned-int)
  (internalformat :unsigned-int)
  (width :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (table :pointer))

(cffi:defcfun ("glColorTableParameterfv" glColorTableParameterfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glColorTableParameteriv" glColorTableParameteriv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glConvolutionFilter1D" glConvolutionFilter1D) :void
  (target :unsigned-int)
  (internalformat :unsigned-int)
  (width :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (image :pointer))

(cffi:defcfun ("glConvolutionFilter2D" glConvolutionFilter2D) :void
  (target :unsigned-int)
  (internalformat :unsigned-int)
  (width :int)
  (height :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (image :pointer))

(cffi:defcfun ("glConvolutionParameterf" glConvolutionParameterf) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :float))

(cffi:defcfun ("glConvolutionParameterfv" glConvolutionParameterfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glConvolutionParameteri" glConvolutionParameteri) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :int))

(cffi:defcfun ("glConvolutionParameteriv" glConvolutionParameteriv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glCopyColorSubTable" glCopyColorSubTable) :void
  (target :unsigned-int)
  (start :int)
  (x :int)
  (y :int)
  (width :int))

(cffi:defcfun ("glCopyColorTable" glCopyColorTable) :void
  (target :unsigned-int)
  (internalformat :unsigned-int)
  (x :int)
  (y :int)
  (width :int))

(cffi:defcfun ("glCopyConvolutionFilter1D" glCopyConvolutionFilter1D) :void
  (target :unsigned-int)
  (internalformat :unsigned-int)
  (x :int)
  (y :int)
  (width :int))

(cffi:defcfun ("glCopyConvolutionFilter2D" glCopyConvolutionFilter2D) :void
  (target :unsigned-int)
  (internalformat :unsigned-int)
  (x :int)
  (y :int)
  (width :int)
  (height :int))

(cffi:defcfun ("glCopyPixels" glCopyPixels) :void
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (type :unsigned-int))

(cffi:defcfun ("glCopyTexImage1D" glCopyTexImage1D) :void
  (target :unsigned-int)
  (level :int)
  (internalformat :unsigned-int)
  (x :int)
  (y :int)
  (width :int)
  (border :int))

(cffi:defcfun ("glCopyTexImage2D" glCopyTexImage2D) :void
  (target :unsigned-int)
  (level :int)
  (internalformat :unsigned-int)
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (border :int))

(cffi:defcfun ("glCopyTexSubImage1D" glCopyTexSubImage1D) :void
  (target :unsigned-int)
  (level :int)
  (xoffset :int)
  (x :int)
  (y :int)
  (width :int))

(cffi:defcfun ("glCopyTexSubImage2D" glCopyTexSubImage2D) :void
  (target :unsigned-int)
  (level :int)
  (xoffset :int)
  (yoffset :int)
  (x :int)
  (y :int)
  (width :int)
  (height :int))

(cffi:defcfun ("glCopyTexSubImage3D" glCopyTexSubImage3D) :void
  (target :unsigned-int)
  (level :int)
  (xoffset :int)
  (yoffset :int)
  (zoffset :int)
  (x :int)
  (y :int)
  (width :int)
  (height :int))

(cffi:defcfun ("glCullFace" glCullFace) :void
  (mode :unsigned-int))

(cffi:defcfun ("glDeleteLists" glDeleteLists) :void
  (list :unsigned-int)
  (range :int))

(cffi:defcfun ("glDeleteTextures" glDeleteTextures) :void
  (n :int)
  (textures :pointer))

(cffi:defcfun ("glDepthFunc" glDepthFunc) :void
  (func :unsigned-int))

(cffi:defcfun ("glDepthMask" glDepthMask) :void
  (flag :unsigned-char))

(cffi:defcfun ("glDepthRange" glDepthRange) :void
  (zNear :double)
  (zFar :double))

(cffi:defcfun ("glDisable" glDisable) :void
  (cap :unsigned-int))

(cffi:defcfun ("glDisableClientState" glDisableClientState) :void
  (array :unsigned-int))

(cffi:defcfun ("glDrawArrays" glDrawArrays) :void
  (mode :unsigned-int)
  (first :int)
  (count :int))

(cffi:defcfun ("glDrawBuffer" glDrawBuffer) :void
  (mode :unsigned-int))

(cffi:defcfun ("glDrawElements" glDrawElements) :void
  (mode :unsigned-int)
  (count :int)
  (type :unsigned-int)
  (indices :pointer))

(cffi:defcfun ("glDrawPixels" glDrawPixels) :void
  (width :int)
  (height :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (pixels :pointer))

(cffi:defcfun ("glDrawRangeElements" glDrawRangeElements) :void
  (mode :unsigned-int)
  (start :unsigned-int)
  (end :unsigned-int)
  (count :int)
  (type :unsigned-int)
  (indices :pointer))

(cffi:defcfun ("glEdgeFlag" glEdgeFlag) :void
  (flag :unsigned-char))

(cffi:defcfun ("glEdgeFlagPointer" glEdgeFlagPointer) :void
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glEdgeFlagv" glEdgeFlagv) :void
  (flag :pointer))

(cffi:defcfun ("glEnable" glEnable) :void
  (cap :unsigned-int))

(cffi:defcfun ("glEnableClientState" glEnableClientState) :void
  (array :unsigned-int))

(cffi:defcfun ("glEnd" glEnd) :void)

(cffi:defcfun ("glEndList" glEndList) :void)

(cffi:defcfun ("glEvalCoord1d" glEvalCoord1d) :void
  (u :double))

(cffi:defcfun ("glEvalCoord1dv" glEvalCoord1dv) :void
  (u :pointer))

(cffi:defcfun ("glEvalCoord1f" glEvalCoord1f) :void
  (u :float))

(cffi:defcfun ("glEvalCoord1fv" glEvalCoord1fv) :void
  (u :pointer))

(cffi:defcfun ("glEvalCoord2d" glEvalCoord2d) :void
  (u :double)
  (v :double))

(cffi:defcfun ("glEvalCoord2dv" glEvalCoord2dv) :void
  (u :pointer))

(cffi:defcfun ("glEvalCoord2f" glEvalCoord2f) :void
  (u :float)
  (v :float))

(cffi:defcfun ("glEvalCoord2fv" glEvalCoord2fv) :void
  (u :pointer))

(cffi:defcfun ("glEvalMesh1" glEvalMesh1) :void
  (mode :unsigned-int)
  (i1 :int)
  (i2 :int))

(cffi:defcfun ("glEvalMesh2" glEvalMesh2) :void
  (mode :unsigned-int)
  (i1 :int)
  (i2 :int)
  (j1 :int)
  (j2 :int))

(cffi:defcfun ("glEvalPoint1" glEvalPoint1) :void
  (i :int))

(cffi:defcfun ("glEvalPoint2" glEvalPoint2) :void
  (i :int)
  (j :int))

(cffi:defcfun ("glFeedbackBuffer" glFeedbackBuffer) :void
  (size :int)
  (type :unsigned-int)
  (buffer :pointer))

(cffi:defcfun ("glFinish" glFinish) :void)

(cffi:defcfun ("glFlush" glFlush) :void)

(cffi:defcfun ("glFogf" glFogf) :void
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glFogfv" glFogfv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glFogi" glFogi) :void
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glFogiv" glFogiv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glFrontFace" glFrontFace) :void
  (mode :unsigned-int))

(cffi:defcfun ("glFrustum" glFrustum) :void
  (left :double)
  (right :double)
  (bottom :double)
  (top :double)
  (zNear :double)
  (zFar :double))

(cffi:defcfun ("glGenLists" glGenLists) :unsigned-int
  (range :int))

(cffi:defcfun ("glGenTextures" glGenTextures) :void
  (n :int)
  (textures :pointer))

(cffi:defcfun ("glGetBooleanv" glGetBooleanv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetClipPlane" glGetClipPlane) :void
  (plane :unsigned-int)
  (equation :pointer))

(cffi:defcfun ("glGetColorTable" glGetColorTable) :void
  (target :unsigned-int)
  (format :unsigned-int)
  (type :unsigned-int)
  (table :pointer))

(cffi:defcfun ("glGetColorTableParameterfv" glGetColorTableParameterfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetColorTableParameteriv" glGetColorTableParameteriv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetConvolutionFilter" glGetConvolutionFilter) :void
  (target :unsigned-int)
  (format :unsigned-int)
  (type :unsigned-int)
  (image :pointer))

(cffi:defcfun ("glGetConvolutionParameterfv" glGetConvolutionParameterfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetConvolutionParameteriv" glGetConvolutionParameteriv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetDoublev" glGetDoublev) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetError" glGetError) :unsigned-int)

(cffi:defcfun ("glGetFloatv" glGetFloatv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetHistogram" glGetHistogram) :void
  (target :unsigned-int)
  (reset :unsigned-char)
  (format :unsigned-int)
  (type :unsigned-int)
  (values :pointer))

(cffi:defcfun ("glGetHistogramParameterfv" glGetHistogramParameterfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetHistogramParameteriv" glGetHistogramParameteriv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetIntegerv" glGetIntegerv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetLightfv" glGetLightfv) :void
  (light :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetLightiv" glGetLightiv) :void
  (light :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetMapdv" glGetMapdv) :void
  (target :unsigned-int)
  (query :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glGetMapfv" glGetMapfv) :void
  (target :unsigned-int)
  (query :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glGetMapiv" glGetMapiv) :void
  (target :unsigned-int)
  (query :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glGetMaterialfv" glGetMaterialfv) :void
  (face :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetMaterialiv" glGetMaterialiv) :void
  (face :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetMinmax" glGetMinmax) :void
  (target :unsigned-int)
  (reset :unsigned-char)
  (format :unsigned-int)
  (type :unsigned-int)
  (values :pointer))

(cffi:defcfun ("glGetMinmaxParameterfv" glGetMinmaxParameterfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetMinmaxParameteriv" glGetMinmaxParameteriv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetPixelMapfv" glGetPixelMapfv) :void
  (map :unsigned-int)
  (values :pointer))

(cffi:defcfun ("glGetPixelMapuiv" glGetPixelMapuiv) :void
  (map :unsigned-int)
  (values :pointer))

(cffi:defcfun ("glGetPixelMapusv" glGetPixelMapusv) :void
  (map :unsigned-int)
  (values :pointer))

(cffi:defcfun ("glGetPointerv" glGetPointerv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetPolygonStipple" glGetPolygonStipple) :void
  (mask :pointer))

(cffi:defcfun ("glGetSeparableFilter" glGetSeparableFilter) :void
  (target :unsigned-int)
  (format :unsigned-int)
  (type :unsigned-int)
  (row :pointer)
  (column :pointer)
  (span :pointer))

(cffi:defcfun ("glGetString" glGetString) :pointer
  (name :unsigned-int))

(cffi:defcfun ("glGetTexEnvfv" glGetTexEnvfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetTexEnviv" glGetTexEnviv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetTexGendv" glGetTexGendv) :void
  (coord :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetTexGenfv" glGetTexGenfv) :void
  (coord :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetTexGeniv" glGetTexGeniv) :void
  (coord :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetTexImage" glGetTexImage) :void
  (target :unsigned-int)
  (level :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (pixels :pointer))

(cffi:defcfun ("glGetTexLevelParameterfv" glGetTexLevelParameterfv) :void
  (target :unsigned-int)
  (level :int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetTexLevelParameteriv" glGetTexLevelParameteriv) :void
  (target :unsigned-int)
  (level :int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetTexParameterfv" glGetTexParameterfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetTexParameteriv" glGetTexParameteriv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glHint" glHint) :void
  (target :unsigned-int)
  (mode :unsigned-int))

(cffi:defcfun ("glHistogram" glHistogram) :void
  (target :unsigned-int)
  (width :int)
  (internalformat :unsigned-int)
  (sink :unsigned-char))

(cffi:defcfun ("glIndexMask" glIndexMask) :void
  (mask :unsigned-int))

(cffi:defcfun ("glIndexPointer" glIndexPointer) :void
  (type :unsigned-int)
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glIndexd" glIndexd) :void
  (c :double))

(cffi:defcfun ("glIndexdv" glIndexdv) :void
  (c :pointer))

(cffi:defcfun ("glIndexf" glIndexf) :void
  (c :float))

(cffi:defcfun ("glIndexfv" glIndexfv) :void
  (c :pointer))

(cffi:defcfun ("glIndexi" glIndexi) :void
  (c :int))

(cffi:defcfun ("glIndexiv" glIndexiv) :void
  (c :pointer))

(cffi:defcfun ("glIndexs" glIndexs) :void
  (c :short))

(cffi:defcfun ("glIndexsv" glIndexsv) :void
  (c :pointer))

(cffi:defcfun ("glIndexub" glIndexub) :void
  (c :unsigned-char))

(cffi:defcfun ("glIndexubv" glIndexubv) :void
  (c :pointer))

(cffi:defcfun ("glInitNames" glInitNames) :void)

(cffi:defcfun ("glInterleavedArrays" glInterleavedArrays) :void
  (format :unsigned-int)
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glIsEnabled" glIsEnabled) :unsigned-char
  (cap :unsigned-int))

(cffi:defcfun ("glIsList" glIsList) :unsigned-char
  (list :unsigned-int))

(cffi:defcfun ("glIsTexture" glIsTexture) :unsigned-char
  (texture :unsigned-int))

(cffi:defcfun ("glLightModelf" glLightModelf) :void
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glLightModelfv" glLightModelfv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glLightModeli" glLightModeli) :void
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glLightModeliv" glLightModeliv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glLightf" glLightf) :void
  (light :unsigned-int)
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glLightfv" glLightfv) :void
  (light :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glLighti" glLighti) :void
  (light :unsigned-int)
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glLightiv" glLightiv) :void
  (light :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glLineStipple" glLineStipple) :void
  (factor :int)
  (pattern :unsigned-short))

(cffi:defcfun ("glLineWidth" glLineWidth) :void
  (width :float))

(cffi:defcfun ("glListBase" glListBase) :void
  (base :unsigned-int))

(cffi:defcfun ("glLoadIdentity" glLoadIdentity) :void)

(cffi:defcfun ("glLoadMatrixd" glLoadMatrixd) :void
  (m :pointer))

(cffi:defcfun ("glLoadMatrixf" glLoadMatrixf) :void
  (m :pointer))

(cffi:defcfun ("glLoadName" glLoadName) :void
  (name :unsigned-int))

(cffi:defcfun ("glLogicOp" glLogicOp) :void
  (opcode :unsigned-int))

(cffi:defcfun ("glMap1d" glMap1d) :void
  (target :unsigned-int)
  (u1 :double)
  (u2 :double)
  (stride :int)
  (order :int)
  (points :pointer))

(cffi:defcfun ("glMap1f" glMap1f) :void
  (target :unsigned-int)
  (u1 :float)
  (u2 :float)
  (stride :int)
  (order :int)
  (points :pointer))

(cffi:defcfun ("glMap2d" glMap2d) :void
  (target :unsigned-int)
  (u1 :double)
  (u2 :double)
  (ustride :int)
  (uorder :int)
  (v1 :double)
  (v2 :double)
  (vstride :int)
  (vorder :int)
  (points :pointer))

(cffi:defcfun ("glMap2f" glMap2f) :void
  (target :unsigned-int)
  (u1 :float)
  (u2 :float)
  (ustride :int)
  (uorder :int)
  (v1 :float)
  (v2 :float)
  (vstride :int)
  (vorder :int)
  (points :pointer))

(cffi:defcfun ("glMapGrid1d" glMapGrid1d) :void
  (un :int)
  (u1 :double)
  (u2 :double))

(cffi:defcfun ("glMapGrid1f" glMapGrid1f) :void
  (un :int)
  (u1 :float)
  (u2 :float))

(cffi:defcfun ("glMapGrid2d" glMapGrid2d) :void
  (un :int)
  (u1 :double)
  (u2 :double)
  (vn :int)
  (v1 :double)
  (v2 :double))

(cffi:defcfun ("glMapGrid2f" glMapGrid2f) :void
  (un :int)
  (u1 :float)
  (u2 :float)
  (vn :int)
  (v1 :float)
  (v2 :float))

(cffi:defcfun ("glMaterialf" glMaterialf) :void
  (face :unsigned-int)
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glMaterialfv" glMaterialfv) :void
  (face :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glMateriali" glMateriali) :void
  (face :unsigned-int)
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glMaterialiv" glMaterialiv) :void
  (face :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glMatrixMode" glMatrixMode) :void
  (mode :unsigned-int))

(cffi:defcfun ("glMinmax" glMinmax) :void
  (target :unsigned-int)
  (internalformat :unsigned-int)
  (sink :unsigned-char))

(cffi:defcfun ("glMultMatrixd" glMultMatrixd) :void
  (m :pointer))

(cffi:defcfun ("glMultMatrixf" glMultMatrixf) :void
  (m :pointer))

(cffi:defcfun ("glNewList" glNewList) :void
  (list :unsigned-int)
  (mode :unsigned-int))

(cffi:defcfun ("glNormal3b" glNormal3b) :void
  (nx :char)
  (ny :char)
  (nz :char))

(cffi:defcfun ("glNormal3bv" glNormal3bv) :void
  (v :pointer))

(cffi:defcfun ("glNormal3d" glNormal3d) :void
  (nx :double)
  (ny :double)
  (nz :double))

(cffi:defcfun ("glNormal3dv" glNormal3dv) :void
  (v :pointer))

(cffi:defcfun ("glNormal3f" glNormal3f) :void
  (nx :float)
  (ny :float)
  (nz :float))

(cffi:defcfun ("glNormal3fv" glNormal3fv) :void
  (v :pointer))

(cffi:defcfun ("glNormal3i" glNormal3i) :void
  (nx :int)
  (ny :int)
  (nz :int))

(cffi:defcfun ("glNormal3iv" glNormal3iv) :void
  (v :pointer))

(cffi:defcfun ("glNormal3s" glNormal3s) :void
  (nx :short)
  (ny :short)
  (nz :short))

(cffi:defcfun ("glNormal3sv" glNormal3sv) :void
  (v :pointer))

(cffi:defcfun ("glNormalPointer" glNormalPointer) :void
  (type :unsigned-int)
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glOrtho" glOrtho) :void
  (left :double)
  (right :double)
  (bottom :double)
  (top :double)
  (zNear :double)
  (zFar :double))

(cffi:defcfun ("glPassThrough" glPassThrough) :void
  (token :float))

(cffi:defcfun ("glPixelMapfv" glPixelMapfv) :void
  (map :unsigned-int)
  (mapsize :int)
  (values :pointer))

(cffi:defcfun ("glPixelMapuiv" glPixelMapuiv) :void
  (map :unsigned-int)
  (mapsize :int)
  (values :pointer))

(cffi:defcfun ("glPixelMapusv" glPixelMapusv) :void
  (map :unsigned-int)
  (mapsize :int)
  (values :pointer))

(cffi:defcfun ("glPixelStoref" glPixelStoref) :void
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glPixelStorei" glPixelStorei) :void
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glPixelTransferf" glPixelTransferf) :void
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glPixelTransferi" glPixelTransferi) :void
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glPixelZoom" glPixelZoom) :void
  (xfactor :float)
  (yfactor :float))

(cffi:defcfun ("glPointSize" glPointSize) :void
  (size :float))

(cffi:defcfun ("glPolygonMode" glPolygonMode) :void
  (face :unsigned-int)
  (mode :unsigned-int))

(cffi:defcfun ("glPolygonOffset" glPolygonOffset) :void
  (factor :float)
  (units :float))

(cffi:defcfun ("glPolygonStipple" glPolygonStipple) :void
  (mask :pointer))

(cffi:defcfun ("glPopAttrib" glPopAttrib) :void)

(cffi:defcfun ("glPopClientAttrib" glPopClientAttrib) :void)

(cffi:defcfun ("glPopMatrix" glPopMatrix) :void)

(cffi:defcfun ("glPopName" glPopName) :void)

(cffi:defcfun ("glPrioritizeTextures" glPrioritizeTextures) :void
  (n :int)
  (textures :pointer)
  (priorities :pointer))

(cffi:defcfun ("glPushAttrib" glPushAttrib) :void
  (mask :unsigned-int))

(cffi:defcfun ("glPushClientAttrib" glPushClientAttrib) :void
  (mask :unsigned-int))

(cffi:defcfun ("glPushMatrix" glPushMatrix) :void)

(cffi:defcfun ("glPushName" glPushName) :void
  (name :unsigned-int))

(cffi:defcfun ("glRasterPos2d" glRasterPos2d) :void
  (x :double)
  (y :double))

(cffi:defcfun ("glRasterPos2dv" glRasterPos2dv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos2f" glRasterPos2f) :void
  (x :float)
  (y :float))

(cffi:defcfun ("glRasterPos2fv" glRasterPos2fv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos2i" glRasterPos2i) :void
  (x :int)
  (y :int))

(cffi:defcfun ("glRasterPos2iv" glRasterPos2iv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos2s" glRasterPos2s) :void
  (x :short)
  (y :short))

(cffi:defcfun ("glRasterPos2sv" glRasterPos2sv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos3d" glRasterPos3d) :void
  (x :double)
  (y :double)
  (z :double))

(cffi:defcfun ("glRasterPos3dv" glRasterPos3dv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos3f" glRasterPos3f) :void
  (x :float)
  (y :float)
  (z :float))

(cffi:defcfun ("glRasterPos3fv" glRasterPos3fv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos3i" glRasterPos3i) :void
  (x :int)
  (y :int)
  (z :int))

(cffi:defcfun ("glRasterPos3iv" glRasterPos3iv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos3s" glRasterPos3s) :void
  (x :short)
  (y :short)
  (z :short))

(cffi:defcfun ("glRasterPos3sv" glRasterPos3sv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos4d" glRasterPos4d) :void
  (x :double)
  (y :double)
  (z :double)
  (w :double))

(cffi:defcfun ("glRasterPos4dv" glRasterPos4dv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos4f" glRasterPos4f) :void
  (x :float)
  (y :float)
  (z :float)
  (w :float))

(cffi:defcfun ("glRasterPos4fv" glRasterPos4fv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos4i" glRasterPos4i) :void
  (x :int)
  (y :int)
  (z :int)
  (w :int))

(cffi:defcfun ("glRasterPos4iv" glRasterPos4iv) :void
  (v :pointer))

(cffi:defcfun ("glRasterPos4s" glRasterPos4s) :void
  (x :short)
  (y :short)
  (z :short)
  (w :short))

(cffi:defcfun ("glRasterPos4sv" glRasterPos4sv) :void
  (v :pointer))

(cffi:defcfun ("glReadBuffer" glReadBuffer) :void
  (mode :unsigned-int))

(cffi:defcfun ("glReadPixels" glReadPixels) :void
  (x :int)
  (y :int)
  (width :int)
  (height :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (pixels :pointer))

(cffi:defcfun ("glRectd" glRectd) :void
  (x1 :double)
  (y1 :double)
  (x2 :double)
  (y2 :double))

(cffi:defcfun ("glRectdv" glRectdv) :void
  (v1 :pointer)
  (v2 :pointer))

(cffi:defcfun ("glRectf" glRectf) :void
  (x1 :float)
  (y1 :float)
  (x2 :float)
  (y2 :float))

(cffi:defcfun ("glRectfv" glRectfv) :void
  (v1 :pointer)
  (v2 :pointer))

(cffi:defcfun ("glRecti" glRecti) :void
  (x1 :int)
  (y1 :int)
  (x2 :int)
  (y2 :int))

(cffi:defcfun ("glRectiv" glRectiv) :void
  (v1 :pointer)
  (v2 :pointer))

(cffi:defcfun ("glRects" glRects) :void
  (x1 :short)
  (y1 :short)
  (x2 :short)
  (y2 :short))

(cffi:defcfun ("glRectsv" glRectsv) :void
  (v1 :pointer)
  (v2 :pointer))

(cffi:defcfun ("glRenderMode" glRenderMode) :int
  (mode :unsigned-int))

(cffi:defcfun ("glResetHistogram" glResetHistogram) :void
  (target :unsigned-int))

(cffi:defcfun ("glResetMinmax" glResetMinmax) :void
  (target :unsigned-int))

(cffi:defcfun ("glRotated" glRotated) :void
  (angle :double)
  (x :double)
  (y :double)
  (z :double))

(cffi:defcfun ("glRotatef" glRotatef) :void
  (angle :float)
  (x :float)
  (y :float)
  (z :float))

(cffi:defcfun ("glScaled" glScaled) :void
  (x :double)
  (y :double)
  (z :double))

(cffi:defcfun ("glScalef" glScalef) :void
  (x :float)
  (y :float)
  (z :float))

(cffi:defcfun ("glScissor" glScissor) :void
  (x :int)
  (y :int)
  (width :int)
  (height :int))

(cffi:defcfun ("glSelectBuffer" glSelectBuffer) :void
  (size :int)
  (buffer :pointer))

(cffi:defcfun ("glSeparableFilter2D" glSeparableFilter2D) :void
  (target :unsigned-int)
  (internalformat :unsigned-int)
  (width :int)
  (height :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (row :pointer)
  (column :pointer))

(cffi:defcfun ("glShadeModel" glShadeModel) :void
  (mode :unsigned-int))

(cffi:defcfun ("glStencilFunc" glStencilFunc) :void
  (func :unsigned-int)
  (ref :int)
  (mask :unsigned-int))

(cffi:defcfun ("glStencilMask" glStencilMask) :void
  (mask :unsigned-int))

(cffi:defcfun ("glStencilOp" glStencilOp) :void
  (fail :unsigned-int)
  (zfail :unsigned-int)
  (zpass :unsigned-int))

(cffi:defcfun ("glTexCoord1d" glTexCoord1d) :void
  (s :double))

(cffi:defcfun ("glTexCoord1dv" glTexCoord1dv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord1f" glTexCoord1f) :void
  (s :float))

(cffi:defcfun ("glTexCoord1fv" glTexCoord1fv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord1i" glTexCoord1i) :void
  (s :int))

(cffi:defcfun ("glTexCoord1iv" glTexCoord1iv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord1s" glTexCoord1s) :void
  (s :short))

(cffi:defcfun ("glTexCoord1sv" glTexCoord1sv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord2d" glTexCoord2d) :void
  (s :double)
  (t_arg1 :double))

(cffi:defcfun ("glTexCoord2dv" glTexCoord2dv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord2f" glTexCoord2f) :void
  (s :float)
  (t_arg1 :float))

(cffi:defcfun ("glTexCoord2fv" glTexCoord2fv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord2i" glTexCoord2i) :void
  (s :int)
  (t_arg1 :int))

(cffi:defcfun ("glTexCoord2iv" glTexCoord2iv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord2s" glTexCoord2s) :void
  (s :short)
  (t_arg1 :short))

(cffi:defcfun ("glTexCoord2sv" glTexCoord2sv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord3d" glTexCoord3d) :void
  (s :double)
  (t_arg1 :double)
  (r :double))

(cffi:defcfun ("glTexCoord3dv" glTexCoord3dv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord3f" glTexCoord3f) :void
  (s :float)
  (t_arg1 :float)
  (r :float))

(cffi:defcfun ("glTexCoord3fv" glTexCoord3fv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord3i" glTexCoord3i) :void
  (s :int)
  (t_arg1 :int)
  (r :int))

(cffi:defcfun ("glTexCoord3iv" glTexCoord3iv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord3s" glTexCoord3s) :void
  (s :short)
  (t_arg1 :short)
  (r :short))

(cffi:defcfun ("glTexCoord3sv" glTexCoord3sv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord4d" glTexCoord4d) :void
  (s :double)
  (t_arg1 :double)
  (r :double)
  (q :double))

(cffi:defcfun ("glTexCoord4dv" glTexCoord4dv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord4f" glTexCoord4f) :void
  (s :float)
  (t_arg1 :float)
  (r :float)
  (q :float))

(cffi:defcfun ("glTexCoord4fv" glTexCoord4fv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord4i" glTexCoord4i) :void
  (s :int)
  (t_arg1 :int)
  (r :int)
  (q :int))

(cffi:defcfun ("glTexCoord4iv" glTexCoord4iv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoord4s" glTexCoord4s) :void
  (s :short)
  (t_arg1 :short)
  (r :short)
  (q :short))

(cffi:defcfun ("glTexCoord4sv" glTexCoord4sv) :void
  (v :pointer))

(cffi:defcfun ("glTexCoordPointer" glTexCoordPointer) :void
  (size :int)
  (type :unsigned-int)
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glTexEnvf" glTexEnvf) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glTexEnvfv" glTexEnvfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glTexEnvi" glTexEnvi) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glTexEnviv" glTexEnviv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glTexGend" glTexGend) :void
  (coord :unsigned-int)
  (pname :unsigned-int)
  (param :double))

(cffi:defcfun ("glTexGendv" glTexGendv) :void
  (coord :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glTexGenf" glTexGenf) :void
  (coord :unsigned-int)
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glTexGenfv" glTexGenfv) :void
  (coord :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glTexGeni" glTexGeni) :void
  (coord :unsigned-int)
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glTexGeniv" glTexGeniv) :void
  (coord :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glTexImage1D" glTexImage1D) :void
  (target :unsigned-int)
  (level :int)
  (internalformat :unsigned-int)
  (width :int)
  (border :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (pixels :pointer))

(cffi:defcfun ("glTexImage2D" glTexImage2D) :void
  (target :unsigned-int)
  (level :int)
  (internalformat :unsigned-int)
  (width :int)
  (height :int)
  (border :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (pixels :pointer))

(cffi:defcfun ("glTexImage3D" glTexImage3D) :void
  (target :unsigned-int)
  (level :int)
  (internalformat :unsigned-int)
  (width :int)
  (height :int)
  (depth :int)
  (border :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (pixels :pointer))

(cffi:defcfun ("glTexParameterf" glTexParameterf) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glTexParameterfv" glTexParameterfv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glTexParameteri" glTexParameteri) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glTexParameteriv" glTexParameteriv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glTexSubImage1D" glTexSubImage1D) :void
  (target :unsigned-int)
  (level :int)
  (xoffset :int)
  (width :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (pixels :pointer))

(cffi:defcfun ("glTexSubImage2D" glTexSubImage2D) :void
  (target :unsigned-int)
  (level :int)
  (xoffset :int)
  (yoffset :int)
  (width :int)
  (height :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (pixels :pointer))

(cffi:defcfun ("glTexSubImage3D" glTexSubImage3D) :void
  (target :unsigned-int)
  (level :int)
  (xoffset :int)
  (yoffset :int)
  (zoffset :int)
  (width :int)
  (height :int)
  (depth :int)
  (format :unsigned-int)
  (type :unsigned-int)
  (pixels :pointer))

(cffi:defcfun ("glTranslated" glTranslated) :void
  (x :double)
  (y :double)
  (z :double))

(cffi:defcfun ("glTranslatef" glTranslatef) :void
  (x :float)
  (y :float)
  (z :float))

(cffi:defcfun ("glVertex2d" glVertex2d) :void
  (x :double)
  (y :double))

(cffi:defcfun ("glVertex2dv" glVertex2dv) :void
  (v :pointer))

(cffi:defcfun ("glVertex2f" glVertex2f) :void
  (x :float)
  (y :float))

(cffi:defcfun ("glVertex2fv" glVertex2fv) :void
  (v :pointer))

(cffi:defcfun ("glVertex2i" glVertex2i) :void
  (x :int)
  (y :int))

(cffi:defcfun ("glVertex2iv" glVertex2iv) :void
  (v :pointer))

(cffi:defcfun ("glVertex2s" glVertex2s) :void
  (x :short)
  (y :short))

(cffi:defcfun ("glVertex2sv" glVertex2sv) :void
  (v :pointer))

(cffi:defcfun ("glVertex3d" glVertex3d) :void
  (x :double)
  (y :double)
  (z :double))

(cffi:defcfun ("glVertex3dv" glVertex3dv) :void
  (v :pointer))

(cffi:defcfun ("glVertex3f" glVertex3f) :void
  (x :float)
  (y :float)
  (z :float))

(cffi:defcfun ("glVertex3fv" glVertex3fv) :void
  (v :pointer))

(cffi:defcfun ("glVertex3i" glVertex3i) :void
  (x :int)
  (y :int)
  (z :int))

(cffi:defcfun ("glVertex3iv" glVertex3iv) :void
  (v :pointer))

(cffi:defcfun ("glVertex3s" glVertex3s) :void
  (x :short)
  (y :short)
  (z :short))

(cffi:defcfun ("glVertex3sv" glVertex3sv) :void
  (v :pointer))

(cffi:defcfun ("glVertex4d" glVertex4d) :void
  (x :double)
  (y :double)
  (z :double)
  (w :double))

(cffi:defcfun ("glVertex4dv" glVertex4dv) :void
  (v :pointer))

(cffi:defcfun ("glVertex4f" glVertex4f) :void
  (x :float)
  (y :float)
  (z :float)
  (w :float))

(cffi:defcfun ("glVertex4fv" glVertex4fv) :void
  (v :pointer))

(cffi:defcfun ("glVertex4i" glVertex4i) :void
  (x :int)
  (y :int)
  (z :int)
  (w :int))

(cffi:defcfun ("glVertex4iv" glVertex4iv) :void
  (v :pointer))

(cffi:defcfun ("glVertex4s" glVertex4s) :void
  (x :short)
  (y :short)
  (z :short)
  (w :short))

(cffi:defcfun ("glVertex4sv" glVertex4sv) :void
  (v :pointer))

(cffi:defcfun ("glVertexPointer" glVertexPointer) :void
  (size :int)
  (type :unsigned-int)
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glViewport" glViewport) :void
  (x :int)
  (y :int)
  (width :int)
  (height :int))

(cffi:defcfun ("glSampleCoverage" glSampleCoverage) :void
  (value :float)
  (invert :unsigned-char))

(cffi:defcfun ("glSamplePass" glSamplePass) :void
  (pass :unsigned-int))

(cffi:defcfun ("glLoadTransposeMatrixf" glLoadTransposeMatrixf) :void
  (m :pointer))

(cffi:defcfun ("glLoadTransposeMatrixd" glLoadTransposeMatrixd) :void
  (m :pointer))

(cffi:defcfun ("glMultTransposeMatrixf" glMultTransposeMatrixf) :void
  (m :pointer))

(cffi:defcfun ("glMultTransposeMatrixd" glMultTransposeMatrixd) :void
  (m :pointer))

(cffi:defcfun ("glCompressedTexImage3D" glCompressedTexImage3D) :void
  (target :unsigned-int)
  (level :int)
  (internalformat :unsigned-int)
  (width :int)
  (height :int)
  (depth :int)
  (border :int)
  (imageSize :int)
  (data :pointer))

(cffi:defcfun ("glCompressedTexImage2D" glCompressedTexImage2D) :void
  (target :unsigned-int)
  (level :int)
  (internalformat :unsigned-int)
  (width :int)
  (height :int)
  (border :int)
  (imageSize :int)
  (data :pointer))

(cffi:defcfun ("glCompressedTexImage1D" glCompressedTexImage1D) :void
  (target :unsigned-int)
  (level :int)
  (internalformat :unsigned-int)
  (width :int)
  (border :int)
  (imageSize :int)
  (data :pointer))

(cffi:defcfun ("glCompressedTexSubImage3D" glCompressedTexSubImage3D) :void
  (target :unsigned-int)
  (level :int)
  (xoffset :int)
  (yoffset :int)
  (zoffset :int)
  (width :int)
  (height :int)
  (depth :int)
  (format :unsigned-int)
  (imageSize :int)
  (data :pointer))

(cffi:defcfun ("glCompressedTexSubImage2D" glCompressedTexSubImage2D) :void
  (target :unsigned-int)
  (level :int)
  (xoffset :int)
  (yoffset :int)
  (width :int)
  (height :int)
  (format :unsigned-int)
  (imageSize :int)
  (data :pointer))

(cffi:defcfun ("glCompressedTexSubImage1D" glCompressedTexSubImage1D) :void
  (target :unsigned-int)
  (level :int)
  (xoffset :int)
  (width :int)
  (format :unsigned-int)
  (imageSize :int)
  (data :pointer))

(cffi:defcfun ("glGetCompressedTexImage" glGetCompressedTexImage) :void
  (target :unsigned-int)
  (lod :int)
  (img :pointer))

(cffi:defcfun ("glActiveTexture" glActiveTexture) :void
  (texture :unsigned-int))

(cffi:defcfun ("glClientActiveTexture" glClientActiveTexture) :void
  (texture :unsigned-int))

(cffi:defcfun ("glMultiTexCoord1d" glMultiTexCoord1d) :void
  (target :unsigned-int)
  (s :double))

(cffi:defcfun ("glMultiTexCoord1dv" glMultiTexCoord1dv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord1f" glMultiTexCoord1f) :void
  (target :unsigned-int)
  (s :float))

(cffi:defcfun ("glMultiTexCoord1fv" glMultiTexCoord1fv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord1i" glMultiTexCoord1i) :void
  (target :unsigned-int)
  (s :int))

(cffi:defcfun ("glMultiTexCoord1iv" glMultiTexCoord1iv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord1s" glMultiTexCoord1s) :void
  (target :unsigned-int)
  (s :short))

(cffi:defcfun ("glMultiTexCoord1sv" glMultiTexCoord1sv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord2d" glMultiTexCoord2d) :void
  (target :unsigned-int)
  (s :double)
  (t_arg2 :double))

(cffi:defcfun ("glMultiTexCoord2dv" glMultiTexCoord2dv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord2f" glMultiTexCoord2f) :void
  (target :unsigned-int)
  (s :float)
  (t_arg2 :float))

(cffi:defcfun ("glMultiTexCoord2fv" glMultiTexCoord2fv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord2i" glMultiTexCoord2i) :void
  (target :unsigned-int)
  (s :int)
  (t_arg2 :int))

(cffi:defcfun ("glMultiTexCoord2iv" glMultiTexCoord2iv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord2s" glMultiTexCoord2s) :void
  (target :unsigned-int)
  (s :short)
  (t_arg2 :short))

(cffi:defcfun ("glMultiTexCoord2sv" glMultiTexCoord2sv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord3d" glMultiTexCoord3d) :void
  (target :unsigned-int)
  (s :double)
  (t_arg2 :double)
  (r :double))

(cffi:defcfun ("glMultiTexCoord3dv" glMultiTexCoord3dv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord3f" glMultiTexCoord3f) :void
  (target :unsigned-int)
  (s :float)
  (t_arg2 :float)
  (r :float))

(cffi:defcfun ("glMultiTexCoord3fv" glMultiTexCoord3fv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord3i" glMultiTexCoord3i) :void
  (target :unsigned-int)
  (s :int)
  (t_arg2 :int)
  (r :int))

(cffi:defcfun ("glMultiTexCoord3iv" glMultiTexCoord3iv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord3s" glMultiTexCoord3s) :void
  (target :unsigned-int)
  (s :short)
  (t_arg2 :short)
  (r :short))

(cffi:defcfun ("glMultiTexCoord3sv" glMultiTexCoord3sv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord4d" glMultiTexCoord4d) :void
  (target :unsigned-int)
  (s :double)
  (t_arg2 :double)
  (r :double)
  (q :double))

(cffi:defcfun ("glMultiTexCoord4dv" glMultiTexCoord4dv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord4f" glMultiTexCoord4f) :void
  (target :unsigned-int)
  (s :float)
  (t_arg2 :float)
  (r :float)
  (q :float))

(cffi:defcfun ("glMultiTexCoord4fv" glMultiTexCoord4fv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord4i" glMultiTexCoord4i) :void
  (target :unsigned-int)
  (arg1 :int)
  (s :int)
  (t_arg3 :int)
  (r :int))

(cffi:defcfun ("glMultiTexCoord4iv" glMultiTexCoord4iv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glMultiTexCoord4s" glMultiTexCoord4s) :void
  (target :unsigned-int)
  (s :short)
  (t_arg2 :short)
  (r :short)
  (q :short))

(cffi:defcfun ("glMultiTexCoord4sv" glMultiTexCoord4sv) :void
  (target :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glFogCoordf" glFogCoordf) :void
  (coord :float))

(cffi:defcfun ("glFogCoordfv" glFogCoordfv) :void
  (coord :pointer))

(cffi:defcfun ("glFogCoordd" glFogCoordd) :void
  (coord :double))

(cffi:defcfun ("glFogCoorddv" glFogCoorddv) :void
  (coord :pointer))

(cffi:defcfun ("glFogCoordPointer" glFogCoordPointer) :void
  (type :unsigned-int)
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glSecondaryColor3b" glSecondaryColor3b) :void
  (red :char)
  (green :char)
  (blue :char))

(cffi:defcfun ("glSecondaryColor3bv" glSecondaryColor3bv) :void
  (v :pointer))

(cffi:defcfun ("glSecondaryColor3d" glSecondaryColor3d) :void
  (red :double)
  (green :double)
  (blue :double))

(cffi:defcfun ("glSecondaryColor3dv" glSecondaryColor3dv) :void
  (v :pointer))

(cffi:defcfun ("glSecondaryColor3f" glSecondaryColor3f) :void
  (red :float)
  (green :float)
  (blue :float))

(cffi:defcfun ("glSecondaryColor3fv" glSecondaryColor3fv) :void
  (v :pointer))

(cffi:defcfun ("glSecondaryColor3i" glSecondaryColor3i) :void
  (red :int)
  (green :int)
  (blue :int))

(cffi:defcfun ("glSecondaryColor3iv" glSecondaryColor3iv) :void
  (v :pointer))

(cffi:defcfun ("glSecondaryColor3s" glSecondaryColor3s) :void
  (red :short)
  (green :short)
  (blue :short))

(cffi:defcfun ("glSecondaryColor3sv" glSecondaryColor3sv) :void
  (v :pointer))

(cffi:defcfun ("glSecondaryColor3ub" glSecondaryColor3ub) :void
  (red :unsigned-char)
  (green :unsigned-char)
  (blue :unsigned-char))

(cffi:defcfun ("glSecondaryColor3ubv" glSecondaryColor3ubv) :void
  (v :pointer))

(cffi:defcfun ("glSecondaryColor3ui" glSecondaryColor3ui) :void
  (red :unsigned-int)
  (green :unsigned-int)
  (blue :unsigned-int))

(cffi:defcfun ("glSecondaryColor3uiv" glSecondaryColor3uiv) :void
  (v :pointer))

(cffi:defcfun ("glSecondaryColor3us" glSecondaryColor3us) :void
  (red :unsigned-short)
  (green :unsigned-short)
  (blue :unsigned-short))

(cffi:defcfun ("glSecondaryColor3usv" glSecondaryColor3usv) :void
  (v :pointer))

(cffi:defcfun ("glSecondaryColorPointer" glSecondaryColorPointer) :void
  (size :int)
  (type :unsigned-int)
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glPointParameterf" glPointParameterf) :void
  (pname :unsigned-int)
  (param :float))

(cffi:defcfun ("glPointParameterfv" glPointParameterfv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glPointParameteri" glPointParameteri) :void
  (pname :unsigned-int)
  (param :int))

(cffi:defcfun ("glPointParameteriv" glPointParameteriv) :void
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glBlendFuncSeparate" glBlendFuncSeparate) :void
  (srcRGB :unsigned-int)
  (dstRGB :unsigned-int)
  (srcAlpha :unsigned-int)
  (dstAlpha :unsigned-int))

(cffi:defcfun ("glMultiDrawArrays" glMultiDrawArrays) :void
  (mode :unsigned-int)
  (first :pointer)
  (count :pointer)
  (primcount :int))

(cffi:defcfun ("glMultiDrawElements" glMultiDrawElements) :void
  (mode :unsigned-int)
  (count :pointer)
  (type :unsigned-int)
  (indices :pointer)
  (primcount :int))

(cffi:defcfun ("glWindowPos2d" glWindowPos2d) :void
  (x :double)
  (y :double))

(cffi:defcfun ("glWindowPos2dv" glWindowPos2dv) :void
  (v :pointer))

(cffi:defcfun ("glWindowPos2f" glWindowPos2f) :void
  (x :float)
  (y :float))

(cffi:defcfun ("glWindowPos2fv" glWindowPos2fv) :void
  (v :pointer))

(cffi:defcfun ("glWindowPos2i" glWindowPos2i) :void
  (x :int)
  (y :int))

(cffi:defcfun ("glWindowPos2iv" glWindowPos2iv) :void
  (v :pointer))

(cffi:defcfun ("glWindowPos2s" glWindowPos2s) :void
  (x :short)
  (y :short))

(cffi:defcfun ("glWindowPos2sv" glWindowPos2sv) :void
  (v :pointer))

(cffi:defcfun ("glWindowPos3d" glWindowPos3d) :void
  (x :double)
  (y :double)
  (z :double))

(cffi:defcfun ("glWindowPos3dv" glWindowPos3dv) :void
  (v :pointer))

(cffi:defcfun ("glWindowPos3f" glWindowPos3f) :void
  (x :float)
  (y :float)
  (z :float))

(cffi:defcfun ("glWindowPos3fv" glWindowPos3fv) :void
  (v :pointer))

(cffi:defcfun ("glWindowPos3i" glWindowPos3i) :void
  (x :int)
  (y :int)
  (z :int))

(cffi:defcfun ("glWindowPos3iv" glWindowPos3iv) :void
  (v :pointer))

(cffi:defcfun ("glWindowPos3s" glWindowPos3s) :void
  (x :short)
  (y :short)
  (z :short))

(cffi:defcfun ("glWindowPos3sv" glWindowPos3sv) :void
  (v :pointer))

(cffi:defcfun ("glGenQueries" glGenQueries) :void
  (n :int)
  (ids :pointer))

(cffi:defcfun ("glDeleteQueries" glDeleteQueries) :void
  (n :int)
  (ids :pointer))

(cffi:defcfun ("glIsQuery" glIsQuery) :unsigned-char
  (id :unsigned-int))

(cffi:defcfun ("glBeginQuery" glBeginQuery) :void
  (target :unsigned-int)
  (id :unsigned-int))

(cffi:defcfun ("glEndQuery" glEndQuery) :void
  (target :unsigned-int))

(cffi:defcfun ("glGetQueryiv" glGetQueryiv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetQueryObjectiv" glGetQueryObjectiv) :void
  (id :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetQueryObjectuiv" glGetQueryObjectuiv) :void
  (id :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glBindBuffer" glBindBuffer) :void
  (target :unsigned-int)
  (buffer :unsigned-int))

(cffi:defcfun ("glDeleteBuffers" glDeleteBuffers) :void
  (n :int)
  (buffers :pointer))

(cffi:defcfun ("glGenBuffers" glGenBuffers) :void
  (n :int)
  (buffers :pointer))

(cffi:defcfun ("glIsBuffer" glIsBuffer) :unsigned-char
  (buffer :unsigned-int))

(cffi:defcfun ("glBufferData" glBufferData) :void
  (target :unsigned-int)
  (size :long)
  (data :pointer)
  (usage :unsigned-int))

(cffi:defcfun ("glBufferSubData" glBufferSubData) :void
  (target :unsigned-int)
  (offset :long)
  (size :long)
  (data :pointer))

(cffi:defcfun ("glGetBufferSubData" glGetBufferSubData) :void
  (target :unsigned-int)
  (offset :long)
  (size :long)
  (data :pointer))

(cffi:defcfun ("glMapBuffer" glMapBuffer) :pointer
  (target :unsigned-int)
  (access :unsigned-int))

(cffi:defcfun ("glUnmapBuffer" glUnmapBuffer) :unsigned-char
  (target :unsigned-int))

(cffi:defcfun ("glGetBufferParameteriv" glGetBufferParameteriv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetBufferPointerv" glGetBufferPointerv) :void
  (target :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glDrawBuffers" glDrawBuffers) :void
  (n :int)
  (bufs :pointer))

(cffi:defcfun ("glVertexAttrib1d" glVertexAttrib1d) :void
  (index :unsigned-int)
  (x :double))

(cffi:defcfun ("glVertexAttrib1dv" glVertexAttrib1dv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib1f" glVertexAttrib1f) :void
  (index :unsigned-int)
  (x :float))

(cffi:defcfun ("glVertexAttrib1fv" glVertexAttrib1fv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib1s" glVertexAttrib1s) :void
  (index :unsigned-int)
  (x :short))

(cffi:defcfun ("glVertexAttrib1sv" glVertexAttrib1sv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib2d" glVertexAttrib2d) :void
  (index :unsigned-int)
  (x :double)
  (y :double))

(cffi:defcfun ("glVertexAttrib2dv" glVertexAttrib2dv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib2f" glVertexAttrib2f) :void
  (index :unsigned-int)
  (x :float)
  (y :float))

(cffi:defcfun ("glVertexAttrib2fv" glVertexAttrib2fv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib2s" glVertexAttrib2s) :void
  (index :unsigned-int)
  (x :short)
  (y :short))

(cffi:defcfun ("glVertexAttrib2sv" glVertexAttrib2sv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib3d" glVertexAttrib3d) :void
  (index :unsigned-int)
  (x :double)
  (y :double)
  (z :double))

(cffi:defcfun ("glVertexAttrib3dv" glVertexAttrib3dv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib3f" glVertexAttrib3f) :void
  (index :unsigned-int)
  (x :float)
  (y :float)
  (z :float))

(cffi:defcfun ("glVertexAttrib3fv" glVertexAttrib3fv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib3s" glVertexAttrib3s) :void
  (index :unsigned-int)
  (x :short)
  (y :short)
  (z :short))

(cffi:defcfun ("glVertexAttrib3sv" glVertexAttrib3sv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4Nbv" glVertexAttrib4Nbv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4Niv" glVertexAttrib4Niv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4Nsv" glVertexAttrib4Nsv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4Nub" glVertexAttrib4Nub) :void
  (index :unsigned-int)
  (x :unsigned-char)
  (y :unsigned-char)
  (z :unsigned-char)
  (w :unsigned-char))

(cffi:defcfun ("glVertexAttrib4Nubv" glVertexAttrib4Nubv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4Nuiv" glVertexAttrib4Nuiv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4Nusv" glVertexAttrib4Nusv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4bv" glVertexAttrib4bv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4d" glVertexAttrib4d) :void
  (index :unsigned-int)
  (x :double)
  (y :double)
  (z :double)
  (w :double))

(cffi:defcfun ("glVertexAttrib4dv" glVertexAttrib4dv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4f" glVertexAttrib4f) :void
  (index :unsigned-int)
  (x :float)
  (y :float)
  (z :float)
  (w :float))

(cffi:defcfun ("glVertexAttrib4fv" glVertexAttrib4fv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4iv" glVertexAttrib4iv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4s" glVertexAttrib4s) :void
  (index :unsigned-int)
  (x :short)
  (y :short)
  (z :short)
  (w :short))

(cffi:defcfun ("glVertexAttrib4sv" glVertexAttrib4sv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4ubv" glVertexAttrib4ubv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4uiv" glVertexAttrib4uiv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttrib4usv" glVertexAttrib4usv) :void
  (index :unsigned-int)
  (v :pointer))

(cffi:defcfun ("glVertexAttribPointer" glVertexAttribPointer) :void
  (index :unsigned-int)
  (size :int)
  (type :unsigned-int)
  (normalized :unsigned-char)
  (stride :int)
  (pointer :pointer))

(cffi:defcfun ("glEnableVertexAttribArray" glEnableVertexAttribArray) :void
  (index :unsigned-int))

(cffi:defcfun ("glDisableVertexAttribArray" glDisableVertexAttribArray) :void
  (index :unsigned-int))

(cffi:defcfun ("glGetVertexAttribdv" glGetVertexAttribdv) :void
  (index :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetVertexAttribfv" glGetVertexAttribfv) :void
  (index :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetVertexAttribiv" glGetVertexAttribiv) :void
  (index :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetVertexAttribPointerv" glGetVertexAttribPointerv) :void
  (index :unsigned-int)
  (pname :unsigned-int)
  (pointer :pointer))

(cffi:defcfun ("glDeleteShader" glDeleteShader) :void
  (shader :unsigned-int))

(cffi:defcfun ("glDetachShader" glDetachShader) :void
  (program :unsigned-int)
  (shader :unsigned-int))

(cffi:defcfun ("glCreateShader" glCreateShader) :unsigned-int
  (type :unsigned-int))

(cffi:defcfun ("glShaderSource" glShaderSource) :void
  (shader :unsigned-int)
  (count :int)
  (string :pointer)
  (length :pointer))

(cffi:defcfun ("glCompileShader" glCompileShader) :void
  (shader :unsigned-int))

(cffi:defcfun ("glCreateProgram" glCreateProgram) :unsigned-int)

(cffi:defcfun ("glAttachShader" glAttachShader) :void
  (program :unsigned-int)
  (shader :unsigned-int))

(cffi:defcfun ("glLinkProgram" glLinkProgram) :void
  (program :unsigned-int))

(cffi:defcfun ("glUseProgram" glUseProgram) :void
  (program :unsigned-int))

(cffi:defcfun ("glDeleteProgram" glDeleteProgram) :void
  (program :unsigned-int))

(cffi:defcfun ("glValidateProgram" glValidateProgram) :void
  (program :unsigned-int))

(cffi:defcfun ("glUniform1f" glUniform1f) :void
  (location :int)
  (v0 :float))

(cffi:defcfun ("glUniform2f" glUniform2f) :void
  (location :int)
  (v0 :float)
  (v1 :float))

(cffi:defcfun ("glUniform3f" glUniform3f) :void
  (location :int)
  (v0 :float)
  (v1 :float)
  (v2 :float))

(cffi:defcfun ("glUniform4f" glUniform4f) :void
  (location :int)
  (v0 :float)
  (v1 :float)
  (v2 :float)
  (v3 :float))

(cffi:defcfun ("glUniform1i" glUniform1i) :void
  (location :int)
  (v0 :int))

(cffi:defcfun ("glUniform2i" glUniform2i) :void
  (location :int)
  (v0 :int)
  (v1 :int))

(cffi:defcfun ("glUniform3i" glUniform3i) :void
  (location :int)
  (v0 :int)
  (v1 :int)
  (v2 :int))

(cffi:defcfun ("glUniform4i" glUniform4i) :void
  (location :int)
  (v0 :int)
  (v1 :int)
  (v2 :int)
  (v3 :int))

(cffi:defcfun ("glUniform1fv" glUniform1fv) :void
  (location :int)
  (count :int)
  (value :pointer))

(cffi:defcfun ("glUniform2fv" glUniform2fv) :void
  (location :int)
  (count :int)
  (value :pointer))

(cffi:defcfun ("glUniform3fv" glUniform3fv) :void
  (location :int)
  (count :int)
  (value :pointer))

(cffi:defcfun ("glUniform4fv" glUniform4fv) :void
  (location :int)
  (count :int)
  (value :pointer))

(cffi:defcfun ("glUniform1iv" glUniform1iv) :void
  (location :int)
  (count :int)
  (value :pointer))

(cffi:defcfun ("glUniform2iv" glUniform2iv) :void
  (location :int)
  (count :int)
  (value :pointer))

(cffi:defcfun ("glUniform3iv" glUniform3iv) :void
  (location :int)
  (count :int)
  (value :pointer))

(cffi:defcfun ("glUniform4iv" glUniform4iv) :void
  (location :int)
  (count :int)
  (value :pointer))

(cffi:defcfun ("glUniformMatrix2fv" glUniformMatrix2fv) :void
  (location :int)
  (count :int)
  (transpose :unsigned-char)
  (value :pointer))

(cffi:defcfun ("glUniformMatrix3fv" glUniformMatrix3fv) :void
  (location :int)
  (count :int)
  (transpose :unsigned-char)
  (value :pointer))

(cffi:defcfun ("glUniformMatrix4fv" glUniformMatrix4fv) :void
  (location :int)
  (count :int)
  (transpose :unsigned-char)
  (value :pointer))

(cffi:defcfun ("glIsShader" glIsShader) :unsigned-char
  (shader :unsigned-int))

(cffi:defcfun ("glIsProgram" glIsProgram) :unsigned-char
  (program :unsigned-int))

(cffi:defcfun ("glGetShaderiv" glGetShaderiv) :void
  (shader :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetProgramiv" glGetProgramiv) :void
  (program :unsigned-int)
  (pname :unsigned-int)
  (params :pointer))

(cffi:defcfun ("glGetAttachedShaders" glGetAttachedShaders) :void
  (program :unsigned-int)
  (maxCount :int)
  (count :pointer)
  (shaders :pointer))

(cffi:defcfun ("glGetShaderInfoLog" glGetShaderInfoLog) :void
  (shader :unsigned-int)
  (bufSize :int)
  (length :pointer)
  (infoLog :string))

(cffi:defcfun ("glGetProgramInfoLog" glGetProgramInfoLog) :void
  (program :unsigned-int)
  (bufSize :int)
  (length :pointer)
  (infoLog :string))

(cffi:defcfun ("glGetUniformLocation" glGetUniformLocation) :int
  (program :unsigned-int)
  (name :string))

(cffi:defcfun ("glGetActiveUniform" glGetActiveUniform) :void
  (program :unsigned-int)
  (index :unsigned-int)
  (bufSize :int)
  (length :pointer)
  (size :pointer)
  (type :pointer)
  (name :string))

(cffi:defcfun ("glGetUniformfv" glGetUniformfv) :void
  (program :unsigned-int)
  (location :int)
  (params :pointer))

(cffi:defcfun ("glGetUniformiv" glGetUniformiv) :void
  (program :unsigned-int)
  (location :int)
  (params :pointer))

(cffi:defcfun ("glGetShaderSource" glGetShaderSource) :void
  (shader :unsigned-int)
  (bufSize :int)
  (length :pointer)
  (source :string))

(cffi:defcfun ("glBindAttribLocation" glBindAttribLocation) :void
  (program :unsigned-int)
  (index :unsigned-int)
  (name :string))

(cffi:defcfun ("glGetActiveAttrib" glGetActiveAttrib) :void
  (program :unsigned-int)
  (index :unsigned-int)
  (bufSize :int)
  (length :pointer)
  (size :pointer)
  (type :pointer)
  (name :string))

(cffi:defcfun ("glGetAttribLocation" glGetAttribLocation) :int
  (program :unsigned-int)
  (name :string))

(cffi:defcfun ("glStencilFuncSeparate" glStencilFuncSeparate) :void
  (face :unsigned-int)
  (func :unsigned-int)
  (ref :int)
  (mask :unsigned-int))

(cffi:defcfun ("glStencilOpSeparate" glStencilOpSeparate) :void
  (face :unsigned-int)
  (fail :unsigned-int)
  (zfail :unsigned-int)
  (zpass :unsigned-int))

(cffi:defcfun ("glStencilMaskSeparate" glStencilMaskSeparate) :void
  (face :unsigned-int)
  (mask :unsigned-int))

(cffi:defcfun ("glUniformMatrix2x3fv" glUniformMatrix2x3fv) :void
  (location :int)
  (count :int)
  (transpose :unsigned-char)
  (value :pointer))

(cffi:defcfun ("glUniformMatrix3x2fv" glUniformMatrix3x2fv) :void
  (location :int)
  (count :int)
  (transpose :unsigned-char)
  (value :pointer))

(cffi:defcfun ("glUniformMatrix2x4fv" glUniformMatrix2x4fv) :void
  (location :int)
  (count :int)
  (transpose :unsigned-char)
  (value :pointer))

(cffi:defcfun ("glUniformMatrix4x2fv" glUniformMatrix4x2fv) :void
  (location :int)
  (count :int)
  (transpose :unsigned-char)
  (value :pointer))

(cffi:defcfun ("glUniformMatrix3x4fv" glUniformMatrix3x4fv) :void
  (location :int)
  (count :int)
  (transpose :unsigned-char)
  (value :pointer))

(cffi:defcfun ("glUniformMatrix4x3fv" glUniformMatrix4x3fv) :void
  (location :int)
  (count :int)
  (transpose :unsigned-char)
  (value :pointer))

