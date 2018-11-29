/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   scrambling.h
 * Author: Lorenzo Vitale
 *
 * Created on 21 luglio 2018, 16.12
 */

#ifndef SCRAMBLING_H
#define SCRAMBLING_H

#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif

#endif /* SCRAMBLING_H */

/* ---------------- DEFINIZIONE VARIABILI ---------------- */
/* 0 - no, 1 - stampa solo info watermark, 2 - stampa info watermark, messaggi e matrici */
int scrambling;
int N_FRAME;
int cP;
int cx;
int cy;
int modX;
int modY;

void CreateFrameMatrixY(int* matrix, int meta);
void CreateFrameMatrixU(int* matrix);
void CreateFrameMatrixV(int* matrix);

void ChangePixelMatrix(int *matrix, int meta);

void ReplacePixelMatrix(int *matrix, int meta);

void startScrambling();

void ScramblingIterator();

void MpegEncodeSlideScrambling(int Count);