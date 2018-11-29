/*
 * matrix2jpeg_terminate.c
 *
 * Code generation for function 'matrix2jpeg_terminate'
 *
 * C source code generated on: Tue Jul 24 17:32:27 2018
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "matrix2jpeg.h"
#include "matrix2jpeg_terminate.h"

/* Type Definitions */

/* Named Constants */

/* Variable Declarations */

/* Variable Definitions */

/* Function Declarations */

/* Function Definitions */
void matrix2jpeg_atexit(void)
{
  emlrtEnterRtStack(&emlrtContextGlobal);
  emlrtLeaveRtStack(&emlrtContextGlobal);
  emlrtExitTimeCleanup(&emlrtContextGlobal);
}

void matrix2jpeg_terminate(void)
{
  emlrtLeaveRtStack(&emlrtContextGlobal);
}

/* End of code generation (matrix2jpeg_terminate.c) */
