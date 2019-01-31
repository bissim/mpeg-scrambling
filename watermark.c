/* 
 * File:   watermark.c
 * Author: Leo Aniello (aniello.leo@gmail.com) - Salerno University
 * Copyright(C) 2016 Leo Aniello, all rights reserved.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dirent.h>
#include "globals.h"
#include "watermark.h"

/* 0 - no, 1 - stampa solo info watermark, 2 - stampa info watermark, messaggi e matrici */
int     debugWatermark = 0;
/* Tipo algoritmo watermarking (0 -> no watermarking, 1 -> LSB, 2 -> COX) */
int     watermarkType = 0;
/* Fase watermarking:
 * 1 -> inserimento dimensione watermark,
 * 2 -> inserimento numero coefficienti per blocco da modificare,
 * 3 -> inserimento watermark. */
int     faseWatermarking = 1;
/* Watermark in array di caratteri */
char*   watermarkString;
/* dimensione stringa di watermark */
int     watermarkStringSize = 0;
/* Watermark in array di interi */
int*    watermarkInt;
/* dimensione array interi watermark */
int     watermarkIntSize = 0;
/* indice watermark */
int     watermarkIndex = 0;
/* indice bit del watermark */
int     watermarkBitIndex = 0;
/* Numero di Intra coded macroblock Richiesti per inserire il watermark con i parametri passati */
int     reqNumIPMType = 0;
/* Numero di Intra coded macroblock Usati per inserire il watermark con i parametri passati */
int     usedNumIPMType = 0;
/* Contatore del Numero di Intra coded macroblock */
int     countIPMType = 0;
/* array di mapping del watermark sulla sequenza video */
int*    blockMapWatermark;
/* array di interi, con ogni intero < della soglia, rappresenta la size di watermarkInt  */
int*    intestazioneCox1;
/* dimensione dell'array rappresenta la size di watermarkInt */
int     sizeIntestazioneCox1;
/* array di interi, con ogni intero < della soglia, rappresenta il numero di coefficienti per blocco da modificare */
int*    intestazioneCox2;
/* simensione dell'array rappresenta il numero di coefficienti per blocco da modificare */
int     sizeIntestazioneCox2;
/* file di output per i coefficienti originali modificati [Cox] */
FILE*   fdOrigCoef_cox = NULL;
/* file di output per il watermark estratto */
FILE*   watermarkOutFile;
/* Coefficiente di inserimento Watermark
 * (default 1 -> numero richiesto di blocchi = 1 * size del watermark (es. in bits)) */
int     CInsWatermark = 1;
/* Numero coefficienti per blocco da modificare [ <= 64 ]
 * (default 1 -> posizione 0 dell'array) */
int     NCBtoMod = 1;
/* seed per la funzione srand() */
int     wSeed = 1;
/* soglia di bits in cui viene diviso l'intero rappresentante il watermark da inserire [Cox] */
int     sogliaBitsWatermark = 2;
/* array dei coefficienti originali prima della modifica [Cox] */
int *   originalCoeff;
/* dimensione array dei coefficienti prima della modifica [Cox] */
int     sizeOriginalCoeff;
/* indice array contenente i coefficienti prima della modifica [Cox] */
int     originalCoeffIndex = 0;

void initInsWatermarkConfig(){
    if(watermarkType == LSB){
        /* 32 bits per la dimensione del watermark,
         * 6  bits per il numero di coefficienti modificati per blocco,
         */
        int bitsIntestazione = 32 + 6;
        /* parte intera superiore ( bits del watermark / numero di coefficienti della matrice da modificare ) */
        usedNumIPMType = (watermarkStringSize*8)/NCBtoMod;
        if( (watermarkStringSize*8)%NCBtoMod ) usedNumIPMType++;
        /* Numero Richiesto di Intra coded macroblock per inserire il watermark con i parametri passati */
        reqNumIPMType = bitsIntestazione + usedNumIPMType * CInsWatermark;
        blockMapWatermark = getRandomArray(reqNumIPMType, bitsIntestazione, usedNumIPMType, wSeed, NCBtoMod );
    }else if(watermarkType == COX){
        /* rappresento il watermark in interi che non superino la soglia di bits fissata */
        watermarkInt = splitStringToIntArrayByBit(watermarkString, watermarkStringSize, sogliaBitsWatermark, &watermarkIntSize);
        /* rappresento la dimensione del watermark in interi che non superino la soglia di bits fissata */
        intestazioneCox1 = splitIntToIntArrayByBit(watermarkIntSize, sogliaBitsWatermark, &sizeIntestazioneCox1);
        /* rappresento il numero di coefficienti (DCT) per blocco, da modificare, in interi che non superino la soglia di bits fissata  */
        intestazioneCox2 = splitIntToIntArrayByBit(NCBtoMod, sogliaBitsWatermark, &sizeIntestazioneCox2);
        /* inizializzo l'array che conterrà i coefficienti (DCT) candidati per la modifica (prima di essere modificati) */
        sizeOriginalCoeff = sizeIntestazioneCox1 + sizeIntestazioneCox2 + watermarkIntSize;
        originalCoeff = (int*)calloc(sizeOriginalCoeff, sizeof(int));
        /* parte intera superiore ( numero interi del watermark / numero di coefficienti della matrice da modificare ) */
        usedNumIPMType = watermarkIntSize/NCBtoMod;
        if( watermarkIntSize%NCBtoMod ) usedNumIPMType++;
        /* Numero Richiesto di Intra coded macroblock per inserire il watermark con i parametri passati */
        reqNumIPMType = sizeIntestazioneCox1 + sizeIntestazioneCox2 + usedNumIPMType * CInsWatermark;
        blockMapWatermark = getRandomArray(reqNumIPMType, sizeIntestazioneCox1+sizeIntestazioneCox2, usedNumIPMType, wSeed, NCBtoMod );
    }
}

void finalInsWatermark(){
    printf("\n");
    if(watermarkType == LSB || watermarkType == -1){
        printf("Dimensione del watermark: %i\n", watermarkStringSize);
        printf("Coefficiente di inserimento Watermark: %i\n", CInsWatermark);
        printf("Numero coefficienti per blocco da modificare [ <= 64 ]: %i\n", NCBtoMod);
        printf("Seed usato per randomizzare i blocchi: %i\n", wSeed);
        printf("Intra coded macroblock letti: %i\n", countIPMType);
        printf("Intra coded macroblock considerati per il watermark: %i\n", reqNumIPMType);
        printf("Intra coded macroblock utilizzati per il watermark: %i\n"
                "%15i per la dimensione del watermark\n"
                "%15i per il numero di coefficienti (DCT) modificati per blocco\n"
                "%15i per il watermark\n", 32+6+usedNumIPMType, 32, 6, usedNumIPMType);
        if(watermarkIndex < watermarkStringSize) {
            printf("\nERRORE: il watermark non e' stato inserito completamente [Intra coded macroblock non sufficienti a contenere il watermark]\n");
            int bitsDaInserire = 32+6+watermarkStringSize*8; // numero di bits da inserire (intestazione + watermark)
            int maxCoeff = countIPMType*64; // Massimo numero di coefficienti (DCT) disponibili, da poter modificare
            if( bitsDaInserire <= maxCoeff){
                printf("SOLUZIONI:\n");
                printf("\t1. ridurre il valore del coefficiente di inserimento del watermark.\n");
                printf("\t2. aumentare il numero di coefficienti (DCT) modificati per blocco.\n");
            }
        }
    }else if(watermarkType == COX || watermarkType == -2){
        if(fdOrigCoef_cox != NULL) {
            fwrite(originalCoeff, sizeof(int), sizeOriginalCoeff, fdOrigCoef_cox);
            fflush(fdOrigCoef_cox);
            fclose(fdOrigCoef_cox);
        }
        printf("Dimensione del watermark: %i bytes (%i valori interi)\n", watermarkStringSize, watermarkIntSize);
        printf("Coefficiente di inserimento Watermark: %i\n", CInsWatermark);
        printf("Numero coefficienti per blocco da modificare [ <= 64 ]: %i\n", NCBtoMod);
        printf("Valore soglia: %i bit\n", sogliaBitsWatermark);
        printf("Seed usato per randomizzare i blocchi: %i\n", wSeed);
        printf("Intra coded macroblock letti: %i\n", countIPMType);
        printf("Intra coded macroblock considerati per il watermark: %i\n", reqNumIPMType);
        printf("Intra coded macroblock utilizzati per il watermark: %i\n"
                "%15i per la dimensione del watermark\n"
                "%15i per il numero di coefficienti (DCT) modificati per blocco\n"
                "%15i per il watermark\n", sizeIntestazioneCox1+sizeIntestazioneCox2+usedNumIPMType, sizeIntestazioneCox1, sizeIntestazioneCox2, usedNumIPMType);
        if(watermarkIndex < watermarkIntSize) {
            printf("\nERRORE: il watermark non e' stato inserito completamente [Intra coded macroblock non sufficienti a contenere il watermark]\n");
            int intDaInserire = sizeIntestazioneCox1+sizeIntestazioneCox2+watermarkIntSize; // numero di interi da inserire (intestazione + watermark)
            int maxCoeff = countIPMType*64; // Massimo numero di coefficienti (DCT) disponibili, da poter modificare
            if( intDaInserire <= maxCoeff){
                printf("SOLUZIONI:\n");
                printf("\t1. ridurre il valore del coefficiente di inserimento del watermark.\n");
                printf("\t2. aumentare il numero di coefficienti (DCT) modificati per blocco.\n");
                printf("\t3. aumentare il valore soglia.\n");
            }
        }
    }
}

void initExtWatermarkConfig(){
    if(watermarkType == LSB){

    }else if(watermarkType == COX){
        /* inizializzo l'array che conterrà dimensione del watermark,
         * rappresentata in interi che non superino la soglia di bits fissata */
        sizeIntestazioneCox1 = 32/sogliaBitsWatermark;
        intestazioneCox1 = (int*)calloc(sizeIntestazioneCox1, sizeof(int));
        /* inizializzo l'array che conterrà il numero di coefficienti (DCT) per blocco,
         * da modificare, rappresentato in interi che non superino la soglia di bits fissata */
        sizeIntestazioneCox2 = 32/sogliaBitsWatermark;
        intestazioneCox2 = (int*)calloc(sizeIntestazioneCox2, sizeof(int));
    }
}

void finalExtWatermark(){
    printf("\n");
    if(watermarkType == -1){
        printf("Dimensione del watermark: %i\n", watermarkStringSize);
        printf("Coefficiente di inserimento Watermark: %i\n", CInsWatermark);
        printf("Numero coefficienti per blocco da modificare [ <= 64 ]: %i\n", NCBtoMod);
        printf("Seed usato per randomizzare i blocchi: %i\n", wSeed);
        printf("Intra coded macroblock letti: %i\n", countIPMType);
        printf("Intra coded macroblock considerati per il watermark: %i\n", reqNumIPMType);
        printf("Intra coded macroblock utilizzati per il watermark: %i\n"
                "%15i per la dimensione del watermark\n"
                "%15i per il numero di coefficienti (DCT) modificati per blocco\n"
                "%15i per il watermark\n", 32+6+usedNumIPMType, 32, 6, usedNumIPMType);
        if(watermarkString != NULL) printf("\nIl watermatk estratto e':\n%s\n", watermarkString);
    }else if(watermarkType == -2){
        printf("Dimensione del watermark: %i\n", watermarkStringSize);
        printf("Coefficiente di inserimento Watermark: %i\n", CInsWatermark);
        printf("Numero coefficienti per blocco da modificare [ <= 64 ]: %i\n", NCBtoMod);
        printf("Valore soglia: %i bit\n", sogliaBitsWatermark);
        printf("Seed usato per randomizzare i blocchi: %i\n", wSeed);
        printf("Intra coded macroblock letti: %i\n", countIPMType);
        printf("Intra coded macroblock considerati per il watermark: %i\n", reqNumIPMType);
        printf("Intra coded macroblock utilizzati per il watermark: %i\n"
                "%15i per la dimensione del watermark\n"
                "%15i per il numero di coefficienti (DCT) modificati per blocco\n"
                "%15i per il watermark\n", sizeIntestazioneCox1+sizeIntestazioneCox2+usedNumIPMType, sizeIntestazioneCox1, sizeIntestazioneCox2, usedNumIPMType);
        if(watermarkString != NULL) printf("\nIl watermatk estratto e':\n%s\n", watermarkString);
    }
}

void insertWatermark_lsb(int *matrix, int countBlock)
{
    BEGIN("Watermarking LSB - Insert");
    if( blockMapWatermark[countBlock] ){
        if(debugWatermark >= 1)
            printf("Blocco corrente: %i\n", countBlock);
        if(faseWatermarking == 1){ // inserisco i bits della dimensione del watermark
            if(debugWatermark >= 1){
                printf("%s  ->  %i ( Coefficiente PRIMA della modifica )\n", getBitsFromInt(matrix[0]), matrix[0]);
                printf("%i ( bit %i/32 della dimensione del watermark [ %i ] -> [ %s ] )\n",
                        GETBIT(watermarkStringSize, watermarkBitIndex%32), (watermarkBitIndex%32)+1, watermarkStringSize, getBitsFromInt(watermarkStringSize));
            }
            // setto il bit meno significativo (posizione 0) al bit corrente del watermark
            SETBIT(matrix[0], 0, GETBIT(watermarkStringSize, watermarkBitIndex%32));
            if(debugWatermark >= 1)
                printf("%s  ->  %i ( Coefficiente DOPO la modifica )\n\n", getBitsFromInt(matrix[0]), matrix[0]);
            watermarkBitIndex++;
            if(watermarkBitIndex%32 == 0) {
                watermarkBitIndex = 0;
                faseWatermarking = 2;
            }
        }else if(faseWatermarking == 2){ // inserisco i bits del numero di coefficienti da modificare in ogni blocco (<64)
            if(debugWatermark >= 1){
                printf("%s  ->  %i ( Coefficiente PRIMA della modifica )\n", getBitsFromInt(matrix[0]), matrix[0]);
                printf("%i ( bit %i/6 del numero di coefficienti da modificare in ogni blocco [ %i ] -> [ %s ] )\n",
                        GETBIT(NCBtoMod, watermarkBitIndex%6), (watermarkBitIndex%6)+1, NCBtoMod, getBitsFromInt(NCBtoMod));
            }
            // setto il bit meno significativo (posizione 0) al bit corrente del watermark
            SETBIT(matrix[0], 0, GETBIT(NCBtoMod, watermarkBitIndex%6));
            if(debugWatermark >= 1)
                printf("%s  ->  %i ( Coefficiente DOPO la modifica )\n\n", getBitsFromInt(matrix[0]), matrix[0]);
            watermarkBitIndex++;
            if(watermarkBitIndex%6 == 0) {
                watermarkBitIndex = 0;
                faseWatermarking = 3;
            }
        }else if(faseWatermarking == 3 && watermarkIndex < watermarkStringSize){ // se ci sono ancora caratteri del watermark da inserire
            for(int i = 0; i < NCBtoMod; i++){
                if(debugWatermark >= 1){
                    printf("%s  ->  %i ( Coefficiente PRIMA della modifica )\n", getBitsFromInt(matrix[i]), matrix[i]);
                    printf("%i ( bit %i/8 del carattere di watermark [ %c ] -> [ %s ] - %i/%i )\n",
                            GETBIT(watermarkString[watermarkIndex], watermarkBitIndex%8), (watermarkBitIndex%8)+1, watermarkString[watermarkIndex], getBitsFromChar(watermarkString[watermarkIndex]), watermarkIndex+1, watermarkStringSize );
                }
                // setto il bit meno significativo (posizione 0) al bit corrente del watermark
                SETBIT(matrix[i], 0, GETBIT(watermarkString[watermarkIndex], watermarkBitIndex%8));
                if(debugWatermark >= 1)
                    printf("%s  ->  %i ( Coefficiente DOPO la modifica )\n\n", getBitsFromInt(matrix[i]), matrix[i]);
                watermarkBitIndex++;
                if(watermarkBitIndex%8 == 0){
                    watermarkIndex++;
                    if(watermarkIndex == watermarkStringSize){ break; } // nel caso i bit finali del watermark da inserire sono < delle posizioni disponibili
                }
            }
            if(watermarkIndex == watermarkStringSize){
                watermarkType = -1; // non ci sono più bit da inserire
            }
        }
    }
}

void extractWatermark_lsb(int *matrix, int countBlock)
{
    BEGIN("Watermarking LSB - Extract");
    if(debugWatermark >= 1) printf("Blocco corrente: %i\n", countBlock);
    if(faseWatermarking == 1){ // prelevo i bits della dimensione del watermark (primi 32 bits)
        if(debugWatermark >= 1) {
            printf("%s ( %i = Coefficiente prelevato)\n", getBitsFromInt(matrix[0]), matrix[0]);
            printf("%i ( bit %i/32 della dimensione del watermark )\n\n", GETBIT(matrix[0], 0), (watermarkBitIndex%32)+1);
        }
        SETBIT(watermarkStringSize, watermarkBitIndex%32, GETBIT(matrix[0], 0));
        watermarkBitIndex++;
        if(watermarkBitIndex%32 == 0) { // ho finito di leggere i 32 bits
            if(debugWatermark >= 1) printf("Dimensione del watermark: %i ( %s )\n\n", watermarkStringSize, getBitsFromInt(watermarkStringSize));
            watermarkBitIndex = 0;
            faseWatermarking = 2;
            watermarkString = (char*) malloc(sizeof(char)*watermarkStringSize);
        }
    }else if(faseWatermarking == 2){ // prelevo i bits del numero di coefficienti modificati in ogni blocco (<=64)
        if(debugWatermark >= 1) {
            printf("%s ( %i = Coefficiente prelevato)\n", getBitsFromInt(matrix[0]), matrix[0]);
            printf("%i ( bit %i/6 del numero di coefficienti modificati in ogni blocco )\n\n", GETBIT(matrix[0], 0), (watermarkBitIndex%6)+1);
        }
        SETBIT(NCBtoMod, watermarkBitIndex%6, GETBIT(matrix[0], 0));
        watermarkBitIndex++;
        if(watermarkBitIndex%6 == 0) { // ho finito di leggere i 6 bits
            if(debugWatermark >= 1) printf("Numero di coefficienti modificati in ogni blocco: %i ( %s )\n\n", NCBtoMod, getBitsFromInt(NCBtoMod));
            watermarkBitIndex = 0;
            faseWatermarking = 3;
            initInsWatermarkConfig();
        }
    }else if(faseWatermarking == 3 && watermarkIndex < watermarkStringSize && blockMapWatermark[countBlock] ){ // prelevo i bits del watermark
        for(int i = 0; i < NCBtoMod; i++){
            if(debugWatermark >= 1) {
                printf("%s ( %i = Coefficiente prelevato)\n", getBitsFromInt(matrix[i]), matrix[i]);
                printf("%i ( bit %i/8 del carattere corrente del watermark )\n\n", GETBIT(matrix[i], 0), (watermarkBitIndex%8)+1);
            }
            SETBIT(watermarkString[watermarkIndex], watermarkBitIndex%8, GETBIT(matrix[i], 0));
            watermarkBitIndex++;
            if(watermarkBitIndex%8 == 0 ){
                if(debugWatermark >= 1) 
                    printf("Carattere estratto: [ %s ] -> [ %c ] ( %i/%i )\n\n", getBitsFromChar(watermarkString[watermarkIndex]), watermarkString[watermarkIndex], watermarkIndex+1, watermarkStringSize);
                watermarkIndex++;
                if(watermarkIndex == watermarkStringSize){ break; } // nel caso i bit finali del watermark da estrarre sono < del numero di coefficienti modificati
            }
        }
        if(watermarkIndex == watermarkStringSize){ // non ci sono più bits da estrarre
            if(watermarkOutFile != stdout) { // scrive in un file
                fwrite(watermarkString, sizeof(char), watermarkStringSize, watermarkOutFile);
                fflush(watermarkOutFile);
                fclose(watermarkOutFile);
                free(watermarkString);    
                watermarkString = NULL;
            }else{ // scrive su standard output (stdout)
                fprintf(watermarkOutFile, "\nIl watermatk estratto e':\n%s\n\n", watermarkString);
            }
            watermarkType = -1; // non ci sono più bit da estrarre
            watermarkOutFile = NULL;
        }
    }
}

void insertWatermark_cox(int *matrix, int countBlock)
{
    BEGIN("Watermarking COX - Insert");
    if( blockMapWatermark[countBlock] ){
        if(debugWatermark >= 1) printf("Blocco corrente: %i\n", countBlock);
        if(faseWatermarking == 1){ // inserisco la dimensione del watermark
            if(fdOrigCoef_cox != NULL){
                originalCoeff[originalCoeffIndex] = matrix[0];
                if(debugWatermark >= 1) printf("%5i ( Valore memorizzato nel file dei coefficienti originali )\n", originalCoeff[originalCoeffIndex]);
                originalCoeffIndex++;
            }
            if(debugWatermark >= 1){
                printf("%5i ( Coefficiente PRIMA della modifica )\n", matrix[0]);
                printf("%5i ( Valore da aggiungere )\n", intestazioneCox1[watermarkIndex] );
            }
            // aggiungo l'intero corrente del watermark al coefficiente DCT
            matrix[0] = matrix[0]+intestazioneCox1[watermarkIndex];
            if(debugWatermark >= 1) printf("%5i ( Coefficiente DOPO la modifica )\n\n", matrix[0]);
            if(matrix[0] > 255) {
                /* aggiustamento coefficiente memorizzato, intervallo [-255, 255]
                 * (il codec tramite la funzione BoundQuantizeMatrix(matrix) limita i coefficienti a tale intervallo) */
                originalCoeff[originalCoeffIndex-1] = 255 - intestazioneCox1[watermarkIndex];
                if(debugWatermark >= 1) {
                    printf("Il coefficiente è fuori intervallo [-255, 255].\nRicalcolo...\n");
                    printf("%5i ( Valore ricalcolato nel file dei coefficienti originali )\n\n", originalCoeff[originalCoeffIndex-1]);
                }
            }
            watermarkIndex++;
            if(watermarkIndex%sizeIntestazioneCox1 == 0) {
                watermarkIndex = 0;
                faseWatermarking = 2;
            }
        }else if(faseWatermarking == 2){ // inserisco il numero di coefficienti da modificare in ogni blocco (<64)
            if(fdOrigCoef_cox != NULL){
                originalCoeff[originalCoeffIndex] = matrix[0];
                if(debugWatermark >= 1) printf("%5i ( Valore memorizzato nel file dei coefficienti originali )\n", originalCoeff[originalCoeffIndex]);
                originalCoeffIndex++;
            }
            if(debugWatermark >= 1){
                printf("%5i ( Coefficiente PRIMA della modifica )\n", matrix[0]);
                printf("%5i ( Valore da aggiungere )\n", intestazioneCox2[watermarkIndex] );
            }
            // aggiungo l'intero corrente del watermark al coefficiente DCT
            matrix[0] = matrix[0]+intestazioneCox2[watermarkIndex];
            if(debugWatermark >= 1) printf("%5i ( Coefficiente DOPO la modifica )\n\n", matrix[0]);
            if(matrix[0] > 255) {
                /* aggiustamento coefficiente memorizzato, intervallo [-255, 255]
                 * (il codec tramite la funzione BoundQuantizeMatrix(matrix) limita i coefficienti a tale intervallo) */
                originalCoeff[originalCoeffIndex-1] = 255 - intestazioneCox2[watermarkIndex];
                if(debugWatermark >= 1) {
                    printf("Il coefficiente è fuori intervallo [-255, 255].\nRicalcolo...\n");
                    printf("%5i ( Valore ricalcolato nel file dei coefficienti originali )\n\n", originalCoeff[originalCoeffIndex-1]);
                }
            }
            watermarkIndex++;
            if(watermarkIndex%sizeIntestazioneCox2 == 0) {
                watermarkIndex = 0;
                faseWatermarking = 3;
            }
        }else if(faseWatermarking == 3 && watermarkIndex < watermarkIntSize){ // se ci sono ancora caratteri del watermark da inserire
            for(int i = 0; i < NCBtoMod; i++){
                if(fdOrigCoef_cox != NULL){
                    originalCoeff[originalCoeffIndex] = matrix[i];
                    if(debugWatermark >= 1) printf("%5i ( Valore memorizzato nel file dei coefficienti originali )\n", originalCoeff[originalCoeffIndex]);
                    originalCoeffIndex++;
                }
                if(debugWatermark >= 1){
                    printf("%5i ( Coefficiente PRIMA della modifica )\n", matrix[i]);
                    printf("%5i ( Valore da aggiungere )\n", watermarkInt[watermarkIndex] );
                }
                // aggiungo l'intero corrente del watermark al coefficiente DCT
                matrix[i] = matrix[i]+watermarkInt[watermarkIndex];
                if(debugWatermark >= 1) printf("%5i ( Coefficiente DOPO la modifica )\n\n", matrix[i]);
                if(matrix[i] > 255) {
                    /* aggiustamento coefficiente memorizzato, intervallo [-255, 255]
                     * (il codec tramite la funzione BoundQuantizeMatrix(matrix) limita i coefficienti a tale intervallo) */
                    originalCoeff[originalCoeffIndex-1] = 255 - watermarkInt[watermarkIndex];
                    if(debugWatermark >= 1) {
                        printf("Il coefficiente è fuori intervallo [-255, 255].\nRicalcolo...\n");
                        printf("%5i ( Valore ricalcolato nel file dei coefficienti originali )\n\n", originalCoeff[originalCoeffIndex-1]);
                    }
                }
                watermarkIndex++;
                if(watermarkIndex == watermarkIntSize){ break; } // nel caso sono finiti gli int del watermark
            }
            if(watermarkIndex == watermarkIntSize){
                watermarkType = -2; // non ci sono int da inserire
            }
        }
    }
}

void extractWatermark_cox(int *matrix, int countBlock)
{
    BEGIN("Watermarking COX - Extract");
    if(debugWatermark >= 1) printf("Blocco corrente: %i\n", countBlock);
    if(faseWatermarking == 1){ // prelevo la dimensione del watermark (primi 32/sogliaBitsWatermark blocchi )
        intestazioneCox1[watermarkIndex] = matrix[0]-originalCoeff[watermarkIndex];
        if(debugWatermark >= 1) {
            printf("%s ( %5i = Coefficiente prelevato)\n", getBitsFromInt(matrix[0]), matrix[0]);
            printf("%s ( %5i = Valore estratto)\n\n", getBitsFromInt(intestazioneCox1[watermarkIndex]), intestazioneCox1[watermarkIndex]);
        }
        watermarkIndex++;
        if(watermarkIndex%sizeIntestazioneCox1 == 0) { // ho finito di leggere
            watermarkIndex = 0;
            faseWatermarking = 2;
            /* costruisco la dimensione del watermark (rappresentazione con interi < della soglia)
             * con gli interi < della soglia, prelevati */
            watermarkIntSize = mergeIntArrayToIntByBit(intestazioneCox1, sizeIntestazioneCox1, sogliaBitsWatermark, 0);
            /* inizializzo l'array di interi (< della soglia) che rappresenterà il watermark */
            watermarkInt = (int*)calloc(watermarkIntSize, sizeof(int));
            if(debugWatermark >= 1) printf("Dimensione del watermark: %i ( %s )\n\n", watermarkIntSize, getBitsFromInt(watermarkIntSize));
        }
    }else if(faseWatermarking == 2){ // prelevo il numero di coefficienti modificati in ogni blocco (<=64)
        intestazioneCox2[watermarkIndex] = matrix[0]-originalCoeff[sizeIntestazioneCox1+watermarkIndex];
        if(debugWatermark >= 1) {
            printf("%s ( %5i = Coefficiente prelevato)\n", getBitsFromInt(matrix[0]), matrix[0]);
            printf("%s ( %5i = Valore estratto)\n\n", getBitsFromInt(intestazioneCox2[watermarkIndex]), intestazioneCox2[watermarkIndex]);
        }
        watermarkIndex++;
        if(watermarkIndex%sizeIntestazioneCox2 == 0) { // ho finito di leggere
            watermarkIndex = 0;
            faseWatermarking = 3;
            /* costruisco il numero di coefficienti (DCT) per blocco, da modificare,
             * con gli interi < della soglia, prelevati */
            NCBtoMod = mergeIntArrayToIntByBit(intestazioneCox2, sizeIntestazioneCox2, sogliaBitsWatermark, 0);
            if(debugWatermark >= 1) printf("Numero di coefficienti modificati in ogni blocco: %i ( %s )\n\n", NCBtoMod, getBitsFromInt(NCBtoMod));
            /* parte intera superiore ( numero interi del watermark / numero di coefficienti della matrice da modificare ) */
            usedNumIPMType = watermarkIntSize/NCBtoMod;
            if( watermarkIntSize%NCBtoMod ) usedNumIPMType++;
            /* Numero Richiesto di Intra coded macroblock per estrarre il watermark con i parametri passati */
            reqNumIPMType = sizeIntestazioneCox1 + sizeIntestazioneCox2 + usedNumIPMType * CInsWatermark;
            blockMapWatermark = getRandomArray(reqNumIPMType, sizeIntestazioneCox1+sizeIntestazioneCox2, usedNumIPMType, wSeed, NCBtoMod );
        }
    }else if(faseWatermarking == 3 && watermarkIndex < watermarkIntSize && blockMapWatermark[countBlock] ){ // prelevo il watermark
        for(int i = 0; i < NCBtoMod; i++){
            watermarkInt[watermarkIndex] = matrix[i]-originalCoeff[sizeIntestazioneCox1+sizeIntestazioneCox2+watermarkIndex];
            if(debugWatermark >= 1) {
                printf("%s ( %5i = Coefficiente prelevato)\n", getBitsFromInt(matrix[i]), matrix[i]);
                printf("%s ( %5i = Coefficiente originale)\n", getBitsFromInt(originalCoeff[sizeIntestazioneCox1+sizeIntestazioneCox2+watermarkIndex]), originalCoeff[sizeIntestazioneCox1+sizeIntestazioneCox2+watermarkIndex]);
                printf("%s ( %5i = Valore estratto)\n\n", getBitsFromInt(watermarkInt[watermarkIndex]), watermarkInt[watermarkIndex]);
            }   
            watermarkIndex++;
            if(watermarkIndex == watermarkIntSize){ break; }
        }
        if(watermarkIndex == watermarkIntSize){ // non ci sono int da estrarre
            /* costruisco la stringa contenente il watermark, con gli interi < della soglia, prelevati */
            watermarkString = mergeIntArrayToStringByBit(watermarkInt, watermarkIntSize, sogliaBitsWatermark, 0, &watermarkStringSize);
            if(watermarkOutFile != stdout) { // scrive in un file
                fwrite(watermarkString, sizeof(char), watermarkStringSize, watermarkOutFile);
                fflush(watermarkOutFile);
                fclose(watermarkOutFile);
                free(watermarkString);
                watermarkString=NULL;
            }else{ // scrive su standard output (stdout)
                fprintf(watermarkOutFile, "\nIl watermatk estratto e':\n%s\n\n", watermarkString);
            }
            watermarkType = -2; // ho finito
            watermarkOutFile = NULL;
        }
    }
}

char* getBitsFromInt(int val)
{
    char* bits = malloc(8*sizeof(val));
    for(int i = 0; i < 8*sizeof(val); i++){
        sprintf(&bits[i], "%i", GETBIT(val, i));
    }
    return bits;
}

char* getBitsFromChar(char val)
{
    char* bits = malloc(8*sizeof(val));
    for(int i = 0; i < 8*sizeof(val); i++){
        sprintf(&bits[i], "%i", GETBIT(val, i));
    }
    return bits;
}

char* getFileToString(char *filePath, int *size_OUT)
{
    FILE * pFile;
    long lSize;
    size_t numCharRead;
    
    pFile = fopen (filePath, "rb");
    if (pFile==NULL) {fputs("File error",stderr); exit(1);}
    
    // obtain file size:
    fseek(pFile , 0 , SEEK_END);
    lSize = ftell(pFile);
    rewind(pFile);
    
    // allocate memory to contain the whole file:
    char* result = (char*) calloc( lSize, sizeof(char));
    if (result == NULL) {fputs ("Memory error",stderr); exit (2);}
    
    // copy the file into the buffer:
    numCharRead = fread(result,sizeof(char),lSize,pFile);
    if (numCharRead != lSize) {fputs ("Reading error",stderr); exit (3);}
    /* the whole file is now loaded in the memory buffer. */
    // terminate
    fclose(pFile);
    
    *size_OUT=lSize;
    return result;
}

int* getFileToIntArray(char *filePath, int *size_OUT)
{
    FILE * pFile;
    long lSize;
    size_t numCharRead;
    
    pFile = fopen(filePath, "rb");
    if (pFile==NULL) {fputs("File error",stderr); exit(1);}
    
    // obtain file size:
    fseek(pFile , 0 , SEEK_END);
    lSize = ftell(pFile);
    rewind(pFile);
    if(lSize%4) { fputs("File error",stderr); exit(1); }
    else lSize = lSize/4;
    
    // allocate memory to contain the whole file:
    int *result = (int*) calloc(lSize, sizeof(int));
    if (result == NULL) {fputs ("Memory error",stderr); exit (2);}
    
    // copy the file into the buffer:
    numCharRead = fread(result,sizeof(int),lSize,pFile);
    if (numCharRead != lSize) {fputs ("Reading error",stderr); exit (3);}
    /* the whole file is now loaded in the memory buffer. */
    // terminate
    fclose(pFile);
    
    *size_OUT=lSize;
    return result;
}

long getFileSize(char* filePath)
{
    long lSize = 0;
    FILE * pFile = fopen (filePath, "rb");
    if (pFile==NULL) {fputs("File error",stderr); exit(1);}
    // obtain file size:
    fseek(pFile , 0 , SEEK_END);
    lSize = ftell(pFile);
    fclose(pFile);
    return lSize;
}

int* getRandomArray(int sizeArray, int bitsIntestazione, int sizeWatermark, int seed, int valore) {
    int *v = (int *)calloc(sizeArray,sizeof(int)); // calloc inizializza tutti i valori a 0
    for(int i = 0; i < bitsIntestazione; i++){
        v[i] = 1;
    }
    if( sizeArray == (bitsIntestazione + sizeWatermark) ){
        for(int i = bitsIntestazione; i < sizeArray; i++)
            v[i] = valore;
        return v;
    }else if( sizeArray > (bitsIntestazione + sizeWatermark) ){
        srand(seed);
        for(int i = 0; i < sizeWatermark; i++){
            int j;
            do{ 
                j = rand()%(sizeArray-bitsIntestazione)+bitsIntestazione; //indice random compreso tra [ bitsIntestazione , sizeArray-1 ]
            }while( v[j] ); // fino a quando non trova un indice non scansionato
            v[j] = valore;
        }
    }
    return v;
}

int* splitStringToIntArrayByBit(char* charArray, int sizeCharArray, int numBits, int *size_OUT)
{
    // il tipo di dato int ha 32 bit, non si deve sforare
    if( numBits > 32) { exit(1); }
    // il numero di bits scelti è maggiore dei bits dell'array di caratteri
    if( (sizeCharArray*8) < numBits ) { fprintf(stderr, "Parametro -sogliaCox deve essere minore del watermark (%i).\n", sizeCharArray*8); exit(1); }
    // il numero di bits dell'array di caratteri non è divisibile in parti uguali con il numero di bits scelti
    if( (sizeCharArray*8) % numBits ) { fprintf(stderr, "Parametro -sogliaCox deve essere divisore della dimensione del watermark (%i).\n", sizeCharArray*8); exit(1); }
    *size_OUT = sizeCharArray * 8 / numBits;
    int* r = (int *)calloc(*size_OUT, sizeof(int));
    int indexCharArray = 0;
    int indexBitCharArray = 0;
    for(int indexIntArray = 0; indexIntArray < *size_OUT ; indexIntArray++){
        for(int indexBitIntArray = 0; indexBitIntArray < numBits ; indexBitIntArray++){
            SETBIT(r[indexIntArray], indexBitIntArray, GETBIT(charArray[indexCharArray], indexBitCharArray));
            indexBitCharArray++;
            if ( indexBitCharArray % 8 == 0 ) { indexCharArray++; indexBitCharArray=0; }
        }
        //printf("[ %3i. %i ( %s) ] \n", indexIntArray, r[indexIntArray], getBitsFromInt(r[indexIntArray]));
    }
    return r;
}

char* mergeIntArrayToStringByBit(int* intArray, int sizeIntArray, int numBits, int pos, int *size_OUT)
{
    if( numBits > 32 ) { fprintf(stderr, "Parametro -sogliaCox non può essere maggiore di 32.\n"); exit(1); }
    if( 32 % numBits ) { fprintf(stderr, "Parametro -sogliaCox deve essere divisore di 32.\n"); exit(1); }
    if( (sizeIntArray*numBits)%8 != 0 ) return 0;
    *size_OUT = sizeIntArray*numBits/8;
    char * r = (char *)calloc(*size_OUT, sizeof(char));
    
    int y=0,x=0;
    for(int i = 0; i < sizeIntArray; i++){
        for(int j = 0; j < numBits; j++){
            SETBIT(r[y], x%8, GETBIT(intArray[i], pos+j));
            x++;
            if(x%8==0) { y++; x=0;}
        }
    }
    return r;
}

int* splitIntToIntArrayByBit(int val, int numBits, int *size_OUT)
{
    if( numBits > 32 ) { fprintf(stderr, "Parametro -sogliaCox non può essere maggiore di 32.\n"); exit(1); }
    *size_OUT = 32/numBits;
    if( 32 % numBits ) *size_OUT += 1;
    int* r = (int *)calloc( *size_OUT, sizeof(int) );
    for(int i = 0; i < *size_OUT; i++)
        for(int j = i*numBits; j < i*numBits+numBits && j < 32; j++)
            SETBIT(r[i], j%numBits, GETBIT(val, j));
    return r;
}

int mergeIntArrayToIntByBit(int* intArray, int sizeIntArray, int numBits, int pos)
{
    if( numBits > 32 ) { fprintf(stderr, "Parametro -sogliaCox non può essere maggiore di 32.\n"); exit(1); }
    if( 32 % numBits ) { fprintf(stderr, "Parametro -sogliaCox deve essere divisore di 32.\n"); exit(1); }
    if( sizeIntArray*numBits != 32 ) { fprintf(stderr, "Errore.\n"); exit(1); }
    int r=0;
    for(int i = 0; i < sizeIntArray*numBits; i+=numBits){
        for(int j = 0; j < numBits; j++){
            SETBIT( r, i+j, GETBIT(intArray[i/numBits], pos+j) );
        }
    }
    return r;
}
