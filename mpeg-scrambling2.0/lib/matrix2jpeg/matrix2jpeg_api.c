/*
 * matrix2jpeg_api.c
 *
 * Code generation for function 'matrix2jpeg_api'
 *
 * C source code generated on: Tue Jul 24 17:32:27 2018
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "matrix2jpeg.h"
#include "matrix2jpeg_api.h"
#include "matrix2jpeg_emxutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRTEInfo b_emlrtRTEI = { 1, 1, "matrix2jpeg_api", "" };

/* Function Declarations */
static void b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId, emxArray_char_T *y);
static void c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId, emxArray_char_T *ret);
static void emlrt_marshallIn(const mxArray *path_matrix, const char_T
  *identifier, emxArray_char_T *y);

/* Function Definitions */
static void b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId, emxArray_char_T *y)
{
  c_emlrt_marshallIn(emlrtAlias(u), parentId, y);
  emlrtDestroyArray(&u);
}

static void c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId, emxArray_char_T *ret)
{
  int32_T iv1[2];
  boolean_T bv0[2];
  int32_T i1;
  static const boolean_T bv1[2] = { FALSE, TRUE };

  for (i1 = 0; i1 < 2; i1++) {
    iv1[i1] = 1 + -2 * i1;
    bv0[i1] = bv1[i1];
  }

  emlrtCheckVsBuiltInCtxR2011b(&emlrtContextGlobal, msgId, src, "char", FALSE,
    2U, iv1, bv0, ret->size);
  i1 = ret->size[0] * ret->size[1];
  ret->size[0] = 1;
  ret->size[1] = ret->size[1];
  emxEnsureCapacity((emxArray__common *)ret, i1, (int32_T)sizeof(char_T),
                    (emlrtRTEInfo *)NULL);
  emlrtImportArrayR2011b(src, ret->data, 1, FALSE);
  emlrtDestroyArray(&src);
}

static void emlrt_marshallIn(const mxArray *path_matrix, const char_T
  *identifier, emxArray_char_T *y)
{
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  b_emlrt_marshallIn(emlrtAlias(path_matrix), &thisId, y);
  emlrtDestroyArray(&path_matrix);
}

void matrix2jpeg_api(const mxArray * const prhs[1])
{
  emxArray_char_T *path_matrix;
  emlrtHeapReferenceStackEnterFcn();
  emxInit_char_T(&path_matrix, 2, &b_emlrtRTEI, TRUE);

  /* Marshall function inputs */
  emlrt_marshallIn(emlrtAliasP(prhs[0]), "path_matrix", path_matrix);

  /* Invoke the target function */
  matrix2jpeg(path_matrix);
  emxFree_char_T(&path_matrix);
  emlrtHeapReferenceStackLeaveFcn();
}

/* End of code generation (matrix2jpeg_api.c) */
