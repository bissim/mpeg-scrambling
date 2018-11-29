/*
 * matrix2jpeg_emxutil.h
 *
 * Code generation for function 'matrix2jpeg_emxutil'
 *
 * C source code generated on: Tue Jul 24 17:32:27 2018
 *
 */

#ifndef __MATRIX2JPEG_EMXUTIL_H__
#define __MATRIX2JPEG_EMXUTIL_H__
/* Include files */
#include <math.h>
#include <stdlib.h>
#include <string.h>

#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "blascompat32.h"
#include "rtwtypes.h"
#include "matrix2jpeg_types.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */
extern void emxEnsureCapacity(emxArray__common *emxArray, int32_T oldNumel, int32_T elementSize, const emlrtRTEInfo *srcLocation);
extern void emxFree_char_T(emxArray_char_T **pEmxArray);
extern void emxInit_char_T(emxArray_char_T **pEmxArray, int32_T numDimensions, const emlrtRTEInfo *srcLocation, boolean_T doPush);
#endif
/* End of code generation (matrix2jpeg_emxutil.h) */
