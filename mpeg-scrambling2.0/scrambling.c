/* 
 * File:   scrambling.c
 * Author: Lorenzo Vitale (lorenzodev@gmail.com) - Salerno University
 * Copyright(C) 2018 Lorenzo Vitale, all rights reserved.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <dirent.h>
#include <math.h>
#include <stdint.h>
#include <assert.h>
#include "cJSON.h"
#include "globals.h"
#include "scrambling.h"
#include "mpeg.h"
#include "matlab_engine_jpeg.h"
#include "scrambling_vala.h"
#include <glib.h>


int scrambling;     // variabile [0,1] per applicare o meno lo scrambling
int N_FRAME = 0;    // num frame corrente
int* frame_Y1;      // frame array 2D
int* frame_Y2;      // frame array 2D
int* frame_U;       // frame array 2D
int* frame_V;       // frame array 2D
int cP = 0;         // contatore
int cx = 0;         // contatore
int cy = 0;         // contatore
int modX = 0;       // modulo per lo scorrimento
int modY = 0;       // della matrice (riga/colonna)
int cP2 = 0;         // contatore
int cx2 = 0;         // contatore
int cy2 = 0;         // contatore
int modX2 = 0;       // modulo per lo scorrimento
int modY2 = 0;       // della matrice (riga/colonna)
int cP3 = 0;         // contatore
int cx3 = 0;         // contatore
int cy3 = 0;         // contatore
int modX3 = 0;       // modulo per lo scorrimento
int modY3 = 0;       // della matrice (riga/colonna)
int frameSizeW;     // lunghezza frame
int frameSizeH;     // altezza frame
int numBlocksW;     // numero blocchi riga matrice
int dimBlock;       // Dimensione del blocco
int MAX_COUNT;      // conteggio per la chiusura del frame
char path_matrix_Y[100] = "bin/temp/~Y.txt";
char path_matrix_U[100] = "bin/temp/~U.txt";
char path_matrix_V[100] = "bin/temp/~V.txt";
char path_matrix_ROI[100] = "bin/temp/~ROI.json";
char path_matrix_ROIs[100] = "bin/temp/ROIs.json";
int order = 0;
int c_c = 0;
int c_c2 = 0;
int c_U = 0;
int c_V = 0;
int cont_f1 = 0;
int cont_f2 = 0;
int cont_f_U = 0;
int cont_f_V = 0;
int n_row_meta1;
int n_row_meta2;
int n_row_U;
int n_row_V;
FILE *file_ROIs;


ssize_t myRead;
char * myLine = NULL;
size_t myLen = 0;
char myDelim[] = ",";
char* myToken;
int cont_unscramb;
cJSON *json = NULL;

char *pass_L[50];

cJSON *roi_json = NULL;


/*BFUNC
 * Inizializzazione dello Scrambling
EFUNC*/
void initScrambling(){
    N_FRAME = 0;
    
    cP = 0;
    cx = 0;
    cy = 0;
    modX = 0;
    modY = 0;
    
    cP2 = 0;
    cx2 = 0;
    cy2 = 0;
    modX2 = 0;
    modY2 = 0;
    
    cP3 = 0;
    cx3 = 0;
    cy3 = 0;
    modX3 = 0;
    modY3 = 0;
    
    frameSizeW = CImage->Width;
    frameSizeH = CImage->Height;
    MAX_COUNT = frameSizeW*frameSizeH/64; //numero totale di blocchi nel frame
    frame_Y1 = malloc(sizeof(int)*frameSizeH*frameSizeW);
    frame_Y2 = malloc(sizeof(int)*frameSizeH*frameSizeW);
    frame_U = malloc(sizeof(int)*frameSizeH*frameSizeW/4);
    frame_V = malloc(sizeof(int)*frameSizeH*frameSizeW/4);
   
    numBlocksW = floor(frameSizeW/BLOCKWIDTH);
    dimBlock = BLOCKWIDTH*BLOCKHEIGHT;
    
    roi_json = cJSON_CreateObject();

}

/*BFUNC
 * Funzione che "pulisce" l'attività di scrambling
EFUNC*/
void closeScrambling(){
    
    // Salva il file json contenente tutte le ROI trovate in tutti i frame
    FILE *f = fopen(path_matrix_ROIs, "w+");
    if(f == NULL){
      printf("Error opening file!");
      exit(1);
    } 
    char *out = cJSON_Print(roi_json);
    fprintf(f,"%s",out);
    fclose(f);
    
    // Se il parametro -clean è settato, rimuovo tutti i file temporanei
    if(clean>0){
        remove(path_matrix_Y);
        remove(path_matrix_U);
        remove(path_matrix_V);
        remove(path_matrix_ROI);
        
        char *temp[200];
        sprintf(temp,"%s.bmp",path_matrix_Y);
        remove(temp);
        
        sprintf(temp,"%s.bmp",path_matrix_U);
        remove(temp);
        
        sprintf(temp,"%s.bmp",path_matrix_V);
        remove(temp);
        
        sprintf(temp,"%s_scramb.bmp",path_matrix_Y);
        remove(temp);
    }
}


/*FUNC
 * Funzione che inizializza nell'unscrambling la sequenza di pseudocasuale per ogni frame
 */

void initPseudo4Frame(){
    // Setto il seme che genera la sequenza pseudo casuale
    char *pass[50];
    sprintf(pass,"%s%d",pass_scramb,CurrentFrame);
    int num = (int)getHash(pass);
    srand(num); //calcolo l'hash della password
}

/*BFUNC
 * Funzione che inizializza l'unscrambling
EFUNC*/
void initDeScrambling(){
    
    cP = 0;
    frameSizeW = 352;
    frameSizeH = 240;
    MAX_COUNT = frameSizeW*frameSizeH/64; //numero totale di blocchi nel frame
    
    numBlocksW = floor(frameSizeW/BLOCKWIDTH);
    dimBlock = BLOCKWIDTH*BLOCKHEIGHT;
    
    frame_Y1 = malloc(sizeof(int)*frameSizeH*frameSizeW);
    frame_Y2 = malloc(sizeof(int)*frameSizeH*frameSizeW);
    frame_U = malloc(sizeof(int)*frameSizeH*frameSizeW/4);
    frame_V = malloc(sizeof(int)*frameSizeH*frameSizeW/4);
    
    cont_unscramb = 0;
    
    // Apre il file ROIs.json creato nello scrambling 
    FILE *f = NULL;
    long len = 0;
    char *data = NULL;

    /* open in read binary mode */
    f = fopen(path_matrix_ROIs,"rb");
    
    if(f != NULL){
        fseek(f, 0, SEEK_END);
        len = ftell(f);
        fseek(f, 0, SEEK_SET);
        data = (char*)malloc(len + 1);
        fread(data, 1, len, f);
        data[len] = '\0';

        // creo il file json con i dati delle ROI
        json = cJSON_Parse(data);     

        free(data);
    }
    fclose(f);

}

/*BFUNC
 * Funzione che "pulisce" l'attività di unscrambling
EFUNC*/
void closeDeScrambling(){}


/*BFUNC
 * Funzione che fa partire lo scrambling sul frame (viene invocata frame by frame)
EFUNC*/   
int indexA = 0;
void startScrambling(){
    
    int length;
    N_FRAME++;
    cP = 0;
    cx = 0;
    cy = 0;
    modX = 0;   
    modY = 0;

    n_row_meta1 = 0;
    n_row_meta2 = 1;
    
    // BEGIN CODING
    if (!MBperSlice) MBperSlice=MBWidth;  // Set macroblocks per slice
    HPos=VPos=0;


    while(VPos<MBHeight){
        //CurrentMBS++;
        length = MBWidth*MBHeight - (HPos + (VPos*MBWidth));
        if ((MBperSlice<0)||(length<MBperSlice)) MBperSlice=length;
        MpegEncodeSlideScrambling(MBperSlice);
    }


    MBperSlice = 0;
    
    /////////////////////////////////////////////////////////////////////////////////
    /////////// INVOCAZIONE DELLA SYSTEM CALL VERSO L'APPLICAZIONE DI SCRAMBLING ////
    /////////////////////////////////////////////////////////////////////////////////

    //char command[150];
    //sprintf(command, "java -Djava.library.path=/usr/local/lib/ -jar ./bin/Scrambling.jar %d %d %s %d", CImage->Width,CImage->Height, "bin/temp/", CurrentFrame-StartFrame);
    //system(command);

    gchar arguments[4] = {CImage->Width , CImage->Height, "bin/temp/", CurrentFrame-StartFrame};
    _vala_main(arguments, 4);

    char fileN2[50];
    sprintf(fileN2,path_matrix_ROI);


    // Apro il file ROI.json contenente le ROI calcolate dall'applicazione esterna Scambling
    // per salvarle in un unico file ROIs.json così da poter aggiungere le informazioni aggiuntive
    // all'header del mpg per effettuare poi l'unscrambling
    FILE *f2 = fopen(fileN2, "r");
    char * line2 = NULL;
    size_t len2 = 0;
    ssize_t read2;

    if(f2 == NULL){
      printf("Error opening file!");
      exit(1);
    } 

    if(read2 = getline(&line2, &len2, f2) != -1){
        json = cJSON_Parse(line2);
        cJSON *temp = json->child;
        cJSON *items;
        cJSON *item;

        cJSON *region = cJSON_CreateArray();
        items = cJSON_GetObjectItemCaseSensitive(json, temp->string);
        cJSON_ArrayForEach(item, items)
        {
            cJSON *x = cJSON_GetObjectItemCaseSensitive(item, "x");
            cJSON *y = cJSON_GetObjectItemCaseSensitive(item, "y");
            cJSON *w = cJSON_GetObjectItemCaseSensitive(item, "w");
            cJSON *h = cJSON_GetObjectItemCaseSensitive(item, "h");

            cJSON *item1 = cJSON_CreateObject();
            cJSON_AddItemToObject(item1,"x",cJSON_CreateNumber(x->valuedouble));
            cJSON_AddItemToObject(item1,"y",cJSON_CreateNumber(y->valuedouble));
            cJSON_AddItemToObject(item1,"w",cJSON_CreateNumber(w->valuedouble));
            cJSON_AddItemToObject(item1,"h",cJSON_CreateNumber(h->valuedouble));
            cJSON_AddItemToArray(region, item1);
        }

        cJSON_AddItemToObject(roi_json, temp->string, region);
    }
}
    

/*BFUNC
 * Funzione che intercetta lo streaming dei blocchi durante la compressione
EFUNC*/ 
void MpegEncodeSlideScrambling(Count)
int Count;
{
    BEGIN("MpegEncodeSlice");
    int i,x;
    
    for(i=0;i<Count;i++)
    {
        ScramblingIterator();
        
        HPos++;
        if (HPos >= MBWidth)
	{
            HPos=0; VPos++;
	}
    }

}


/*BFUNC
 * Funzione che itera sui blocchi.
 * invocato 1930 volte (pari al numero totale di blocchi tra luminanza (1320) e crominanza (660))
EFUNC*/ 
int cccount = 0;
void ScramblingIterator(){ 
    
    int c,x;
    int *input;
   
    MpegFindMType();
    
    if (QuantPMType[PType][MType])
    {
        UseQuant=MQuant;
        SQuant=MQuant;       // Resets it for quantizations forward 
    }
    else {UseQuant=SQuant;}
    
    SkipMode=0;
    CBP = 0x00;
    for(c=0;c<6;c++)
    {
    
        if ((MFPMType[PType][MType])&&(MBPMType[PType][MType])){
            input = &imcbuf[c][0];
        }else if (MBPMType[PType][MType]){
            input = &bmcbuf[c][0];
        }else if (MFPMType[PType][MType]){
            input = &fmcbuf[c][0];
        }else if (!IPMType[PType][MType]){
            input = &interbuf[c][0];
        }else {
            input = &inputbuf[c][0];
        } 
     
       
        // con c < 2 ottengo le righe alternate pari e con c > 1 e c < 4 ottengo le righe alternate dispari
        if(c > 1 && c < 4) CreateFrameMatrixY(input, 2);
        if(c < 2) CreateFrameMatrixY(input, 1);
        
        // gli ultimi due blocchi del ciclo, restituiscono le crominanze (non subiscono l'alternanza della luminanza
        // quindi sono processari secondo un streaming dei blocchi lineare e non alternato
        if(c == 4) CreateFrameMatrixU(input);
        if(c == 5) CreateFrameMatrixV(input);
        

    }
    
}

   
/*BFUNC
 * Funzione che preleva i valori dai blocchi e li riordina secondo l'alternanza righe pari/dispari inserendoli in array
 * di supporto.
 * Il parametro meta contiene l'alternanza pari (meta=2), dispari (meta=1).
 * I valori delle righe pari vengono memorizzati in un array di supporto frame_Y2 e
 * i valori delle righe dispari in un array di supporto frame_Y1.
 * Questi array seviranno dopo per ricomporre il canale di luminanza Y dell'intero frame blocco per blocco.
EFUNC*/
void CreateFrameMatrixY(matrix, meta)
     int *matrix, meta;
{
    
  BEGIN("CreateFrameMatrixY");
 
  int i,j;

  if(cP < MAX_COUNT){
    int temp;
    if (matrix){
        for(i=0;i<BLOCKHEIGHT;i++){
            for(j=0;j<BLOCKWIDTH;j++){
                temp = *(matrix++);
                if(meta == 1){
                    frame_Y1[c_c] = temp;
                    c_c++;
                }else{
                    frame_Y2[c_c2] = temp;
                    c_c2++;
                }
            }
        }
    }
  }
  
  cP++;
  
  if(cP == MAX_COUNT){
     
    char fileN[50]; 
    c_c = 0;
    c_c2 = 0;
    cont_f1 = 0;
    cont_f2 = 0;
   
    
    // creo il file Y.txt contente i valori ordinati dell'intero frame
    sprintf(fileN,path_matrix_Y);   
    FILE *f = fopen(fileN, "w");
    if(f == NULL){
      printf("Error opening file !");
      exit(1);
    } 

    int conte = 0, conte2 = 0,row = 1;
    for(int c = 1;c <= MAX_COUNT;c++){
        for(int i = 0;i < BLOCKHEIGHT;i++){
            for(int j = 0;j < BLOCKWIDTH;j++){
                int temp;
                if(row == 1){
                    if(j == BLOCKWIDTH-1){
                        temp = frame_Y1[conte];
                        fprintf(f, "%d\r\n", temp); 
                    }else{
                        temp = frame_Y1[conte];
                        fprintf(f, "%d,", temp);
                    }
                    conte++;
                }else{
                    if(j == BLOCKWIDTH-1){
                        temp = frame_Y2[conte2];
                        fprintf(f, "%d\r\n", temp); 
                    }else{
                        temp = frame_Y2[conte2];
                        fprintf(f, "%d,", temp);
                    }
                    conte2++;
                }
            }
        }
        
        // cambio riga quando raggiungo il numero di blocchi in lunghezza  (44)
        if(c % (frameSizeW/BLOCKWIDTH) == 0)
            row = ++row%2;
    }
    fclose(f);
    cP = 0;
    return;
  }
   
}
     
     
/*BFUNC
 * Funzione che preleva i valori dai blocchi e li riordina secondo l'alternanza righe pari/dispari inserendoli in 
 * un array di supporto.
 * Questo array sevirà dopo per ricomporre il canale U dell'intero frame blocco per blocco.
EFUNC*/    
void CreateFrameMatrixU(int *matrix){
    
  BEGIN("CreateFrameMatrix");
 
  int i,j;

 
  if(cP2 < MAX_COUNT/4){
    int temp;
    if (matrix){
        for(i=0;i<BLOCKHEIGHT;i++){
            for(j=0;j<BLOCKWIDTH;j++){
                temp = *(matrix++);
                frame_U[c_U] = temp;
                c_U++;
            }
        }
    }
  }
  
  cP2++;
  if(cP2 == MAX_COUNT/4){
     
    char fileN[50];

    c_U = 0;
    cont_f_U = 0;
   
    // creo il file U.txt contente i valori ordinati dell'intero frame
    sprintf(fileN,path_matrix_U);   
    FILE *f = fopen(fileN, "w");

    if(f == NULL){
      printf("Error opening file!");
      exit(1);
    } 

    int conte = 0;
    for(int c = 1;c <= MAX_COUNT;c++){
        for(int i = 0;i < BLOCKHEIGHT;i++){
            for(int j = 0;j < BLOCKWIDTH;j++){
                int temp = frame_U[conte];
                if(j == BLOCKWIDTH-1){
                    fprintf(f, "%d\r\n", temp); 
                }else{
                    temp = frame_U[conte];
                    fprintf(f, "%d,", temp);
                }
                conte++;
            }
        }
    }
    
    fclose(f);
    cP2 = 0;
    return;
  }
  
}


/*BFUNC
 * Funzione che preleva i valori dai blocchi e li riordina secondo l'alternanza righe pari/dispari inserendoli in 
 * un array di supporto.
 * Questo array sevirà dopo per ricomporre il canale V dell'intero frame blocco per blocco.
EFUNC*/ 
void CreateFrameMatrixV(int *matrix){
    
  BEGIN("CreateFrameMatrix");
 
  int i,j;

 
  if(cP3 < MAX_COUNT/4){
    int temp;
    if (matrix){
        for(i=0;i<BLOCKHEIGHT;i++){
            for(j=0;j<BLOCKWIDTH;j++){
                temp = *(matrix++);
                frame_V[c_V] = temp;
                c_V++;
            }
        }
    }
  }
  
  cP3++;
  
  if(cP3 == MAX_COUNT/4){
     
    char fileN[50];
    c_V = 0;
  
    sprintf(fileN,path_matrix_V);   

    // creo il file V.txt contente i valori ordinati dell'intero frame
    FILE *f = fopen(fileN, "w");
    if(f == NULL){
      printf("Error opening file!");
      exit(1);
    } 

    int conte = 0;
    for(int c = 1;c <= MAX_COUNT;c++){
        for(int i = 0;i < BLOCKHEIGHT;i++){
            for(int j = 0;j < BLOCKWIDTH;j++){
                int temp = frame_V[conte];
                if(j == BLOCKWIDTH-1){
                    fprintf(f, "%d\r\n", temp); 
                }else{
                    temp = frame_V[conte];
                    fprintf(f, "%d,", temp);
                }
                conte++;
            }
        }
    }
    fclose(f);
    cP3 = 0;
    return;
  }
 
}


/*BFUNC
 * Funzione che altera le frequenze sul canale della luminanza in corrispondenza delle ROI 
 * calcolate (volti riconosciuti) con una sequenza di interi pseudocasuale a partire da un seme 
 * password passato dall'utente.
 * I blocchi (matrix) vengono elaborati secondo una sequenza che prevede prima i blocchi sulle
 * righe pari dell'immagine e poi i blocchi sulle righe dispari. Il paramatro meta definisce
 * esattamente se si tratta delle righe pari (meta=2) oppure le righe dispari (meta=1)
EFUNC*/
int myX=0, myY=0;
void ChangePixelMatrixY(matrix, meta)
     int *matrix, meta;
{
    
  BEGIN("ChangePixelMatrixLU");
  
  // Ottengo il json del file ROI.json contente le ROI del frame corrente precedentemente calcolato
  const cJSON *ROI  = NULL;
  char s[100];
  sprintf(s, "%d",CurrentFrame-StartFrame);
  const cJSON *ROIs = cJSON_GetObjectItemCaseSensitive(json,s);
 
  
  // Costruisco il frame (composto da 1320 blocchi per dim 352x240)
  if(cP <= MAX_COUNT-1){
        for(int i = 0;i < BLOCKHEIGHT;i++){
            for(int j = 0;j < BLOCKWIDTH;j++){

                int myX = -1, myY = -1;
                
                // In base al numero di blocco corrente, calcolo la posizione (x,y) del valore all'interno del frame
                if(meta == 1){
                    int block = ((int)floor(cont_f1/dimBlock))%numBlocksW;
                    myX = block*8 + j;
                    myY = n_row_meta1*8 + i;
                    cont_f1++;
                }else{
                    int block = (int)floor(cont_f2/dimBlock)%numBlocksW;
                    myX = block*8 + j;
                    myY = n_row_meta2*8 + i;
                    cont_f2++;
                }
   
                // Ciclo tutte le ROI ottenute dalla system call di scrambling eseguita sul frame precedentemente
                // calcolato e verifico se la posizione (x,y) del valore considerato cade in una delle ROI. Se è
                // così sono sicuro di aver individuato un volto e quindi altero il valore con il valore random
                // pseudocasuale v
                cJSON_ArrayForEach(ROI, ROIs)
                {
                    cJSON *x = cJSON_GetObjectItemCaseSensitive(ROI, "x");
                    cJSON *y = cJSON_GetObjectItemCaseSensitive(ROI, "y");
                    cJSON *w = cJSON_GetObjectItemCaseSensitive(ROI, "w");
                    cJSON *h = cJSON_GetObjectItemCaseSensitive(ROI, "h");

                    // Se la posizione corrente del frame è inclusa in una ROI altera il valore con il valore random
                    if( myX >= x->valueint && myX <= (x->valueint+w->valueint) &&
                        myY >= y->valueint && myY <= (y->valueint+h->valueint)){
                        
                        // altero i coefficienti che cadono nella ROI in base al successivo intero peudocasuale
                        int v = rand()%128;
                        *matrix += v;
                    }
                }
                *(matrix++);
            }
        }
        n_row_meta2 = (int)floor(cont_f2/dimBlock/numBlocksW)*2 + 1;                
        n_row_meta1 = (int)floor(cont_f1/dimBlock/numBlocksW)*2;
    }
    cP++;
    
    if(cP >= MAX_COUNT){
        cP = 0;
        n_row_meta1 = 0;
        n_row_meta2 = 0;
        cont_f1 = 0;
        cont_f2 = 0;
    }
} 

     
     
/*BFUNC
 * Funzione che altera le frequenze sul canale del canale di crominanza U in corrispondenza delle ROI 
 * calcolate (volti riconosciuti) con una sequenza di interi pseudocasuale a partire da un seme 
 * password passato dall'utente.
 * I blocchi (matrix) vengono elaborati secondo una sequenza che prevede prima i blocchi sulle
 * righe pari dell'immagine e poi i blocchi sulle righe dispari. Il paramatro meta definisce
 * esattamente se si tratta delle righe pari (meta=2) oppure le righe dispari (meta=1)
EFUNC*/
int myX_U=0, myY_U=0, cP_U=0;
void ChangePixelMatrixU(matrix)
     int *matrix;
{
    
  BEGIN("ChangePixelMatrixU");
 
  // Ottengo il json del file ROI.json contente le ROI del frame corrente precedentemente calcolato
  const cJSON *ROI  = NULL;
  char s[100];
  sprintf(s, "%d",CurrentFrame-StartFrame);
  const cJSON *ROIs = cJSON_GetObjectItemCaseSensitive(json,s);

  // Altero i pixel del frame della Crominanza (composto da 330 blocchi per dim 276x120)
  if(cP_U <= MAX_COUNT/4-1){
        for(int i = 0;i < BLOCKHEIGHT;i++){
            for(int j = 0;j < BLOCKWIDTH;j++){

                int myX_U = -1, myY_U = -1;
                
                // In base al numero di blocco corrente, calcolo la posizione (x,y) del valore all'interno del frame
                int block = ((int)floor(cont_f_U/dimBlock))%(numBlocksW/2);
                myX_U = block*8 + j;
                myY_U = n_row_U*8 + i;
                cont_f_U++;
                
                // Ciclo tutte le ROI ottenute dalla system call di scrambling eseguita sul frame precedentemente
                // calcolato e verifico se la posizione (x,y) del valore considerato cade in una delle ROI. Se è
                // così sono sicuro di aver individuato un volto e quindi altero il valore con il valore random
                // pseudocasuale v
                cJSON_ArrayForEach(ROI, ROIs)
                {
                    cJSON *x = cJSON_GetObjectItemCaseSensitive(ROI, "x");
                    cJSON *y = cJSON_GetObjectItemCaseSensitive(ROI, "y");
                    cJSON *w = cJSON_GetObjectItemCaseSensitive(ROI, "w");
                    cJSON *h = cJSON_GetObjectItemCaseSensitive(ROI, "h");

                   
                    // Se la posizione corrente del frame è inclusa in una ROI altera il valore con il valore random
                    if( myX_U >= (int)floor(x->valueint/2) && 
                        myX_U <= (int)floor(((x->valueint/2)+(w->valueint/2))) &&
                        myY_U >= (int)floor(y->valueint/2) && 
                        myY_U <= (int)floor(((y->valueint/2)+(h->valueint/2)))){
                        
                        // altero i coefficienti che cadono nella ROI in base al successivo intero peudocasuale
                        int v = rand()%128;
                        *matrix += v;
                    }
                }
                *(matrix++);
            }
        }              
        n_row_U = (int)floor(cont_f_U/dimBlock/(numBlocksW/2));
  }
  cP_U++;
  
  if(cP_U >= MAX_COUNT/4){
    n_row_U = 0;
    cP_U=0;
    cont_f_U = 0;
  }
  
}  
     
     

/*BFUNC
 * Funzione che altera le frequenze sul canale del canale di crominanza U in corrispondenza delle ROI 
 * calcolate (volti riconosciuti) con una sequenza di interi pseudocasuale a partire da un seme 
 * password passato dall'utente.
 * I blocchi (matrix) vengono elaborati secondo una sequenza che prevede prima i blocchi sulle
 * righe pari dell'immagine e poi i blocchi sulle righe dispari. Il paramatro meta definisce
 * esattamente se si tratta delle righe pari (meta=2) oppure le righe dispari (meta=1)
EFUNC*/
int myX_V=0, myY_V=0, cP_V=0;
void ChangePixelMatrixV(matrix)
     int *matrix;
{
    
  BEGIN("ChangePixelMatrixV");
 
  // Ottengo il json del file ROI.json contente le ROI del frame corrente precedentemente calcolato
  const cJSON *ROI  = NULL;
  char s[100];
  sprintf(s, "%d",CurrentFrame-StartFrame);
  const cJSON *ROIs = cJSON_GetObjectItemCaseSensitive(json,s);
  int v;
  // Altero i pixel del frame della Crominanza (composto da 330 blocchi per dim 276x120)
  if(cP_V <= MAX_COUNT/4-1){
        for(int i = 0;i < BLOCKHEIGHT;i++){
            for(int j = 0;j < BLOCKWIDTH;j++){

                int myX_V = -1, myY_V = -1;
                
                // In base al numero di blocco corrente, calcolo la posizione (x,y) del valore all'interno del frame
                int block = ((int)floor(cont_f_V/dimBlock))%(numBlocksW/2);
                myX_V = block*8 + j;
                myY_V = n_row_V*8 + i;
                cont_f_V++;
                
                // Ciclo tutte le ROI ottenute dalla system call di scrambling eseguita sul frame precedentemente
                // calcolato e verifico se la posizione (x,y) del valore considerato cade in una delle ROI. Se è
                // così sono sicuro di aver individuato un volto e quindi altero il valore con il valore random
                // pseudocasuale v
                cJSON_ArrayForEach(ROI, ROIs)
                {
                    cJSON *x = cJSON_GetObjectItemCaseSensitive(ROI, "x");
                    cJSON *y = cJSON_GetObjectItemCaseSensitive(ROI, "y");
                    cJSON *w = cJSON_GetObjectItemCaseSensitive(ROI, "w");
                    cJSON *h = cJSON_GetObjectItemCaseSensitive(ROI, "h");

                   
                    // Se la posizione corrente del frame è inclusa in una ROI altera il valore con il valore random
                    if( myX_V >= (int)floor(x->valueint/2) && 
                        myX_V <= (int)floor(((x->valueint/2)+(w->valueint/2))) &&
                        myY_V >= (int)floor(y->valueint/2) && 
                        myY_V <= (int)floor(((y->valueint/2)+(h->valueint/2)))){
                        
                        // altero i coefficienti che cadono nella ROI in base al successivo intero peudocasuale
                        int v = rand()%128;
                        *matrix += v;
                    }
                }
                *(matrix++);
            }
        }              
        n_row_V = (int)floor(cont_f_V/dimBlock/(numBlocksW/2));
  }
  cP_V++;
  
  if(cP_V >= MAX_COUNT/4){
    n_row_V = 0;
    cont_f_V = 0;
    cP_V=0;
  }
  
}  



/*BFUNC
 * Funzione ricostruisce i pixel originari dell'immagine sul canale di luminanza Y
EFUNC*/ 
void ReplacePixelMatrixY(matrix, meta)
     int *matrix, meta;
{
    
  BEGIN("ReplacePixelMatrixY");

  // Cerco nel file ROIs.json le ROI riguardanti il frame corrente
  const cJSON *ROI  = NULL;
  char s[100];
  sprintf(s, "%d",CurrentFrame);
  const cJSON *ROIs = cJSON_GetObjectItemCaseSensitive(json,s);

  if(cP <= MAX_COUNT-1){  
      
    for(int i = 0;i < BLOCKHEIGHT;i++){
        for(int j = 0;j < BLOCKWIDTH;j++){
            int myX = -1, myY = -1;
            if(meta == 1){
                int block = ((int)floor(cont_f1/dimBlock))%numBlocksW;
                myX = block*8 + j;
                myY = n_row_meta1*8 + i;
                cont_f1++;
            }else{
                int block = (int)floor(cont_f2/dimBlock)%numBlocksW;
                myX = block*8 + j;
                myY = n_row_meta2*8 + i;
                cont_f2++;
            }
            
            // Ciclo tutte le ROI del file ROIs.json calcolati in una fase di scrambling precedente
            // e verifico se la posizione (x,y) del valore considerato cade in una delle ROI. Se è
            // così sono sicuro di aver individuato la regione alterata e quindi ripristino il valore a partire del valore
            // pseudocasuale v in base allo stesso seme utilizzato nello scrambling
            cJSON_ArrayForEach(ROI, ROIs)
            {
                cJSON *x = cJSON_GetObjectItemCaseSensitive(ROI, "x");
                cJSON *y = cJSON_GetObjectItemCaseSensitive(ROI, "y");
                cJSON *w = cJSON_GetObjectItemCaseSensitive(ROI, "w");
                cJSON *h = cJSON_GetObjectItemCaseSensitive(ROI, "h");

              
                if( myX >= x->valueint && myX <= (x->valueint+w->valueint) &&
                    myY >= y->valueint && myY <= (y->valueint+h->valueint)){
                    
                    // ripristino i coefficienti che cadono nella ROI in base al successivo intero peudocasuale
                    int v = rand()%128;
                    *matrix -= v;
                }
            }
            *(matrix++); 
          }
    }
    n_row_meta2 = (int)floor(cont_f2/dimBlock/numBlocksW)*2 + 1;                
    n_row_meta1 = (int)floor(cont_f1/dimBlock/numBlocksW)*2;
    }
  
  cP++;
  
  if(cP >= MAX_COUNT){
        cP = 0;
        n_row_meta1 = 0;
        n_row_meta2 = 0;
        cont_f1 = 0;
        cont_f2 = 0;
    }   
}  
     
     

/*BFUNC
 * Funzione ricostruisce i pixel originari dell'immagine sul canale di crominanza U
EFUNC*/
void ReplacePixelMatrixU(matrix)
     int *matrix;
{
    
  BEGIN("ReplacePixelMatrixU");
 
  // Cerco nel file ROIs.json le ROI riguardanti il frame corrente
  const cJSON *ROI  = NULL;
  char s[100];
  sprintf(s, "%d",CurrentFrame);
  const cJSON *ROIs = cJSON_GetObjectItemCaseSensitive(json,s);
  
  // Altero i pixel del frame della Crominanza (composto da 330 blocchi per dim 276x120)
  if(cP_U <= MAX_COUNT/4-1){
        for(int i = 0;i < BLOCKHEIGHT;i++){
            for(int j = 0;j < BLOCKWIDTH;j++){

                int myX_U = -1, myY_U = -1;
                
                // In base al numero di blocco corrente, calcolo la posizione (x,y) del valore all'interno del frame
                int block = ((int)floor(cont_f_U/dimBlock))%(numBlocksW/2);
                myX_U = block*8 + j;
                myY_U = n_row_U*8 + i;
                cont_f_U++;
                
                // Ciclo tutte le ROI ottenute dalla system call di scrambling eseguita sul frame precedentemente
                // calcolato e verifico se la posizione (x,y) del valore considerato cade in una delle ROI. Se è
                // così sono sicuro di aver individuato un volto e quindi altero il valore con il valore random
                // pseudocasuale v
                cJSON_ArrayForEach(ROI, ROIs)
                {
                    cJSON *x = cJSON_GetObjectItemCaseSensitive(ROI, "x");
                    cJSON *y = cJSON_GetObjectItemCaseSensitive(ROI, "y");
                    cJSON *w = cJSON_GetObjectItemCaseSensitive(ROI, "w");
                    cJSON *h = cJSON_GetObjectItemCaseSensitive(ROI, "h");

                   
                    // Se la posizione corrente del frame è inclusa in una ROI altera il valore con il valore random
                    if( myX_U >= (int)floor(x->valueint/2) && 
                        myX_U <= (int)floor(((x->valueint/2)+(w->valueint/2))) &&
                        myY_U >= (int)floor(y->valueint/2) && 
                        myY_U <= (int)floor(((y->valueint/2)+(h->valueint/2)))){
                        
                        // ripristino i coefficienti che cadono nella ROI in base al successivo intero peudocasuale
                        int v = rand()%128;
                        *matrix -= v;
                    }
                }
                *(matrix++);
            }
        }              
        n_row_U = (int)floor(cont_f_U/dimBlock/(numBlocksW/2));
  }
  cP_U++;
  
  if(cP_U >= MAX_COUNT/4){
    n_row_U = 0;
    cont_f_U = 0;
    cP_U=0;
  }
  
}  

     
/*BFUNC
 * Funzione ricostruisce i pixel originari dell'immagine sul canale di crominanza V
EFUNC*/
void ReplacePixelMatrixV(matrix)
     int *matrix;
{
    
  BEGIN("ReplacePixelMatrixV");
 
  // Cerco nel file ROIs.json le ROI riguardanti il frame corrente
  const cJSON *ROI  = NULL;
  char s[100];
  sprintf(s, "%d",CurrentFrame);
  const cJSON *ROIs = cJSON_GetObjectItemCaseSensitive(json,s);
  
  // Altero i pixel del frame della Crominanza (composto da 330 blocchi per dim 276x120)
  if(cP_V <= MAX_COUNT/4-1){
        for(int i = 0;i < BLOCKHEIGHT;i++){
            for(int j = 0;j < BLOCKWIDTH;j++){

                int myX_V = -1, myY_V = -1;
                
                // In base al numero di blocco corrente, calcolo la posizione (x,y) del valore all'interno del frame
                int block = ((int)floor(cont_f_V/dimBlock))%(numBlocksW/2);
                myX_V = block*8 + j;
                myY_V = n_row_V*8 + i;
                cont_f_V++;
                
                // Ciclo tutte le ROI ottenute dalla system call di scrambling eseguita sul frame precedentemente
                // calcolato e verifico se la posizione (x,y) del valore considerato cade in una delle ROI. Se è
                // così sono sicuro di aver individuato un volto e quindi altero il valore con il valore random
                // pseudocasuale v
                cJSON_ArrayForEach(ROI, ROIs)
                {
                    cJSON *x = cJSON_GetObjectItemCaseSensitive(ROI, "x");
                    cJSON *y = cJSON_GetObjectItemCaseSensitive(ROI, "y");
                    cJSON *w = cJSON_GetObjectItemCaseSensitive(ROI, "w");
                    cJSON *h = cJSON_GetObjectItemCaseSensitive(ROI, "h");

                   
                    // Se la posizione corrente del frame è inclusa in una ROI altera il valore con il valore random
                    if( myX_V >= (int)floor(x->valueint/2) && 
                        myX_V <= (int)floor(((x->valueint/2)+(w->valueint/2))) &&
                        myY_V >= (int)floor(y->valueint/2) && 
                        myY_V <= (int)floor(((y->valueint/2)+(h->valueint/2)))){
                        
                        // ripristino i coefficienti che cadono nella ROI in base al successivo intero peudocasuale
                        int v = rand()%128;
                        *matrix -= v;
                    }
                }
                *(matrix++);
            }
        }              
        n_row_V = (int)floor(cont_f_V/dimBlock/(numBlocksW/2));
  }
  cP_V++;
  
  if(cP_V >= MAX_COUNT/4){
    n_row_V = 0;
    cont_f_V = 0;
    cP_V=0;
  }
  
}  
  
     
// FUNZIONI UTILIZZATE PER LA CREAZIONE DEL CODICE HASH
size_t stringLength(const char* source)
{
    if(source == NULL) { return 0; }

    size_t length = 0;
    while(*source != '\0') {
        length++;
        source++;
    }
    return length;  
}
     
int getHash(const char* source)
{
    size_t length = stringLength(source);
    size_t hash = 0;
    for(size_t i = 0; i < length; i++) {
        char c = source[i];
        int a = c - '0';
        hash = (hash * 10) + a;     
    } 

    return hash;
}
