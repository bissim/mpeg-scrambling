/* 
 * File:   watermark.h
 * Author: Leo Aniello (aniello.leo@gmail.com) - Salerno University
 * Copyright(C) 2016 Leo Aniello, all rights reserved.
 */

#ifndef WATERMARK_H
#define WATERMARK_H

/* ---------------- DEFINIZIONE MACRO ---------------- */
#define SETBIT(data, pos, value) (data) = (((data) & ~(1 << (pos))) | (((value) & 1) << pos))
#define GETBIT(data, pos) (((data) >> (pos)) & 1)

/* ---------------- DEFINIZIONE COSTANTI ---------------- */
/* Algoritmo Less Significative Bits (LSB) */
#define LSB 1
/* Algoritmo di Cox et al. */
#define COX 2

/* ---------------- DEFINIZIONE VARIABILI ---------------- */
/* 0 - no, 1 - stampa solo info watermark, 2 - stampa info watermark, messaggi e matrici */
int     debugWatermark;
/* Tipo algoritmo watermarking (0 -> no watermarking, 1 -> LSB, 2 -> COX) */
int     watermarkType;
/* Fase watermarking:
 * 1 -> inserimento dimensione watermark,
 * 2 -> inserimento numero coefficienti per blocco da modificare,
 * 3 -> inserimento watermark. */
int     faseWatermarking;
/* Watermark in array di caratteri */
char*   watermarkString;
/* dimensione stringa di watermark */
int     watermarkStringSize;
/* Watermark in array di interi */
int*    watermarkInt;
/* dimensione array interi watermark */
int     watermarkIntSize;
/* indice watermark */
int     watermarkIndex;
/* indice bit del watermark */
int     watermarkBitIndex;
/* Numero di Intra coded macroblock Richiesti per inserire il watermark con i parametri passati */
int     reqNumIPMType;
/* Numero di Intra coded macroblock Usati per inserire il watermark con i parametri passati */
int     usedNumIPMType;
/* Contatore del Numero di Intra coded macroblock */
int     countIPMType;
/* array di mapping del watermark sulla sequenza video */
int*    blockMapWatermark;
/* file di output per il watermark estratto */
FILE*   watermarkOutFile;
/* Coefficiente di inserimento Watermark
 * (default 1 -> numero richiesto di blocchi = 1 * size del watermark (es. in bits)) */
int     CInsWatermark;
/* Numero coefficienti per blocco da modificare [ <= 64 ]
 * (default 1 -> posizione 0 dell'array) */
int     NCBtoMod;
/* seed per la funzione srand() */
int     wSeed;
/* soglia di bits in cui viene diviso l'intero rappresentante il watermark da inserire [Cox] */
int     sogliaBitsWatermark;
/* array dei coefficienti originali prima della modifica [Cox] */
int *   originalCoeff;
/* dimensione array dei coefficienti prima della modifica [Cox] */
int     sizeOriginalCoeff;
/* file di output per i coefficienti originali modificati [Cox] */
FILE*   fdOrigCoef_cox;

/* ---------------- DEFINIZIONE PROTOTIPI FUNZIONI ---------------- */
/*BFUNC
 * getBitsFromInt() is used to convert int value into correspondent bits,
 * the result is content in a string.
 * EFUNC*/
char*   getBitsFromInt(int val);

/*BFUNC
 * getBitsFromChar() is used to convert char value into correspondent bits,
 * the result is content in a string.
 * EFUNC*/
char*   getBitsFromChar(char val);

/*BFUNC
 * getFileToString()
 * legge il file "filePath", restituendone il contenuto in una stringa.
 * 
 * Parametri:
 * char *filePath : path+nome file
 * int *size_OUT : (parametro di OUTPUT) conterrà la dimensione del file
 * 
 * EFUNC*/
char*   getFileToString(char *filePath, int *size_OUT);

/*BFUNC
 * getFileToIntArray()
 * legge il file "filePath", restituendone il contenuto in array di interi.
 * 
 * Parametri:
 * char *filePath : path+nome file
 * int *size_OUT : (parametro di OUTPUT) conterrà la dimensione del file
 * 
 * EFUNC*/
int*    getFileToIntArray(char *filePath, int *size_OUT);

/*BFUNC
 * getFileSize()
 * Return size of file.
 * EFUNC*/
long    getFileSize(char* filePath);

/*BFUNC
 * getRandomArray() è usata per avere un array di dimensione sizeArray:
 * - con le prime "bitsIntestazine" posizioni impostate ad 1;
 * - le successive posizioni avranno "sizeWatermark" valori impostati a "valore",
 *   scelte in maniera random in base al parametro "seed", le restanti settate a 0.
 * EFUNC*/
int*    getRandomArray(int sizeArray, int bitsIntestazione, int sizeWatermark, int seed, int valore);

/*BFUNC
 * splitStringToIntArrayByBit() è usata per estrarre "numBit" alla volta da "charArray"
 * partendo dalla posizione "pos" dell'intero, considerato in bit ( pos 0 bit meno significativo),
 * restituendoli in un array di interi
 * 
 * Parametri:
 * - char* charArray    -> array contenente i caratteri da leggere 
 * - int sizeCharArray  -> dimensione dell'array di caratteri
 * - int numBits        -> numero di bits con cui dividere l'array di caratteri
 * - int *size_OUT      -> (parametro di OUTPUT) conterrà la dimensione dell'array di interi risultante
 * EFUNC*/
int*    splitStringToIntArrayByBit(char* charArray, int sizeCharArray, int numBits, int *size_OUT);

/*BFUNC
 * mergeIntArrayToStringByBit() è usata per unire "numBit" di ogni posizione dell'array di interi "intArray"
 * partendo dalla posizione "pos" dell'intero, considerato in bit ( pos 0 bit meno significativo),
 * restituendoli in una stringa.
 * 
 * Parametri:
 * - int* intArray     -> array contenente gli interi da leggere 
 * - int sizeIntArray   -> dimensione dell'array di interi
 * - int numBits        -> numero di bits con cui dividere l'array di caratteri
 * - int pos            -> posizione del bit di ogni posizione intArray da cui iniziare a prelevare i bits
 * - int *size_OUT      -> (parametro di OUTPUT) conterrà la dimensione della stringa risultante
 * EFUNC*/
char*   mergeIntArrayToStringByBit(int* intArray, int sizeIntArray, int numBits, int pos, int *size_OUT);

/*BFUNC
 * splitIntToIntArrayByBit() è usata per estrarre "numBits" alla volta da "val"
 * e restituirli in un array di interi, partendo dal bit meno significativo ( posizione 0 )
 * 
 * Parametri:
 * - int val            -> intero da leggere 
 * - int numBits        -> numero di bits in cui dividere l'intero
 * - int *size_OUT      -> (parametro di OUTPUT) conterrà la dimensione dell'array di interi risultante
 * EFUNC*/
int*    splitIntToIntArrayByBit(int val, int numBits, int *size_OUT);

/*BFUNC
 * mergeIntArrayToIntByBit() è usata per unire "numBit" di ogni posizione dell'array di interi "intArray"
 * partendo dalla posizione "pos" dell'intero, considerato in bit ( pos 0 bit meno significativo),
 * restituendoli come intero.
 * 
 * Parametri:
 * - int* intArray      -> array contenente gli interi da leggere 
 * - int sizeIntArray   -> dimensione dell'array di interi
 * - int numBits        -> numero di bits da prelevare da ogni posizione dell'array di interi
 * - int pos            -> posizione del bit di ogni posizione intArray da cui iniziare a prelevare i bits
 * EFUNC*/
int     mergeIntArrayToIntByBit(int* intArray, int sizeIntArray, int numBits, int pos);

/* funzioni ausiliarie per gli algoritmi di watermarking */

/*BFUNC
 * initInsWatermarkConfig() e initExtWatermarkConfig()
 * sono usate per inizializzare i parametri di sistema
 * usati dall'algoritmo di watermarking scelto (inserimento / estrazione).
 * EFUNC*/
void    initInsWatermarkConfig();
void    initExtWatermarkConfig();

/*BFUNC
 * finalInsWatermark(), finalExtWatermark()
 * sono usate per eseguire le operazioni necessarie alla fine del processo di watermarking (inserimento / estrazione).
 * EFUNC*/
void    finalInsWatermark();
void    finalExtWatermark();
    
/*BFUNC
 * Algoritmo Least Significant Bit (lsb):
 * insertWatermark_lsb() è usata per inserire i bits nei blocchi scelti, usando l'algoritmo LSB:
 * - i primi 32 blocchi conterranno la dimensione del watermark (intero a 32 bit),
 * - i successivi 6 blocchi conterranno il numero di coefficienti (DCT) modificati per ogni blocco,
 *   all'atto dell'inserimento del watermark. (i coefficienti per ogni blocco sono 64 quindi si
 *   considerano solo i primi 6 bits dell'intero a 32 bits)
 * - i successivi blocchi (quelli selezionati random in fase di inizializzazione), conterranno il watermark.
 *   (in ogni blocco possono essere modificati più coefficienti DCT, in base all'input inserito, inserendone
 *   in ognuno il relativo bit del watermark)
 * 
 * Parametri:
 * - int *matrix     -> array di interi contenente i coefficienti DCT in cui inserire eventualmente il watermark
 * - int countBlock  -> indice blocco corrente (usato per verificare se il blocco è stato scelto per inserire il watermark)
 * EFUNC*/
void    insertWatermark_lsb(int *matrix, int countBlock);

/*BFUNC
 * Algoritmo Least Significant Bit (lsb):
 * extractWatermark_lsb() è usata per estrarre i bits dai blocchi scelti, usando l'algoritmo LSB:
 * - i primi 32 blocchi conterranno la dimensione del watermark (intero a 32 bit),
 * - i successivi 6 blocchi conterranno il numero di coefficienti (DCT) modificati per ogni blocco,
 *   all'atto dell'inserimento del watermark. (i coefficienti per ogni blocco sono 64 quindi si
 *   considerano solo i primi 6 bits dell'intero a 32 bits)
 * - i successivi blocchi (quelli selezionati random in fase di inizializzazione), conterranno il watermark.
 *   (in ogni blocco possono essere modificati più coefficienti DCT, in base all'input inserito, inserendone
 *   in ognuno il relativo bit del watermark)
 * 
 * Parametri:
 * - int *matrix     -> array di interi contenente i coefficienti DCT da cui estrarre il watermark
 * - int countBlock  -> indice blocco corrente (usato per verificare se il blocco contiene il watermark)
 * EFUNC*/
void    extractWatermark_lsb(int *matrix, int countBlock);

/*BFUNC
 * Algoritmo Cox et al.:
 * insertWatermark_cox() è usata per inserire il watermark nei blocchi scelti, usando l'algoritmo Cox et al.
 * 
 * Parametri:
 * - int *matrix     -> array di interi contenente i coefficienti DCT in cui inserire eventualmente il watermark
 * - int countBlock  -> indice blocco corrente (usato per verificare se il blocco è stato scelto per inserire il watermark)
 * EFUNC*/
void    insertWatermark_cox(int *matrix, int countBlock);

/*BFUNC
 * Algoritmo Cox et al.:
 * extractWatermark_cox() è usata per estrarre il watermark dai blocchi scelti, usando l'algoritmo Cox et al.
 * 
 * Parametri:
 * - int *matrix     -> array di interi contenente i coefficienti DCT da cui estrarre il watermark
 * - int countBlock  -> indice blocco corrente (usato per verificare se il blocco contiene il watermark)
 * EFUNC*/
void    extractWatermark_cox(int *matrix, int countBlock);

#endif /* WATERMARK_H */