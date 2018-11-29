/*
 * matrix2jpeg_mex.c
 *
 * Code generation for function 'matrix2jpeg'
 *
 * C source code generated on: Tue Jul 24 17:32:27 2018
 *
 */

/* Include files */
#include "mex.h"
#include "matrix2jpeg_api.h"
#include "matrix2jpeg_initialize.h"
#include "matrix2jpeg_terminate.h"

/* Type Definitions */

/* Function Declarations */
static void matrix2jpeg_mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]);
MEXFUNCTION_LINKAGE mxArray *emlrtMexFcnProperties(void);

/* Variable Definitions */
emlrtContext emlrtContextGlobal = { true, false, EMLRT_VERSION_INFO, NULL, "matrix2jpeg", NULL, false, {2045744189U,2170104910U,2743257031U,4284093946U}, 0, false, 1, false };

/* Function Definitions */
static void matrix2jpeg_mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  /* Check for proper number of arguments. */
  if(nrhs != 1) {
    mexErrMsgIdAndTxt("emlcoder:emlmex:WrongNumberOfInputs","1 input required for entry-point 'matrix2jpeg'.");
  } else if(nlhs > 0) {
    mexErrMsgIdAndTxt("emlcoder:emlmex:TooManyOutputArguments","Too many output arguments for entry-point 'matrix2jpeg'.");
  }
  /* Module initialization. */
  matrix2jpeg_initialize(&emlrtContextGlobal);
  /* Call the function. */
  matrix2jpeg_api(prhs);
  /* Module finalization. */
  matrix2jpeg_terminate();
}

void matrix2jpeg_atexit_wrapper(void)
{
  matrix2jpeg_atexit();
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[])
{
  /* Initialize the memory manager. */
  mexAtExit(matrix2jpeg_atexit_wrapper);
  emlrtClearAllocCount(&emlrtContextGlobal, 0, 0, NULL);
  /* Dispatch the entry-point. */
  matrix2jpeg_mexFunction(nlhs, plhs, nrhs, prhs);
}

mxArray *emlrtMexFcnProperties(void)
{
    const char *mexProperties[] = {
        "Version",
        "EntryPoints"};
    const char *epProperties[] = {
        "Name",
        "NumberOfInputs",
        "NumberOfOutputs",
        "ConstantInputs"};
    mxArray *xResult = mxCreateStructMatrix(1,1,2,mexProperties);
    mxArray *xEntryPoints = mxCreateStructMatrix(1,1,4,epProperties);
    mxArray *xInputs = NULL;
    xInputs = mxCreateLogicalMatrix(1, 1);
    mxSetFieldByNumber(xEntryPoints, 0, 0, mxCreateString("matrix2jpeg"));
    mxSetFieldByNumber(xEntryPoints, 0, 1, mxCreateDoubleScalar(1));
    mxSetFieldByNumber(xEntryPoints, 0, 2, mxCreateDoubleScalar(0));
    mxSetFieldByNumber(xEntryPoints, 0, 3, xInputs);
    mxSetFieldByNumber(xResult, 0, 0, mxCreateString("7.14.0.739 (R2012a)"));
    mxSetFieldByNumber(xResult, 0, 1, xEntryPoints);

    return xResult;
}
/* End of code generation (matrix2jpeg_mex.c) */
