/* COMPRESSIONE DATI */
/*
 *	matlab_engine_jpeg.c
 *
 *	Programma che legge un file di testo con una matrice
 *      e creare un file jpeg dalla matrice
 *
 * Copyright 2018 
 * Autore: Lorenzo Vitale
 * Contatti: lorenzodev@gmail.com
 * Company: Università degli studi di Salerno
 * All rights reserved
 */
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "engine.h"
#include "matlab_engine_jpeg.h"

#define  BUFSIZE 256


int main(){
    create_matrix_jpeg("MATRIX/temp_matrix_image.txt");
    return EXIT_SUCCESS;
}


void create_matrix_jpeg(char* path_matrix)

{
	Engine *ep;
	mxArray *T = NULL, *result = NULL;
	char buffer[BUFSIZE+1];
	double time[10] = { 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0 };

	if (!(ep = engOpen(""))) {
		fprintf(stderr, "\nCan't start MATLAB engine\n");
		return EXIT_FAILURE;
	}
        
	T = mxCreateDoubleMatrix(1, 10, mxREAL);
	memcpy((void *)mxGetPr(T), (void *)time, sizeof(time));
	
        
        engEvalString(ep, "A = importdata('MATRIX/temp_matrix_image.txt');");
        engEvalString(ep, "imwrite(uint8(A),'MATRIX/temp_matrix_image.txt.jpeg')");
	engEvalString(ep, "close;");
	engClose(ep);	
	
}
