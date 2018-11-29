/*
 * matrix2jpeg.c
 *
 * Code generation for function 'matrix2jpeg'
 *
 * C source code generated on: Tue Jul 24 17:32:27 2018
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "matrix2jpeg.h"
#include "matrix2jpeg_emxutil.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 10, "matrix2jpeg",
  "/home/lorenzo/esempi_matlab/matrix2jpeg.m" };

static emlrtRSInfo b_emlrtRSI = { 11, "matrix2jpeg",
  "/home/lorenzo/esempi_matlab/matrix2jpeg.m" };

static emlrtRSInfo c_emlrtRSI = { 12, "matrix2jpeg",
  "/home/lorenzo/esempi_matlab/matrix2jpeg.m" };

static emlrtMCInfo emlrtMCI = { 10, 5, "matrix2jpeg",
  "/home/lorenzo/esempi_matlab/matrix2jpeg.m" };

static emlrtMCInfo b_emlrtMCI = { 11, 7, "matrix2jpeg",
  "/home/lorenzo/esempi_matlab/matrix2jpeg.m" };

static emlrtMCInfo c_emlrtMCI = { 12, 9, "matrix2jpeg",
  "/home/lorenzo/esempi_matlab/matrix2jpeg.m" };

static emlrtMCInfo d_emlrtMCI = { 12, 1, "matrix2jpeg",
  "/home/lorenzo/esempi_matlab/matrix2jpeg.m" };

static emlrtRTEInfo emlrtRTEI = { 1, 10, "matrix2jpeg",
  "/home/lorenzo/esempi_matlab/matrix2jpeg.m" };

/* Function Declarations */
static const mxArray *b_strcat(const mxArray *b, const mxArray *c, emlrtMCInfo
  *location);
static const mxArray *importdata(const mxArray *b, emlrtMCInfo *location);
static void imwrite(const mxArray *b, const mxArray *c, emlrtMCInfo *location);
static const mxArray *uint8(const mxArray *b, emlrtMCInfo *location);

/* Function Definitions */
static const mxArray *b_strcat(const mxArray *b, const mxArray *c, emlrtMCInfo
  *location)
{
  const mxArray *pArrays[2];
  const mxArray *m2;
  pArrays[0] = b;
  pArrays[1] = c;
  return emlrtCallMATLAB(1, &m2, 2, pArrays, "strcat", TRUE, location);
}

static const mxArray *importdata(const mxArray *b, emlrtMCInfo *location)
{
  const mxArray *pArray;
  const mxArray *m1;
  pArray = b;
  return emlrtCallMATLAB(1, &m1, 1, &pArray, "importdata", TRUE, location);
}

static void imwrite(const mxArray *b, const mxArray *c, emlrtMCInfo *location)
{
  const mxArray *pArrays[2];
  pArrays[0] = b;
  pArrays[1] = c;
  emlrtCallMATLAB(0, NULL, 2, pArrays, "imwrite", TRUE, location);
}

static const mxArray *uint8(const mxArray *b, emlrtMCInfo *location)
{
  const mxArray *pArray;
  const mxArray *m3;
  pArray = b;
  return emlrtCallMATLAB(1, &m3, 1, &pArray, "uint8", TRUE, location);
}

void matrix2jpeg(const emxArray_char_T *path_matrix)
{
  emxArray_char_T *u;
  int32_T i0;
  int32_T loop_ub;
  emxArray_char_T *b_u;
  const mxArray *y;
  const mxArray *m0;
  const mxArray *A = NULL;
  const mxArray *b_y;
  const mxArray *c_y;
  static const int32_T iv0[2] = { 1, 5 };

  static const char_T cv0[5] = { '.', 'j', 'p', 'e', 'g' };

  const mxArray *out = NULL;
  emlrtHeapReferenceStackEnterFcn();
  emxInit_char_T(&u, 2, &emlrtRTEI, TRUE);

  /* CREATE_IMAGE_JPEG Summary of this function goes here */
  /*    Detailed explanation goes here */
  EMLRTPUSHRTSTACK(&emlrtRSI);
  i0 = u->size[0] * u->size[1];
  u->size[0] = 1;
  u->size[1] = path_matrix->size[1];
  emxEnsureCapacity((emxArray__common *)u, i0, (int32_T)sizeof(char_T),
                    &emlrtRTEI);
  loop_ub = path_matrix->size[0] * path_matrix->size[1] - 1;
  for (i0 = 0; i0 <= loop_ub; i0++) {
    u->data[i0] = path_matrix->data[i0];
  }

  emxInit_char_T(&b_u, 2, &emlrtRTEI, TRUE);
  y = NULL;
  m0 = mxCreateCharArray(2, u->size);
  emlrtInitCharArray(u->size[1], m0, u->data);
  emlrtAssign(&y, m0);
  emlrtAssign(&A, importdata(y, &emlrtMCI));
  EMLRTPOPRTSTACK(&emlrtRSI);
  EMLRTPUSHRTSTACK(&b_emlrtRSI);
  i0 = b_u->size[0] * b_u->size[1];
  b_u->size[0] = 1;
  b_u->size[1] = path_matrix->size[1];
  emxEnsureCapacity((emxArray__common *)b_u, i0, (int32_T)sizeof(char_T),
                    &emlrtRTEI);
  emxFree_char_T(&u);
  loop_ub = path_matrix->size[0] * path_matrix->size[1] - 1;
  for (i0 = 0; i0 <= loop_ub; i0++) {
    b_u->data[i0] = path_matrix->data[i0];
  }

  b_y = NULL;
  m0 = mxCreateCharArray(2, b_u->size);
  emlrtInitCharArray(b_u->size[1], m0, b_u->data);
  emlrtAssign(&b_y, m0);
  c_y = NULL;
  m0 = mxCreateCharArray(2, iv0);
  emlrtInitCharArray(5, m0, cv0);
  emlrtAssign(&c_y, m0);
  emlrtAssign(&out, b_strcat(b_y, c_y, &b_emlrtMCI));
  EMLRTPOPRTSTACK(&b_emlrtRSI);
  EMLRTPUSHRTSTACK(&c_emlrtRSI);
  imwrite(uint8(emlrtAlias(A), &c_emlrtMCI), emlrtAlias(out), &d_emlrtMCI);
  EMLRTPOPRTSTACK(&c_emlrtRSI);
  emlrtDestroyArray(&A);
  emlrtDestroyArray(&out);
  emxFree_char_T(&b_u);
  emlrtHeapReferenceStackLeaveFcn();
}

/* End of code generation (matrix2jpeg.c) */
