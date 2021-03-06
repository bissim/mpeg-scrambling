/*************************************************************
 Copyright (C) 1990, 1991, 1993 Andy C. Hung, all rights reserved.
 PUBLIC DOMAIN LICENSE: Stanford University Portable Video Research
 Group. If you use this software, you agree to the following: This
 program package is purely experimental, and is licensed "as is".
 Permission is granted to use, modify, and distribute this program
 without charge for any purpose, provided this license/ disclaimer
 notice appears in the copies.  No warranty or maintenance is given,
 either expressed or implied.  In no event shall the author(s) be
 liable to you or a third party for any special, incidental,
 consequential, or other damages, arising out of the use or inability
 to use the program for any purpose (or the loss of data), even if we
 have been advised of such possibilities.  Any public reference or
 advertisement of this source code should refer to it as the Portable
 Video Research Group (PVRG) code, and not by any author(s) (or
 Stanford University) name.
 *************************************************************/
/*
 ************************************************************
 mpeg.c

 This is the file that has the "main" routine and all of the associated
 high-level routines.  Some of these routines are kludged from the
 jpeg.c files and have somewhat more extensibility towards multiple
 image components and sampling rates than required.

 This file was written before the established structure given in the
 MPEG coded bitstream syntax.  Much of the inherent structure of the
 finalized syntax is not exploited.

 *******************

 Update 2016:
 Insert a watermark file or text message in mpeg file
 Extract a watermark file or text message from mpeg file

 Author: Leo Aniello (aniello.leo@gmail.com)
 Copyright(C) 2016 Leo Aniello, all rights reserved.
 Salerno University

 ************************************************************
 */

/*LABEL mpeg.c */
#define __USE_GNU

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include "globals.h"
#include "qtables.h"
#include "mpeg.h"
#include "watermark.h"
#include "scrambling.h"



#define TEMPORAL_MODULO 1024

/*PUBLIC*/

int main();

/*PRIVATE*/

#define SwapFS(fs1,fs2) {FSTORE *ftemp;ftemp = fs1;fs1 = fs2;fs2 = ftemp;}

IMAGE *CImage=NULL;              /* Current Image definition structure */
FRAME *CFrame=NULL;              /* Current Frame definition structure */
FSTORE *CFStore=NULL;            /* Current fram in use */
FSTORE *CFSBase=NULL;            /* Base frame for interpolative prediction */
FSTORE *CFSNext=NULL;            /* Next (pred, intra) for interpol. pred. */
FSTORE *CFSMid=NULL;             /* Mid frame for interpolative pred. */
FSTORE *CFSNew=NULL;             /* New frame generated */
FSTORE *CFSUse=NULL;             /* Original frame */
STAT *CStat=NULL;                /* Statistics package */

int **FMX;                       /* Motion vector arrays for forward */
int **BMX;                       /* and backward compensation */
int **FMY;
int **BMY;

MEM **FFS;                       /* Memory blocks used for frame stores */

/* The following component indices point to given blocks in the CBP */

int BlockJ[] = {0,0,0,0,1,2};    /* Index positions for which color component*/
int BlockV[] = {0,0,1,1,0,0};    /* Vertical and horizontal indices */
int BlockH[] = {0,1,0,1,0,0};

char *DefaultSuffix[] = {".Y", ".U", ".V"};  /* Suffixes for generic files */

/* MPEG Marker information */

/* Video sequence information */
int HorizontalSize=0;               /* Horizontal dimensions */
int VerticalSize=0;                 /* Vertical dimensions */
int Aprat = 1;                      /* Aspect ratio */
int DropFrameFlag=0;                /* Whether frame will be dropped */
int Prate = 5;                      /* Picture rate (def 30fps) */
int Brate = 0x3ffff;                /* Bit rate */
int Bsize = 0;                      /* Buffer size */
int ConstrainedParameterFlag=0;     /* Default: unconstrained */
int LoadIntraQuantizerMatrix=0;     /* Quantization load */
int LoadNonIntraQuantizerMatrix=0;

/* Group of pictures layer */
int TimeCode= -1;                     /* SMPTE timestamp */
int ClosedGOP=0;                    /* Back pred. needed of GOP */
int BrokenLink=0;                   /* Whether editing has occurred. */
/* Picture layer */
int TemporalReference=0;            /* "frame" reference with base of GOP */
int PType=P_INTRA;                  /* Picture type */
int BufferFullness=0;               /* Current fullness of buffer */
int FullPelForward=0;               /* Forward motion vector on full pel */
int ForwardIndex=0;                 /* Decoding table to be used */
int FullPelBackward=0;              /* Backward motion vector on full pel */
int BackwardIndex=0;                /* Decoding table to be used */
int PictureExtra=0;                 /* Flag set if extra info present */
int PictureExtraInfo=0;

int SQuant=1;          /* Slice quantization */
int MBperSlice=0;      /* Number of macroblocks per slice */
/* If zero, set automaticallly */
int SliceExtra=0;      /* (Last) slice extra flag */
int SliceExtraInfo=0;  /* (Last) slice extra information */

int MType=0;           /* Macroblock type */
int LastMType;  /* Last encoded MType */
int SkipMode;   /* Whether we skip coding */
int EncStartSlice;    /* If encoder has started a slice */
int EncEndSlice;      /* If encoder has ended a slice */
int EncPerfectSlice=1;  /* Set if you want first and  last block */
/* of a slice to be defined. Clear if you */
/* allow skipped macroblocks between frames */
int UseTimeCode=0;/*If 1 forces frame number to be same as time code */

int MQuant=1;          /* Macroblock quantization */
int SVP=0;             /* Slice vertical position */
int MVD1H=0;           /* Forward motion vector */
int MVD1V=0;
int MVD2H=0;           /* Backward motion vector */
int MVD2V=0;
int LastMVD1H=0;       /* Interpolative predictors */
int LastMVD1V=0;
int LastMVD2H=0;
int LastMVD2V=0;
int CBP=0x3f;          /* Coded block pattern */

int MBSRead=0;
int MBAIncrement=0;
int LastMBA=0;
int CurrentMBA=0;


/* Type Definitions */

/* We define the following variables by layers, to avoid compatibility
 problems with compilers unable to do automatic aggregate
 initialization.

 The MType arrays are indexed on macroblock type.
 The PMType arrays are indexed on picture type and macroblock type. */

// Quantization used
int IntraQuantMType[] = {0,1};
int PredQuantMType[] = {0,0,0,0,1,1,1};
int InterQuantMType[] = {0,0,0,0,0,0,0,1,1,1,1};
int DCQuantMType[] = {0};
int *QuantPMType[] = {
    (int *) 0,
    IntraQuantMType,
    PredQuantMType,
    InterQuantMType,
    DCQuantMType};

// Motion forward vector used
int IntraMFMType[] = {0,0};
int PredMFMType[] = {1,0,1,0,1,0,0};
int InterMFMType[] = {1,1,0,0,1,1,0,1,1,0,0};
int DCMFMType[] = {0};
int *MFPMType[] = {
    (int *) 0,
    IntraMFMType,
    PredMFMType,
    InterMFMType,
    DCMFMType};

// Motion backward vector used
int IntraMBMType[] = {0,0};
int PredMBMType[] = {0,0,0,0,0,0,0};
int InterMBMType[] = {1,1,1,1,0,0,0,1,0,1,0};
int DCMBMType[] = {0};
int *MBPMType[] = {
    (int *) 0,
    IntraMBMType,
    PredMBMType,
    InterMBMType,
    DCMBMType};

// CBP used in coding
int IntraCBPMType[] = {0,0};
int PredCBPMType[] = {1,1,0,0,1,1,0};
int InterCBPMType[] = {0,1,0,1,0,1,0,1,1,1,0};
int DCCBPMType[] = {0};
int *CBPPMType[] = {
    (int *) 0,
    IntraCBPMType,
    PredCBPMType,
    InterCBPMType,
    DCCBPMType};

// Intra coded macroblock
int IntraIMType[2] = {1,1};
int PredIMType[7] = {0,0,0,1,0,0,1};
int InterIMType[11] = {0,0,0,0,0,0,1,0,0,0,1};
int DCIMType[1] = {1};
int *IPMType[5] = {
    (int *) 0,
    IntraIMType,
    PredIMType,
    InterIMType,
    DCIMType};

/* System Definitions */

int DynamicMVBound=0;       /* Dynamically calculate motion vector bounds */
int XING=0;                 /* If set, then outputs XING compatible file?*/
int ImageType=IT_NTSC;      /* Default type is NTSC, can be changed to CIF*/

int MBWidth=0;              /* Number macroblocks widexhigh */
int MBHeight=0;
int HPos=0;                 /* Current macroblock position widexhigh */
int VPos=0;
int CurrentMBS=0;           /* Current macroblock slice count */

int BaseFrame=0;            /* Base frame for interpolative mode */
int CurrentFrame=0;         /* Current frame in encoding */
int StartFrame=0;           /* Start frame of encoding */
int LastFrame=0;            /* Last frame of encoding */
int GroupFirstFrame=0;      /* First frame number of current group */
int FrameOffset= -1;        /* Offset by TIMECODE */
int framesNumber;           /* Frames number */

int FrameDistance=1;        /* Distance between interpol. frame and base */
int FrameInterval=3;        /* Frame interval between pred/intra frames */
int FrameGroup=2;           /* Number of frame intervals per group */
int FrameIntervalCount=0;   /* Current frame interval count */

/* Not used, but sometimes defined for P*64 */
int FrameSkip=1;            /* Frame skip value */

/* Stuff for RateControl */

/*Xing Added 9; added to 15 */
int PrateIndex[] = {0,24,24,25,30,30,50,60,60,30,30,30,30,30,30,30};
int FileSizeBits=0;
int Rate=0;             /* Rate of the system in bits/second */
int BufferOffset=0;     /* Number of bits assumed for initial buffer. */
int QDFact=1;
int QOffs=1;
int QUpdateFrequency=11;
int QUse=0;
int QSum=0;

/* Some internal parameters for rate control */

#define DEFAULT_QUANTIZATION 8
int InitialQuant=0;
int UseQuant;

/* Parser stuff */

extern double Memory[];

/* Stuff for Motion Compensation */

extern int SearchLimit;
extern int MVTelescope;
extern int bit_set_mask[];
extern int MX;
extern int MY;
extern int NX;
extern int NY;
extern int MVPrediction;

/* Fixed coding parameters */
int inputbuf[10][64];
int interbuf[10][64];
int fmcbuf[10][64];
int bmcbuf[10][64];
int imcbuf[10][64];
int outputbuf[10][64];
int output[64];
int LastDC[3];

/* Variabile utili per lo scrambling */
char *pass_scramb = "enter";
int strength = 0;
int clean = 0;

/* Book-keeping stuff */

int DCIntraFlag=0;                 /* Whether we use DC Intra or not*/
int ErrorValue=0;                  /* Error value registered */
int Loud=MUTE;                     /* Loudness of debug */
int Oracle=0;                      /* Oracle consults fed program */

/* Statistics */

int NumberNZ=0;                    /* Number transform nonzero */
int NumberOvfl=0;                  /* Number overflows registered */
extern int MotionVectorBits;       /* Number of bits for motion vectors */
extern int MacroAttributeBits;     /* Number of bits for macroblocks */
extern int CodedBlockBits;         /* Number of bits for coded block */
int YCoefBits=0;                   /* Number of bits for Y coeff */
int UCoefBits=0;                   /* Number of bits for U coeff */
int VCoefBits=0;                   /* Number of bits for V coeff */
extern int EOBBits;                /* Number of bits for End-of-block */
static int StuffCount;

int MaxTypes;
int MacroTypeFrequency[20];
int YTypeFrequency[20];
int UVTypeFrequency[20];

int TotalBits,LastBits;            /* Total number of bits, last frame bits */


/* Huffman Stuff */

extern DHUFF *DCLumDHuff;          /* Huffman tables used for coding */
extern DHUFF *DCChromDHuff;
extern EHUFF *DCLumEHuff;
extern EHUFF *DCChromEHuff;

/* DCT Stuff */
/* Functional and macro declarations */

vFunc *UseDct = ChenDct;
vFunc *UseIDct = ChenIDct;
#define DefaultDct (*UseDct)
#define DefaultIDct (*UseIDct)


/* Buffer definitions */

int BufferSize = 20*(16*1024);       /* 320 kbits */
#define FrameRate() PrateIndex[Prate]
#define BufferContents() (mwtell() + BufferOffset -\
			  (((VPos*MBWidth)+HPos)\
                          *Rate*FrameSkip\
                          /(MBHeight*MBWidth*FrameRate())))

/*START*/


/*BFUNC

 main() is the first routine called by program activation. It parses
 the input command line and sets parameters accordingly.

 EFUNC*/
int main(argc,argv)
    int argc;
    char **argv;
{
    BEGIN("main");
    int i,p,s;

    // ai fini del testing
    struct timespec _start, _stop;
    // gettimeofday(&_start, NULL);
    clock_gettime(CLOCK_REALTIME, &_start);

    MakeImage();   /* Initialize storage */
    MakeFrame();
    inithuff();    /* Put Huffman tables on */
    if (argc==1)
    {
        Help();
        exit(-1);
    }
    for (s=0,p=0,i=1; i<argc; i++)
    {
        if (!strcmp("-NTSC",argv[i]))
            ImageType = IT_NTSC;
        else if (!strcmp("-CIF",argv[i]))
            ImageType = IT_CIF;
        else if (!strcmp("-QCIF",argv[i]))
            ImageType = IT_QCIF;
        else if (!strcmp("-PF",argv[i]))
            CImage->PartialFrame=1;
        else if (!strcmp("-NPS",argv[i]))
            EncPerfectSlice=0;
        else if (!strcmp("-MBPS",argv[i]))
            MBperSlice=atoi(argv[++i]);
        else if (!strcmp("-UTC",argv[i]))
            UseTimeCode=1;
        else if (!strcmp("-XING",argv[i]))
	    {
            XING=1;
            HorizontalSize=160;
            VerticalSize=120;
	    }
        else if (!strcmp("-DMVB",argv[i]))
            DynamicMVBound=1;
        else if (!strcmp("-MVNT",argv[i]))
            MVTelescope=0;
        else if (!strcmp("-scramb",argv[i])) // applica lo scrambling ai frame
            scrambling = 1;
        else if (!strcmp("-pass",argv[i])){ // se viene passata una password come seme dello scrambling
            char *p = argv[++i];
            if (p != NULL) pass_scramb = p;
        } else if (!strcmp("-streng",argv[i])) { // se viene passata una password come seme dello scrambling
            strength = 1;
        } else if (!strcmp("-clean",argv[i])) { // se viene passata una password come seme dello scrambling
            clean = 1;
        } else if (!strcmp("-ifwf_lsb",argv[i])) { // insert frequency watermark file (inserimento di un file come watermark nel dominio delle frequenze)
            watermarkString = getFileToString(argv[++i], &watermarkStringSize);
            printf("watermarkStringSize: %i\n", watermarkStringSize);
            printf("Dimensione del watermark: %i ( %s )\n", watermarkStringSize, getBitsFromInt(watermarkStringSize));
            watermarkType = LSB;
        } else if (!strcmp("-ifwm_lsb",argv[i])) { // insert frequency watermark message (inserimento di un messaggio come watermark nel dominio delle frequenze)
            watermarkString = argv[++i];
            watermarkStringSize = strlen(watermarkString);
            printf("Dimensione del watermark: %i ( %s )\n", watermarkStringSize, getBitsFromInt(watermarkStringSize));
            watermarkType = LSB;
        } else if (!strcmp("-efwf_lsb",argv[i])) { // extract frequency watermark file (estrazione di un file come watermark dal dominio delle frequenze)
            watermarkOutFile = fopen (argv[++i], "wb");
            if (watermarkOutFile==NULL) {fputs("Watermark file error", stderr); exit(1);}
            watermarkType = LSB;
        } else if (!strcmp("-efwm_lsb",argv[i])) { // extract frequency watermark message (estrazione di un messaggio come watermark dal dominio delle frequenze)
            watermarkOutFile = stdout;
            watermarkType = LSB;
        } else if (!strcmp("-wseed",argv[i])) { // to spread the watermark (input for srand() function)
            wSeed = atoi(argv[++i]);
            if (wSeed < 1) {fputs("Parametro -wseed errato: deve essere un numero > di 0.", stderr); exit(1);}
        } else if (!strcmp("-wci",argv[i])) { // Watermark coefficient of insertion (it is multiplied by the size of the watermark)
            CInsWatermark = atoi(argv[++i]);
            if (CInsWatermark < 1) {fputs("Parametro -wci errato: deve essere un numero > di 0.", stderr); exit(1);}
        } else if (!strcmp("-wncb",argv[i])) { // Number of coefficients (DCT) per block to modify
            NCBtoMod = atoi(argv[++i]);
            if (NCBtoMod < 1 || NCBtoMod > 64) {fputs("Parametro -wncb errato: deve essere compreso tra 1 e 64.", stderr); exit(1);}
        } else if (!strcmp("-ifwf_cox",argv[i])) { // insert frequency watermark file (inserimento di un file come watermark nel dominio delle frequenze)
            watermarkString = getFileToString(argv[++i], &watermarkStringSize);
            watermarkType = COX;
        } else if (!strcmp("-ifwm_cox",argv[i])) { // insert frequency watermark message (inserimento di un messaggio come watermark nel dominio delle frequenze)
            watermarkString = argv[++i];
            watermarkStringSize = strlen(watermarkString);
            watermarkType = COX;
        } else if (!strcmp("-efwf_cox",argv[i])) { // extract frequency watermark file (estrazione di un file come watermark dal dominio delle frequenze)
            // file contenente i coefficienti senza modifica (solo quelli scelti per l'inserimento del watermark)
            originalCoeff = getFileToIntArray(argv[++i], &sizeOriginalCoeff);
            // file di output per il watermark estratto
            watermarkOutFile = fopen (argv[++i], "wb");
            if (watermarkOutFile==NULL) {fputs("Watermark file error", stderr); exit(1);}
            watermarkType = COX;
        } else if (!strcmp("-efwm_cox",argv[i])) { // extract frequency watermark message (estrazione di un messaggio come watermark dal dominio delle frequenze)
            // file contenente i coefficienti senza nodifica (solo quelli scelti per l'inserimento del watermark)
            originalCoeff = getFileToIntArray(argv[++i], &sizeOriginalCoeff);
            // stream di output per il watermark estratto
            watermarkOutFile = stdout;
            watermarkType = COX;
        } else if (!strcmp("-sogliaCox",argv[i])) {
            sogliaBitsWatermark = atoi(argv[++i]);
            if (sogliaBitsWatermark < 1 || sogliaBitsWatermark > 32) {fputs("Parametro -sogliaCox errato: deve essere compreso tra 1 e 32.", stderr); exit(1);}
            if ( 32 % sogliaBitsWatermark ) {
                fputs("Parametro -sogliaCox errato: deve essere divisore di 32.", stderr);
                exit(1);
            }
        } else if (!strcmp("-originalCoeff",argv[i])) {
            fdOrigCoef_cox = fopen(argv[++i], "wb");
            if (fdOrigCoef_cox==NULL) {
                fputs("File error",stderr);
                exit(1);
            }
        } else if (!strcmp("-dbw",argv[i])) {
            debugWatermark = atoi(argv[++i]);
            if (debugWatermark < 0 || debugWatermark > 2) {
                fputs("Parametro -dbw errato: deve essere compreso tra 0 e 2.", stderr);
                exit(1);
            }
        } else if (*(argv[i]) == '-') {
            switch(*(++argv[i]))
 	        {
                case '4':
                    DCIntraFlag=1;
                    break;
                case 'a':
                    BaseFrame = atoi(argv[++i]);
                    StartFrame=BaseFrame;
                    break;
                case 'b':
                    LastFrame = atoi(argv[++i]);
                    break;
                case 'c':
                    MVPrediction=1;
                    break;
                case 'd':
                    CImage->MpegMode |= M_DECODER;
                    break;
                case 'f':
                    FrameInterval = atoi(argv[++i]);
                    break;
                case 'g':
                    FrameGroup = atoi(argv[++i]);
                    break;
                case 'h':
                    HorizontalSize = atoi(argv[++i]);
                    break;
                case 'i':
                    SearchLimit = atoi(argv[++i]);
                    /* BoundValue(SearchLimit,1,15,"SearchLimit"); */
                    if (SearchLimit<1) SearchLimit=1;
                    DynamicMVBound=1;  /* Calculate the bounds appropriately */
                    break;
                    /* NOT USED
                     case 'k':
                     FrameSkip = atoi(argv[++i]);
                     break;
                     */
                case 'l':
                    Loud = atoi(argv[++i]);
                    break;
                case 'o':
                    Oracle=1;
                    break;
                case 'p':
                    Prate = atoi(argv[++i]);
                    if (Prate > 9 || Prate <= 0) {
                        printf("Invalid argument for option -p. Argument should be in the range [1, 8]. Non-standard 9 (15Hz) is also accepted)\n");
                        exit(ERROR_BOUNDS);
                    }
                    break;
                case 'q':
                    InitialQuant=atoi(argv[++i]);
                    BoundValue(InitialQuant,2,31,"InitialQuant");
                    break;
                case 'r':
                    Rate = (atoi(argv[++i]));
                    break;
                case 's':
                    CImage->StreamFileName = argv[++i];
                    break;
                case 'v':
                    VerticalSize = atoi(argv[++i]);
                    break;
                case 'x':
                    FileSizeBits = (atoi(argv[++i]));
                    break;
                case 'y':
                    UseDct = ReferenceDct;
                    UseIDct = ReferenceIDct;
                    break;
                case 'z':
                    strcpy(CFrame->ComponentFileSuffix[s++],argv[++i]);
                    break;
                default:
                    WHEREAMI();
                    printf("Illegal Option %c\n",*argv[i]);
                    exit(ERROR_BOUNDS);
                    break;
	        }
	    }
        else
	    {
            strcpy(CFrame->ComponentFilePrefix[p++], argv[i]);
            //path di lettura?
	    }
    }
    if (!CImage->StreamFileName)
    {
        if (!(CImage->StreamFileName = (char *) calloc(strlen(CFrame->ComponentFilePrefix[0])+6, sizeof(char))))
	    {
            WHEREAMI();
            printf("Cannot allocate string for StreamFileName.\n");
            exit(ERROR_MEMORY);
	    }
        sprintf(CImage->StreamFileName, "%s.mpg", CFrame->ComponentFilePrefix[0]);
    }


    if (XING)
    {
        CImage->PartialFrame=1;
        Prate = 9;
        ConstrainedParameterFlag=1;
        MBperSlice= -1;      /* Ensure automatic setting of MBperslice */
        FrameInterval=1;     /* in following encoder... */
        FrameGroup=1;
    }

    if (Oracle)
    {
        initparser();
        parser();
    }
    if (!(GetFlag(CImage->MpegMode,M_DECODER))) /* se non ha -d, cioè encoder, allora entra */
    {
        if ((!HorizontalSize) || (!VerticalSize)) /* Unspecified hor, ver */
            SetCCITT();

        CreateFrameSizes();

        if (BaseFrame>LastFrame)
	    {
            WHEREAMI();
            printf("Need positive number of frames.\n");
            exit(ERROR_BOUNDS);
	    }
        framesNumber = LastFrame-BaseFrame;

        // inizializzazione parametri di configurazione per il watermarking
        if (watermarkType>0) initInsWatermarkConfig();

        // inizializzo lo scrambling
        if (scrambling>0 && PType == P_INTRA) initScrambling();

        // Prende i file y,u e v e ricostruisce l'mpeg
        MpegEncodeSequence();

        // "pulisco" le risorse di scrambling
        if (scrambling>0 && PType == P_INTRA) closeScrambling();

        // operazioni da eseguire alla fine della esecuzione
        if (watermarkType != 0) finalInsWatermark();

    }
    else
    {
        // inizializzazione parametri di configurazione per il watermarking
        if (watermarkType>0) initExtWatermarkConfig();

        // inizializzo l'unscrabling
        if (scrambling>0 && PType == P_INTRA) initDeScrambling();

        MpegDecodeSequence();

        // "pulisco" le risorse dell'unscrambling
        if (scrambling>0 && PType == P_INTRA) closeDeScrambling();

        // operazioni da eseguire alla fine della esecuzione
        if (watermarkType != 0) finalExtWatermark();
    }

    // gettimeofday(&_stop, NULL);
    clock_gettime(CLOCK_REALTIME, &_stop);
    const int NS_IN_S = 1E9;
    float secs = (_stop.tv_sec - _start.tv_sec) +  (float) (_stop.tv_nsec - _start.tv_nsec) / NS_IN_S; // TODO check returned value

    printf("Tempo impiegato: %.3f s\n", secs);

    exit(ErrorValue);
}

/*BFUNC

 MpegEncodeSequence() encodes the sequence defined by the CImage and
 CFrame structures, startframe and lastframe.

 EFUNC*/
void MpegEncodeSequence()
{
    BEGIN("MpegEncodeSequence");
    int i;

    if (DCIntraFlag)     /* DC Intraframes are handled by a faster engine */
    {
        MpegEncodeDSequence();
        return;
    }
    MakeFGroup();        /* Make our group structure */
    MakeStat();          /* Make the statistics structure */
    MakeFS(READ_IOB);    /* Make our frame stores */
    CFSUse=CFStore;
    MakeFS(WRITE_IOB);
    CFSBase=CFStore;
    MakeFS(WRITE_IOB);
    CFSNext=CFStore;
    MakeFS(WRITE_IOB);
    CFSMid=CFStore;

    swopen(CImage->StreamFileName);  // Open file .mpg in cui salvare


    if (Loud > MUTE)
    {
        PrintImage();
        PrintFrame();
    }
    if (FileSizeBits)  // Rate is determined by bits/second.
        Rate=(FileSizeBits*FrameRate())/(FrameSkip*(LastFrame-StartFrame+1));
    if (Rate)
    {
        if (Rate/4 > BufferSize)  BufferSize = Rate/4;
        QDFact = (Rate/230);
        QOffs = 1;
        if (!InitialQuant)
	    {
            InitialQuant = 10000000/Rate;
            if (InitialQuant>31)
                InitialQuant=31;
            else if (InitialQuant<2)
                InitialQuant=2;

            printf("Rate: %d  Buffersize: %d  QDFact: %d  QOffs: %d\n",Rate,BufferSize,QDFact,QOffs);
            printf("Starting Quantization: %d\n",InitialQuant);
	    }
    }
    else if (!InitialQuant)
        InitialQuant=DEFAULT_QUANTIZATION;
    UseQuant=SQuant=MQuant=InitialQuant;
    BufferOffset=0;
    TotalBits=0;
    NumberOvfl=0;
    printf("START>SEQUENCE\n");

    HorizontalSize = CImage->Width;
    VerticalSize = CImage->Height;
    printf("Dimensione frame: %d %d\n", HorizontalSize, VerticalSize);

    WriteVSHeader();    // Write out the header file
    GroupFirstFrame=CurrentFrame=BaseFrame;
    TimeCode = Integer2TimeCode(GroupFirstFrame);
    if (XING) ClosedGOP=0;
    else ClosedGOP=1;        // Closed GOP is 1 at start of encoding.
    WriteGOPHeader();   // Set up first frame
    ClosedGOP=0;        // Reset closed GOP
    PType=P_INTRA;
    MakeFileNames();
    VerifyFiles();
    CFStore=CFSUse; SwapFS(CFSBase,CFSNext); CFSNew=CFSNext;
    ReadFS();
    TemporalReference = 0;
    MpegEncodeIPBDFrame();
    //Solo per intraframe scramblati
    if(scrambling>0 && PType==P_INTRA) WriteFS();


    for (FrameIntervalCount=0; BaseFrame<LastFrame; FrameIntervalCount++)
    {
        if (BaseFrame+FrameInterval > LastFrame)
            FrameInterval = LastFrame-BaseFrame;
        LoadFGroup(BaseFrame);                  // We do motion compensation
        InterpolativeBME();                     
        CurrentFrame=BaseFrame+FrameInterval;   // Load in next base
        if (!((FrameIntervalCount+1)%FrameGroup))
	    {                              // Load an Intra Frame
            GroupFirstFrame=BaseFrame+1;  // Base of group
            TemporalReference = (CurrentFrame-GroupFirstFrame)%TEMPORAL_MODULO;
            TimeCode = Integer2TimeCode(GroupFirstFrame);
            if (!XING)
                WriteGOPHeader();        // Write off a group of pictures
            PType=P_INTRA;
            MakeFileNames();
            VerifyFiles();
            CFStore=CFSUse; SwapFS(CFSBase,CFSNext); CFSNew=CFSNext;
            ReadFS();
            MpegEncodeIPBDFrame();
            //Solo per intraframe scramblati
            if(scrambling>0 && PType==P_INTRA) WriteFS();
	    }
        else
	    {	                // Load Next Predicted Frame
            TemporalReference = (CurrentFrame-GroupFirstFrame)%TEMPORAL_MODULO;
            FrameDistance = FrameInterval;
            PType=P_PREDICTED;
            MakeFileNames();
            VerifyFiles();
            CFStore=CFSUse; SwapFS(CFSBase,CFSNext); CFSNew=CFSNext;
            ReadFS();
            MpegEncodeIPBDFrame();
            //Solo per intraframe scramblati
            if(scrambling>0 && PType==P_INTRA) WriteFS();
	    }
        for (i=1; i<FrameInterval; i++)      // Load Interpolated Frames
	    {
            CurrentFrame=BaseFrame+i;
            FrameDistance = i;
            TemporalReference = (CurrentFrame-GroupFirstFrame)%TEMPORAL_MODULO;
            PType=P_INTERPOLATED;
            MakeFileNames();
            VerifyFiles();
            CFStore=CFSUse; CFSNew=CFSMid;
            ReadFS();
            MpegEncodeIPBDFrame();
            //Solo per intraframe scramblati
            if(scrambling>0 && PType==P_INTRA) WriteFS();

	    }
        BaseFrame+=FrameInterval;         // Shift base frame to next interval

    }
    WriteVEHeader();              // Write out the end header...
    swclose();

    /*
     SaveMem("XX",CFS->fs[0]->mem);
     SaveMem("YY",OFS->fs[0]->mem);
     */
    printf("END>SEQUENCE\n");
    printf("Number of buffer overflows: %d\n",NumberOvfl);
}

/*BFUNC

 MpegEncodeDSequence() encodes the DC intraframe sequence defined by
 the CImage and CFrame structures, startframe and lastframe.

 EFUNC*/
static void MpegEncodeDSequence()
{
    BEGIN("MpegEncodeDSequence");

    MakeFGroup();        /* Make our group structure */
    MakeStat();          /* Make the statistics structure */
    MakeFS(READ_IOB);    /* Make our frame stores */
    CFSUse=CFStore;
    MakeFS(WRITE_IOB);
    CFSNext=CFStore;

    swopen(CImage->StreamFileName);  /* Open file */
    if (Loud > MUTE)
    {
        PrintImage();
        PrintFrame();
    }
    if (!InitialQuant)                      /* Actually useless */
        InitialQuant=DEFAULT_QUANTIZATION;
    UseQuant=SQuant=MQuant=InitialQuant;
    BufferOffset=0;
    TotalBits=0;
    NumberOvfl=0;
    printf("START>SEQUENCE\n");
    HorizontalSize = CImage->Width;  /* Set up dimensions */
    VerticalSize = CImage->Height;
    TimeCode = Integer2TimeCode(StartFrame);
    WriteVSHeader();    /* Write out the header file */
    ClosedGOP=1;        /* Closed GOP is 1 at start of encoding. */
    WriteGOPHeader();   /* Set up first frame */
    ClosedGOP=0;        /* Reset closed GOP */
    TemporalReference = 0;
    PType=P_DCINTRA;

    for (CurrentFrame=StartFrame; CurrentFrame<=LastFrame; CurrentFrame++)
    {

        MakeFileNames();
        VerifyFiles();
        CFStore=CFSUse; CFSNew=CFSNext;
        ReadFS();
        MpegEncodeIPBDFrame();
        TemporalReference++;

    }
    WriteVEHeader();              /* Write out the end header... */
    swclose();
    /*
     SaveMem("XX",CFS->fs[0]->mem);
     SaveMem("YY",OFS->fs[0]->mem);
     */
    printf("END>SEQUENCE\n");
    printf("Number of buffer overflows: %d\n",NumberOvfl);
}

/*BFUNC

 ExecuteQuantization() references the program in memory to define the
 quantization required for coding the next block.

 EFUNC*/
void ExecuteQuantization(Qptr)
int *Qptr;
{
    BEGIN("ExecuteQuantization");
    int CurrentSize;

    CurrentSize = BufferContents();
    *Qptr = (CurrentSize/QDFact) + QOffs;
    if ((PType==P_INTRA)||(PType==P_PREDICTED))
        *Qptr = *Qptr/2;
    if (*Qptr<1) *Qptr=1;
    if (*Qptr>31) *Qptr=31;
    if (Oracle)  /* If oracle, then consult oracle */
    {
        Memory[L_SQUANT] = (double) SQuant;
        Memory[L_MQUANT] = (double) MQuant;
        Memory[L_PTYPE] = (double) PType;
        Memory[L_MTYPE] = (double) MType;
        Memory[L_RATE] = (double) Rate;
        Memory[L_BUFFERSIZE] = (double) BufferSize;
        Memory[L_BUFFERCONTENTS] = (double) CurrentSize;
        Memory[L_QDFACT] = (double) QDFact;
        Memory[L_QOFFS] = (double) QOffs;
        Execute(1);
        SQuant = (int)  Memory[L_SQUANT];  /* Possibly check Mquant */
        if (SQuant<1) SQuant=1;
        if (SQuant>31) SQuant=31;
    }
    printf("BufferContents: %d  New SQuant: %d\n",CurrentSize,*Qptr);
}

/*BFUNC

 CleanStatistics() cleans/initializes the type statistics in memory.

 EFUNC*/
static void CleanStatistics()
{
    BEGIN("CleanStatistics");
    int x;
    for (x=0; x<MaxTypes; x++)
    {
        MacroTypeFrequency[x]=0; /* Initialize Statistics */
        YTypeFrequency[x]=0;
        UVTypeFrequency[x]=0;
    }
    MotionVectorBits=MacroAttributeBits=0;
    YCoefBits=UCoefBits=VCoefBits=EOBBits=0;
    QUse=QSum=0;
    NumberNZ=0;
    StuffCount=0;
}

/*BFUNC

 CollectStatistics() is used to assemble and calculate the relevant
 encoding statistics.  It also prints these statistics out to the
 screen.

 EFUNC*/
void CollectStatistics()
{

    BEGIN("CollectStatistics");
    int x;

    x = mwtell();                    // Calculate the size in bits
    LastBits = x - TotalBits;
    TotalBits = x;
    printf("Total No of Bits: %8d  Bits for Frame: %8d\n",
            TotalBits,LastBits);
    if (Rate)
    {
        printf("Buffer Contents: %8d  out of: %8d\n",
                BufferContents(),
                BufferSize);
    }
    printf("MB Attribute Bits: %6d  MV Bits: %6d   EOB Bits: %6d\n",
            MacroAttributeBits,MotionVectorBits,EOBBits);
    printf("Y Bits: %7d  U Bits: %7d  V Bits: %7d  Total Bits: %7d\n",
            YCoefBits,UCoefBits,VCoefBits,(YCoefBits+UCoefBits+VCoefBits));
    printf("MV StepSize: %f  MV NumberNonZero: %f  MV NumberZero: %f\n",
            (double) ((double) QSum)/((double)(QUse)),
            (double) ((double) NumberNZ)/
            ((double)(MBHeight*MBWidth*6)),
            (double) ((double) (MBHeight*MBWidth*6*64)- NumberNZ)/
            ((double)(MBHeight*MBWidth*6)));
    printf("Code MType: ");
    for (x=0; x<MaxTypes; x++) printf("%5d",x);
    printf("\n");
    printf("Macro Freq: ");
    for (x=0; x<MaxTypes; x++) printf("%5d",MacroTypeFrequency[x]);
    printf("\n");
    printf("Y     Freq: ");
    for (x=0; x<MaxTypes; x++) printf("%5d",YTypeFrequency[x]);
    printf("\n");
    printf("UV    Freq: ");
    for (x=0; x<MaxTypes; x++) printf("%5d",UVTypeFrequency[x]);
    printf("\n");

}


/*BFUNC

 MVBoundIndex() calculates the index for the motion vectors given two motion
 vector arrays, MVX, and MVY.  The return value is appropriate for
 ForwardIndex of BackwardIndex

 EFUNC*/
static int MVBoundIndex(MVX,MVY)
int *MVX;
int *MVY;
{
    BEGIN("MVBoundIndex");
    int i, mvpos=0, mvneg=0, mvtest, best;

    for (i=0; i<MBWidth*MBHeight; i++)
    {
        mvtest = *(MVX++);
        if (mvtest>mvpos) mvpos = mvtest;
        else if (mvtest<mvneg) mvneg = mvtest;
        mvtest = *(MVY++);
        if (mvtest>mvpos) mvpos = mvtest;
        else if (mvtest<mvneg) mvneg = mvtest;
    }

    best = (mvpos>>4);  /* Get positive bound, some (1<<4)*(1<<FI)-1 */
    mvneg = -mvneg;                      /* Get similar neg bound, */
    if (mvneg>0) mvneg = (mvneg-1)>>4;   /* some -(1<<4)*(1<<FI) */
    else mvneg = 0;

    if (mvneg > best) best = mvneg;

    /* Now we need to find the log of this value between 0 and n */

    if (best >= (1<<5))
    {
        WHEREAMI();
        printf("Warning: at least one motion vector out of range.\n");
    }
    for (i=4; i>=0; i--)
        if (best&(1<<i)) break;
    return(i+2);
}

int length;

/*BFUNC

 MpegEncodeIPBDFrame(Intra,Predicted,)
 ) is used to encode a single Intra; is used to encode a single Intra, Predicted,
 Bidirectionally predicted, DC Intra frame to the opened stream.

 EFUNC*/
void MpegEncodeIPBDFrame()
{
    BEGIN("MpegEncodeIPBDFrame");
    int i,length;

    // ai fini del testing
    struct timespec _start, _stop;
    // gettimeofday(&_start, NULL);
    clock_gettime(CLOCK_REALTIME, &_start);

    if (Rate)                               /* Assume no decoder delay */
        BufferFullness = (90000*((BufferSize - BufferContents())/400))/(Rate/400);

    switch (PType)
    {
        case P_INTRA:
            printf("START>Intraframe: %d\n",CurrentFrame);
            MaxTypes=2;
            SQuant=InitialQuant/2;  /* Preliminary rate control */
            break;
        case P_PREDICTED:
            printf("START>Predicted: %d\n",CurrentFrame);
            MaxTypes=7;
            SQuant=InitialQuant/2;
            break;
        case P_INTERPOLATED:
            printf("START>Interpolated: %d\n",CurrentFrame);
            MaxTypes=11;
            SQuant=InitialQuant;
            break;
        case P_DCINTRA:
            printf("START>DC Intraframe: %d\n",CurrentFrame);
            MpegEncodeDFrame();
            return;
            break;
        default:
            printf("Unknown PType: %d\n",PType);
            break;
    }
    CleanStatistics();

    ForwardIndex=BackwardIndex=0;
    if (DynamicMVBound)
    {
        /* Calculate a larger motion vector */

        if ((PType==P_PREDICTED)||(PType==P_INTERPOLATED))
            ForwardIndex = MVBoundIndex(FMX[FrameDistance],FMY[FrameDistance]);
        if ((PType==P_INTERPOLATED))
            BackwardIndex = MVBoundIndex(BMX[FrameDistance],BMY[FrameDistance]);
    } else {
        /* The following equations rely on a maximum bound from -16->15*fd */
        /* for telescopic motion estimation; if a larger motion vector */
        /* is desired, it must be calculated as below. */

        if ((PType==P_PREDICTED) || (PType==P_INTERPOLATED))
        {
            ForwardIndex=FrameDistance-1;
            if (ForwardIndex >= (1<<5))
	        {
                WHEREAMI();
                printf("Warning: possible motion vectors out of range.\n");
	        }
            for (i=4; i>=0; i--)
                if (ForwardIndex&(1<<i)) break;
            ForwardIndex = i+2;
	    }


        if ((PType==P_INTERPOLATED))
        {
            BackwardIndex = FrameInterval-FrameDistance-1;
            if (BackwardIndex >= (1<<5))
            {
                WHEREAMI();
                printf("Warning: possible motion vectors out of range.\n");
	        }
            for (i=4; i>=0; i--)
                if (BackwardIndex&(1<<i)) break;
            BackwardIndex = i+2;
	    }
    }

    if ((ForwardIndex>6)||(BackwardIndex>6))
    {
        WHEREAMI();
        printf("Warning: possible motion vectors out of range.\n");
    }

    /*printf("ForwardIndex: %d;  BackwardIndex: %d\n",
     ForwardIndex, BackwardIndex);*/

    WritePictureHeader();

    int a = 0;

    /***********************************************************/
    // SE PASSATO IL PARAMETRO -scram APPLICA LO SCRAMBLING
    if (scrambling>0 && PType == P_INTRA)
    {
        initPseudo4Frame();
        startScrambling();
    }/***********************************************************/

    // BEGIN CODING
    if (!MBperSlice) MBperSlice=MBWidth;  // Set macroblocks per slice
    HPos=VPos=0;
    CurrentMBS=0;
    LastMBA= -1;
    CurrentMBA=0;
    a = 0;
    cP = 0;
    cx = 0;
    cy = 0;
    modX = 0;
    modY = 0;

    while (VPos<MBHeight)
    {
        CurrentMBS++;
        length = MBWidth*MBHeight - (HPos + (VPos*MBWidth));
        if ((MBperSlice<0) || (length<MBperSlice)) MBperSlice=length;
        MpegEncodeSlice(MBperSlice);
    }

    HPos=VPos=0;
    if (Rate) BufferOffset -= (Rate*FrameSkip/FrameRate());
    CollectStatistics();
    Statistics(CFSUse,CFSNew);

    // gettimeofday(&_stop, NULL);
    clock_gettime(CLOCK_REALTIME, &_stop);
    const int NS_IN_S = 1E9;
    float secs = (_stop.tv_sec - _start.tv_sec) + (float) (_stop.tv_nsec - _start.tv_nsec) / NS_IN_S; // TODO check returned value

    printf("Tempo impiegato per il frame %d: %.3f s\n", CurrentFrame, secs);

}


static void MpegEncodeSlice(Count)
    int Count;
{
    BEGIN("MpegEncodeSlice");
    int i,x;

    LastMVD1V=LastMVD1H=LastMVD2V=LastMVD2H=0; /* Reset MC */
    if (Loud > MUTE) printf("VPos: %d \n",VPos);
    if ((Rate)&&(CurrentFrame!=StartFrame)) /* Change Quantization */
        ExecuteQuantization(&SQuant);      /* only after buffer filled */
    UseQuant=SQuant;                        /* Reset quantization to slice */
    SVP = VPos+1;
    /* printf("Write slice\n"); */
    WriteMBSHeader();

    for (x=0; x<3; x++) LastDC[x]=128;   /* Reset DC pred., irrsp. LastMType */

    /* LastMBA = (VPos*MBWidth)+HPos-1; */

    EncEndSlice=EncStartSlice=0;
    for (i=0; i<Count; i++)
    {

        if (!i) EncStartSlice=1;        /* Special flags */
        if ((i==Count-1) && EncPerfectSlice) EncEndSlice=1;

        if (VPos >= MBHeight)
	    {
            WHEREAMI();
            printf("Slice-MDU Overflow.\n");
	    }
        if (Rate)        /* Perform preliminary rate control */
	    {
            if ((HPos)&&!(HPos%QUpdateFrequency)&&
                    (CurrentFrame!=StartFrame))
	        { /* Begin incremental buffer control */
                /* Disabled for macroblock quant - trickier... */
                /* ExecuteQuantization(&MQuant); */
                /* if (Oracle) MQuant = (int)  Memory[L_MQUANT]; */
	        }
            if ((BufferContents()>BufferSize))
	        {
                MVD1H=MVD1V=0; /* Motion vectors 0 */
                MType=0;     /* No coefficient transmission */
                NumberOvfl++;
                WHEREAMI();
                printf("Buffer Overflow!\n");
	        }
	    }
        //printf("Hpos:%d  Vpos:%d\n",HPos,VPos);

        MpegEncodeMDU();

        HPos++;
        if (HPos >= MBWidth)
	    {
            HPos=0; VPos++;
	    }
    }
}


/* QUESTO METODO VIENE INVOCATO 330 VOLTE ????? */
/*BFUNC

 MpegEncodeMDU() encodes the current MDU.  It finds the macroblock
 type, attempts to compress the macroblock type, and then writes the
 macroblock type out. The decoded MDU is then saved for predictive
 encoding.

 EFUNC*/
static void MpegEncodeMDU()
{
    BEGIN("MpegEncodeMDU");


    MpegFindMType();

    MpegCompressMType();

    MpegWriteMType();
    //MpegDecodeSaveMDU();

    QUse++;                // Accumulate statistics
    QSum+=UseQuant;
    CurrentMBA++;
    if (MType < MaxTypes)
        MacroTypeFrequency[MType]++;
    else
    {
        WHEREAMI();
        printf("Illegal picture type: %d macroblock type: %d.\n",PType,MType);
    }
    LastMType=MType;

}



/*BFUNC

 MpegFindMType() makes an initial decision as to the macroblock type
 used for MPEG encoding.

 EFUNC*/
void MpegFindMType()
{
    BEGIN("MpegFindMType");
    int c,j,h,v,x;
    int *input;
    int *inter;
    int *fmc,*bmc,*imc;
    double xValue,fyValue,byValue,iyValue,xVAR,fyVAR,byVAR,iyVAR,orM,orVAR;


    switch(PType)
    {
        case P_INTRA:
            MType=0;
            for (c=0; c<6; c++)
            {
                input = &inputbuf[c][0];
                j = BlockJ[c];
                v = BlockV[c];
                h = BlockH[c];

                InstallFSIob(CFSUse,j);
                MoveTo(HPos,VPos,h,v);
                ReadBlock(input);
            }
            break;
        case P_PREDICTED:
            /* Calculate decisions */
            MVD1H = FMX[FrameDistance][VPos*MBWidth + HPos];
            MVD1V = FMY[FrameDistance][VPos*MBWidth + HPos];
            /* printf("FMX: %d  FMY: %d\n",MVD1H,MVD1V); */
            xValue=fyValue=xVAR=fyVAR=orM=orVAR=0.0;
            for (c=0; c<6; c++)
            {
                input = &inputbuf[c][0];
                inter = &interbuf[c][0];
                fmc = &fmcbuf[c][0];
                j = BlockJ[c];
                v = BlockV[c];
                h = BlockH[c];
                InstallFSIob(CFSUse,j);
                MoveTo(HPos,VPos,h,v);
                ReadBlock(input);
                for (x=0; x<64; x++)
                    fmc[x] = inter[x] = input[x];
                InstallFSIob(CFSBase,j);
                MoveTo(HPos,VPos,h,v);
                MX = MY = 0;                        /* Calc interframe */
                SubCompensate(inter,CFSBase->Iob[j]);
                if (c < 4)                         /* Calc motion comp */
                {
                    MX = MVD1H;
                    MY = MVD1V;
                }
                else
                {
                    MX = MVD1H/2;
                    MY = MVD1V/2;
                }
                SubCompensate(fmc,CFSBase->Iob[j]);
                if (c < 4)                  /* Base solely on luminance */
                {
                    for (x=0; x<64; x++)
                    {
                        orM = orM + input[x];      /* Original frame */
                        orVAR = orVAR + input[x]*input[x];

                        if (inter[x]>0)                   /* Interframe */
                            xValue = xValue + inter[x];
                        else
                            xValue = xValue - inter[x];
                        xVAR = xVAR + inter[x]*inter[x];

                        if (fmc[x]>0)                      /* Motion comp */
                            fyValue = fyValue + fmc[x];
                        else
                            fyValue = fyValue - fmc[x];
                        fyVAR = fyVAR + fmc[x]*fmc[x];
                    }
                }
            }
            xValue = xValue/256.0;
            fyValue = fyValue/256.0;
            xVAR = xVAR/256.0;
            fyVAR = fyVAR/256.0;
            orM = orM/256.0;
            orVAR = orVAR/256.0;
            orVAR = orVAR - (orM*orM);
            /*
             printf("interABS: %f   mcABS: %f\n",
             xValue,fyValue);
             printf("interVAR: %f   mcVAR: %f   orVAR: %f\n",
             xVAR,fyVAR,orVAR);
             */
            /* Decide which coding option to take (P*64) */
            if (((xValue < 3.0) && (fyValue > (xValue*0.5))) ||
                    ((fyValue > (xValue/1.1))))
            {
                MType = 1;                    /* Inter mode */
                if ((xVAR >64) && (xVAR > orVAR))
                    MType = 3;                  /* If err too high, intra */
            }
            else
            {
                MType = 0;                    /* MC Mode */
                if ((fyVAR > 64) && (fyVAR > orVAR))
                    MType = 3;                 /* If err too high, intra */
            }
            break;
        case P_INTERPOLATED:
            /* Calculate decisions */
            MVD1H = FMX[FrameDistance][VPos*MBWidth + HPos];
            MVD1V = FMY[FrameDistance][VPos*MBWidth + HPos];
            MVD2H = BMX[FrameDistance][VPos*MBWidth + HPos];
            MVD2V = BMY[FrameDistance][VPos*MBWidth + HPos];
            xValue=fyValue=byValue=iyValue=0.0;
            xVAR=fyVAR=byVAR=iyVAR=orM=orVAR=0.0;
            for (c=0; c<6; c++)
            {
                input = &inputbuf[c][0];
                inter = &interbuf[c][0];
                fmc = &fmcbuf[c][0];
                bmc = &bmcbuf[c][0];
                imc = &imcbuf[c][0];
                j = BlockJ[c];
                v = BlockV[c];
                h = BlockH[c];
                InstallFSIob(CFSUse,j);
                MoveTo(HPos,VPos,h,v);
                ReadBlock(input);
                for (x=0; x<64; x++)
                    imc[x]=bmc[x]=fmc[x]=inter[x]=input[x];
                InstallFSIob(CFSBase,j);
                MoveTo(HPos,VPos,h,v);
                InstallFSIob(CFSNext,j);
                MoveTo(HPos,VPos,h,v);
                MX = MY = 0;
                SubCompensate(inter,CFSBase->Iob[j]);
                if (c < 4)
                {
                    NX = MVD2H;  NY = MVD2V;
                    MX = MVD1H;  MY = MVD1V;
                }
                else
                {
                    NX = MVD2H/2;  NY = MVD2V/2;
                    MX = MVD1H/2;  MY = MVD1V/2;
                }
                SuperSubCompensate(fmc,bmc,imc,
                        CFSBase->Iob[j],CFSNext->Iob[j]);
                if (c < 4)
                {
                    for (x=0; x<64; x++)
                    {
                        orM = orM + input[x];
                        orVAR = orVAR + input[x]*input[x];
                        if (inter[x]>0)
                            xValue = xValue + inter[x];
                        else
                            xValue = xValue - inter[x];
                        xVAR = xVAR + inter[x]*inter[x];
                        if (fmc[x]>0)
                            fyValue = fyValue + fmc[x];
                        else
                            fyValue = fyValue - fmc[x];
                        fyVAR = fyVAR + fmc[x]*fmc[x];
                        if (bmc[x]>0)
                            byValue = byValue + bmc[x];
                        else
                            byValue = byValue - bmc[x];
                        byVAR = byVAR + bmc[x]*bmc[x];
                        if (imc[x]>0)
                            iyValue = iyValue + imc[x];
                        else
                            iyValue = iyValue - imc[x];
                        iyVAR = iyVAR + imc[x]*imc[x];
                    }
                }
            }
            xValue = xValue/256.0;
            fyValue = fyValue/256.0;
            byValue = byValue/256.0;
            iyValue = iyValue/256.0;
            xVAR = xVAR/256.0;
            fyVAR = fyVAR/256.0;
            byVAR = byVAR/256.0;
            iyVAR = iyVAR/256.0;
            orM = orM/256.0;
            orVAR = orVAR/256.0;
            orVAR = orVAR - (orM*orM);
            /*
             printf("interVAR:%f  orVAR:%f\n",
             xVAR,orVAR);
             printf("fmcVAR:%f  bmcVAR:%f  imcVAR:%f\n",
             fyVAR,byVAR,iyVAR);
             */
            if (iyVAR<=fyVAR)
            {
                if (iyVAR<=byVAR)
                {
                    if ((iyVAR > 64) && (iyVAR > orVAR))
                    {
                        MType = 6;
                    }
                    else
                    {
                        MType=1;
                    }
                }
                else
                {
                    if ((byVAR > 64) && (byVAR > orVAR))
                    {
                        MType = 6;
                    }
                    else
                    {
                        MType=3;
                    }
                }
            }
            else if (byVAR <= fyVAR)
            {
                if ((byVAR > 64) && (byVAR > orVAR))
                {
                    MType = 6;
                }
                else
                {
                    MType=3;
                }
            }
            else
            {
                if ((fyVAR > 64) && (fyVAR > orVAR))
                {
                    MType = 6;
                }
                else
                {
                    MType=5;
                }
            }
            /* printf("[%d,%d:%d]",HPos,VPos,MType);*/
            break;
        default:
            WHEREAMI();
            printf("Unknown type: %d\n",PType);
            break;
    }
    if (Oracle)
    {
        Memory[L_SQUANT] = (double) SQuant;
        Memory[L_MQUANT] = (double) MQuant;
        Memory[L_PTYPE] = (double) PType;
        Memory[L_MTYPE] = (double) MType;
        Memory[L_BD] = (double) xValue;
        Memory[L_FDBD] = (double) fyValue;
        Memory[L_BDBD] = (double) byValue;
        Memory[L_IDBD] = (double) iyValue;
        Memory[L_VAROR] = (double) orVAR;
        Memory[L_FVAR] = (double) fyVAR;
        Memory[L_BVAR] = (double) byVAR;
        Memory[L_IVAR] = (double) iyVAR;
        Memory[L_DVAR] = (double) xVAR;
        Memory[L_RATE] = (double) Rate;
        Memory[L_BUFFERSIZE] = (double) BufferSize;
        Memory[L_BUFFERCONTENTS] = (double) BufferContents();
        Memory[L_QDFACT] = (double) QDFact;
        Memory[L_QOFFS] = (double) QOffs;
        Execute(0);
        MType = (int) Memory[L_MTYPE];
    }
}


/*BFUNC

 MpegWriteMType() writes a macroblock type out to the stream.  It
 handles the predictive nature of motion vectors, etc.

 EFUNC*/
static void MpegWriteMType()
{
    BEGIN("MpegWriteMType");
    int c,j,x;
    int *input;


    /* We only erase motion vectors when required */
    if (PType==P_PREDICTED)
    {
        if (!MFPMType[PType][MType])
            LastMVD1V=LastMVD1H=MVD1V=MVD1H=0;  /* Erase forward mv */
    }
    else if (PType==P_INTERPOLATED)
    {
        if (IPMType[PType][MType])
	    {
            LastMVD1V=LastMVD1H=MVD1V=MVD1H=0;  /* Erase forward mv */
            LastMVD2V=LastMVD2H=MVD2V=MVD2H=0;  /* Erase backward mv */
	    }
    }
    while (BufferContents()< 0)
    {
        WriteStuff();
        StuffCount++;
        WHEREAMI();
        printf("Stuffing for underflow.\n");
    }
    if (!SkipMode)
    {
        if (IPMType[PType][MType]) CBP=0x3f;
        else if (!CBPPMType[PType][MType]) CBP=0;

        if (EncStartSlice)
	    {
            MBAIncrement= HPos+1;
            EncStartSlice=0;
	    }
        else
            MBAIncrement = (CurrentMBA-LastMBA);
        LastMBA = CurrentMBA;

        /* printf("[MBAInc: %d; Sigma= %d]\n",MBAIncrement,CurrentMBA); */
        WriteMBHeader();
        if (IPMType[PType][MType])
	    {
            if (!(IPMType[PType][LastMType]))
                for (x=0; x<3; x++) LastDC[x]=128;  /* Reset DC prediction */
	    }
        for (c=0; c<6; c++)
	    {
            j = BlockJ[c];
            input = &outputbuf[c][0];
            if (CBP & bit_set_mask[5-c])
	        {
                if (j)
                {
                    UVTypeFrequency[MType]++;
                }
                else
                {
                    YTypeFrequency[MType]++;
                }
                CodedBlockBits=0;
                if (CBPPMType[PType][MType])
                    CBPEncodeAC(0,input);
                else
		        {
                    if (j)
                        EncodeDC(*input-LastDC[j],DCChromEHuff);
                    else
                        EncodeDC(*input-LastDC[j],DCLumEHuff);
                    LastDC[j] = *input;
                    EncodeAC(1,input);
		        }
                if (Loud > TALK)
		        {
                    printf("CMBS: %d  CMDU %d\n",
                            VPos,HPos);
                    PrintMatrix(input);
		        }
                if(!j){YCoefBits+=CodedBlockBits;}
                else if(j==1){UCoefBits+=CodedBlockBits;}
                else{VCoefBits+=CodedBlockBits;}
	        }
	    }
    }
    else
    {
        CBP=0;  /* Bypass any decoding */
        /* Added 8/18/93 */
        for (x=0; x<3; x++) LastDC[x]=128;  /* Reset DC prediction */
    }

}


/*BFUNC

 MpegCompressMType() makes sure that the macroblock type is legal.  It
 also handles skipping, zero CBP, and other MPEG-related macroblock
 stuff.

 EFUNC*/
static void MpegCompressMType()
{
    int c,x;
    int *input;

    /* Set quant */

    if (QuantPMType[PType][MType])
    {
        UseQuant=MQuant;
        SQuant=MQuant;       /* Resets it for quantizations forward */
    }
    else {UseQuant=SQuant;}

    SkipMode=0;
    CBP = 0x00;
    
    for (c=0; c<6; c++)
    {

        if ((MFPMType[PType][MType])&&(MBPMType[PType][MType])) {
            input = &imcbuf[c][0];
            //printf("imcBUF|");
        } else if (MBPMType[PType][MType]) {
            input = &bmcbuf[c][0];
            //printf("bmcBUF|");
        } else if (MFPMType[PType][MType]) {
            input = &fmcbuf[c][0];
            //printf("fmcBUF|");
        } else if (!IPMType[PType][MType]) {
            input = &interbuf[c][0];
            //printf("interCBUF|");
        } else {
            input = &inputbuf[c][0];
            //printf("inputBUF|");
        }

        // l'algoritmo per il watermarking è settato AND l'opzione -d non è settata (encoder) AND è settato il livello di debug
        if (watermarkType>0 && !GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
            if (debugWatermark >= 2) {
                printf("\nMpegCompressMType() -> ********* BLOCCO %d *******************************\n", countIPMType);
                printf("DOMINIO DI FREQUENZA\n");
                PrintMatrix(input);
            }
        }

        DefaultDct(input,output);

        // l'algoritmo per il watermarking è settato AND l'opzione -d non è settata (encoder) AND è settato il livello di debug
        if (watermarkType>0 && !GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
            if (debugWatermark >= 2) {
                printf("APPLICAZIONE DELLA DCT\n");
                PrintMatrix(output);
            }
        }

        if (IPMType[PType][MType]) {
            MPEGIntraQuantize(output,MPEGIntraQ,UseQuant);

            // l'algoritmo per il watermarking è settato AND l'opzione -d non è settata (encoder) AND è settato il livello di debug
            if (watermarkType>0 && !GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
                if (debugWatermark >= 2) {
                    printf("APPLICAZIONE DELLA QUANTIZZAZIONE (MPEGIntraQuantize)\n");
                    PrintMatrix(output);
                }
            }

            if (!GetFlag(CImage->MpegMode,M_DECODER)) { // l'opzione -d non è settata (encoder)
                if (watermarkType > 0){ // l'algoritmo per il watermarking è settato
                    if (watermarkType == LSB) {
                        insertWatermark_lsb(output, countIPMType);
                    } else if (watermarkType == COX) {
                        insertWatermark_cox(output, countIPMType);
                    }
                }
                countIPMType++;
            }

            if (watermarkType>0 && !GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
                if (debugWatermark >= 2) {
                    printf("APPLICAZIONE WATERMARK\n");
                    PrintMatrix(output);
                }
            }

        } else {
            MPEGNonIntraQuantize(output,MPEGNonIntraQ,UseQuant);

            // l'algoritmo per il watermarking è settato AND l'opzione -d non è settata (encoder) AND è settato il livello di debug
            if (watermarkType>0 && !GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
                if (debugWatermark >= 2) {
                    printf("APPLICAZIONE DELLA QUANTIZZAZIONE (MPEGNonIntraQuantize)\n");
                    PrintMatrix(output);
                }
            }

        }

        BoundQuantizeMatrix(output);

        // Applico lo scrambling dopo la quantizzazione per evitare perdita di informazioni sui volti oscurati
        if (!GetFlag(CImage->MpegMode,M_DECODER)) { // l'opzione -d non è settata (encoder)
            if (scrambling>0 && PType == P_INTRA) 
            {   // se è stato passato il parametro -scramb
                if (c < 2) ChangePixelMatrixY(output,1); // Modifico le frequenze delle righe pari del canale di luminanza Y
                if (c > 1 && c < 4) ChangePixelMatrixY(output,2); // Modifico le frequenze delle righe dispari del canale di luminanza Y

                //se è stato passato il parametro robustezza -streng, applica lo scrambling anche ai blocchi di crominanza
                if (strength > 0) {
                    if (c == 4) ChangePixelMatrixU(output); // Modifico le frequenze del canale di crominanza Cr
                    if (c == 5) ChangePixelMatrixV(output); // Modifico le frequenze del canale di crominanza Cb
                }

                //Salviamo i frame scramblati utilizzando le 
                //operazioni per la decompressione
                int appout[64];

                for(int yag=0;yag<64;yag++)
                {
                    appout[yag] = output[yag];
                }
                int appint[64];

                BoundIQuantizeMatrix(appout);
                DefaultIDct(appout,appint);
                BoundIntegerMatrix(appint);
                WriteBlock(appint);
            }
        }


        input = &outputbuf[c][0];            /* Save to output buffer */

        ZigzagMatrix(output,input);
        if (CBPPMType[PType][MType])
	    {
            for (x=0; x<64; x++)              /* Check if coding */
                if (input[x])
                {
                    CBP |= bit_set_mask[5-c];
                    break;
                }
	    }

        // l'algoritmo per il watermarking è settato AND l'opzione -d non è settata (encoder) AND è settato il livello di debug
        if (watermarkType>0 && !GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
            if (debugWatermark >= 2) {
                printf("SCANNING ZIGZAG\n");
                PrintMatrix(input);
                printf("****************************************************************************\n");
            }
        }

    }
    if (PType==P_PREDICTED)
    {
        if ((CBPPMType[PType][MType]) && (!CBP))
	    {
            if ((MType==0)||(MType==4))
                MType = 2;
            else if ((MType==1)||(MType==5))
	        {
                /* printf("Skipping.\n");*/
                if ((!EncEndSlice)&&(!EncStartSlice))
                    SkipMode=1;
                else
		        {
                    MVD1V=MVD1H=0;
                    MType=2;
		        }
	        }
	    }
    }
    else if (PType==P_INTERPOLATED)
    {
        if (!CBP)
	    {
            /* printf("No cbp\n"); */
            if ((MType==1)||(MType==3)||(MType==5))
	        {
                if ((!IPMType[PType][LastMType])&&
                        (LastMType==MType))
		        {/* Skipping enabled */
                    SkipMode=1;
                    if ((MFPMType[PType][MType]) &&
                            ((LastMVD1H != MVD1H) ||
                            (LastMVD1V != MVD1V)))
                        SkipMode=0;
                    if ((MBPMType[PType][MType]) &&
                            ((LastMVD2H != MVD2H)||
                            (LastMVD2V != MVD2V)))
                        SkipMode=0;
                    if ((EncStartSlice)||(EncEndSlice)) SkipMode=0;
		        }
#ifdef FOO
#endif
                if (!SkipMode)
                    MType--;
                else
		        {
                    /*printf("Skip[%d:%d] T:%d  MV1[%d:%d] MV2[%d:%d].\n",
                     HPos,VPos,MType,MVD1H,MVD1V,MVD2H,MVD2V);*/
		        }
	        }
            else if (MType==7)
	        {
                MType=0;
            }
            else if (MType==8)
	        {
                MType=4;
            }
            else if (MType==9)
	        {
                MType=2;
            }
	    }
    }
}

/*BFUNC

 MpegEncodeDFrame() encodes just the DC Intraframe out to the currently
 open stream. It avoids full DCT calculation.

 EFUNC*/
static void MpegEncodeDFrame()
{
    BEGIN("MpegEncodeDFrame");
    int c,i,j,h,v,x;
    int input[64];
    int dcval;

    if (PType != P_DCINTRA)
    {
        WHEREAMI();
        printf("PType: %d not DCINTRA\n",PType);
        return;
    }
    MType=0;
    MaxTypes=1;
    MBAIncrement=1;
    CleanStatistics();
    WritePictureHeader();

    if (MBperSlice<=0) MBperSlice=MBWidth;  /* Set macroblocks per slice */

    /* BEGIN CODING */
    for (CurrentMBA=VPos=0;VPos<MBHeight;HPos=0,VPos++)
    {
        for(;HPos<MBWidth;HPos++)
	    {
            /* printf("VPos: %d\n",VPos);*/
            if (Loud > MUTE) printf("Vertical Position (VPos): %d \n",VPos);

            if (!(CurrentMBA%MBperSlice))
	        {
                SVP = VPos+1;
                if (!XING) WriteMBSHeader();
                for(x=0;x<3;x++) LastDC[x]=128; /* Reset DC pred. */
                MBAIncrement=HPos+1;
                WriteMBHeader();
	        }
            else
	        {
                MBAIncrement=1;
                WriteMBHeader();
	        }
            for (c=0; c<6; c++)
	        {
                j = BlockJ[c];         /* Get addresses */
                v = BlockV[c];
                h = BlockH[c];
                InstallFSIob(CFSUse,j);
                MoveTo(HPos,VPos,h,v);
                ReadBlock(input);
                for (dcval=i=0; i<64; i++)
                    dcval += input[i];
                dcval = dcval/8;           /* Renormalize power */
                if (dcval>0)               /* Quantize */
                    dcval=(dcval + 4)/8;
                else
                    dcval=(dcval - 4)/8;

                if (j) {
                    UVTypeFrequency[MType]++;
                }
                else {
                    YTypeFrequency[MType]++;
                }
                CodedBlockBits=0;
                if (j)
                    EncodeDC(dcval-LastDC[j],DCChromEHuff);
                else
                    EncodeDC(dcval-LastDC[j],DCLumEHuff);
                LastDC[j] = dcval;

                if (!j) {
                    YCoefBits+=CodedBlockBits;
                }
                else if (j==1) {
                    UCoefBits+=CodedBlockBits;
                }
                else {
                    VCoefBits+=CodedBlockBits;
                }

                /* Decode everything, just in case  */
                /* dcval = dcval *8/8  is just identity */

                for(x=0;x<64;x++) input[x]=dcval;
                InstallFSIob(CFSNew,j);
                MoveTo(HPos,VPos,h,v);
                BoundIntegerMatrix(input);
                WriteBlock(input);
	    }
            QUse++;
            QSum+=SQuant;
            CurrentMBA++;
            if (MType < MaxTypes)
                MacroTypeFrequency[MType]++;
            else
	        {
                WHEREAMI();
                printf("Illegal DCINTRA macroblock type: %d.\n",MType);
	        }
	    }
    }
    HPos=VPos=0;
    if (Rate) BufferOffset -= (Rate*FrameSkip/FrameRate());
    //CollectStatistics();
    //Statistics(CFSUse,CFSNew);
}

/*BFUNC

 MpegDecodeSequence() decodes the sequence defined in the CImage and
 CFrame structures; the stream is opened from this routine.

 EFUNC*/
void MpegDecodeSequence()
{
    BEGIN("MpegDecodeSequence");
    int fnum;
    int Setup;
    int Active;
    int BaseBegin,BaseEnd;
    int CurrentOffset,Diff; /* Stuff for calculating next frame */
    int FirstFrame;

    sropen(CImage->StreamFileName);

    FirstFrame=1;
    Active=Setup=0;
    CurrentFrame=BaseFrame-2; PType=P_INTERPOLATED;
    if (ReadHeaderHeader())     /* Look for next header */
    {
        srclose();
        WHEREAMI();
        printf("Header anticipated.\n");
        exit(ErrorValue);
    }
    ReadHeaderTrailer();
    while(1)
    {
        if (MBSRead == -4)        /* Video sequence start */
	    {
            if (ReadVSHeader())   /* Attempt to read the header file */
	        {
                srclose();
                WHEREAMI();
                printf("Invalid VS sequence.\n");
                exit(-1);
	        }
            printf("START>SEQUENCE\n");
            if (Rate)
                printf("Transmission rate (bps): %d\n",Rate);
            ImageType=IT_NTSC;
            CreateFrameSizes();           /* Hor size and vert size important*/
            if (Loud > MUTE)
	        {
                PrintImage();
                PrintFrame();
	        }
            MakeFS(WRITE_IOB);
            CFSBase=CFStore;
            MakeFS(WRITE_IOB);
            CFSNext=CFStore;
            MakeFS(WRITE_IOB);
            CFSMid=CFStore;
            GroupFirstFrame=BaseBegin=BaseEnd=StartFrame;
            MakeFGroup();
            Setup=1;
            if (ReadHeaderHeader())  /* nonzero on error or eof */
                break; /* Could be end of file */
            ReadHeaderTrailer();
            continue;
	    }
        else if (MBSRead < 0)  /* Start of new marker */
	    {
            if (!Setup)
	        {
                WHEREAMI();
                printf("No first sequence code in stream!\n");
                exit(-1);
	        }
            if (Active)
	        {
                printf("END>Frame: %d\n",CurrentFrame);
                MakeFileNames();
                WriteFS();                        /* Store pictures */
	        }
            if (MBSRead == -2)  /* Start of group of frames */
	        {
                ReadGOPHeader();         /* Next, read the header again */

                if (PType==P_INTERPOLATED)  /* Interp means additional frame*/
                    GroupFirstFrame=CurrentFrame+2;
                else
                    GroupFirstFrame=CurrentFrame+1;

                if (FrameOffset<0)
                    FrameOffset = GroupFirstFrame - TimeCode2Integer(TimeCode);
                else
		        {
                    fnum=TimeCode2Integer(TimeCode)+FrameOffset;
                    if (fnum!=GroupFirstFrame)
		            {
                        WHEREAMI();
                        printf("Time codes do not match. Frame: %d  Found: %d\n",
                                GroupFirstFrame,fnum);
                        if (UseTimeCode) GroupFirstFrame=fnum;
		            }
		        }
                printf("GOP>FirstFrame: %d\n",GroupFirstFrame);
                Active=0;
	        }
            else if (MBSRead== -1)
	        {
                ReadPictureHeader();
                if (!Active)     /* Start of picture frame */
		        {
                    CurrentFrame=GroupFirstFrame;
                    Active=1;
		        }
                /* Calculate next picture location */
                CurrentOffset=(CurrentFrame-GroupFirstFrame)%TEMPORAL_MODULO;
                Diff = (TemporalReference-CurrentOffset+TEMPORAL_MODULO)%
                        TEMPORAL_MODULO;     /* Get positive modulo difference */
                if (Diff < (TEMPORAL_MODULO >> 1))
                    CurrentFrame += Diff;
                else
                    CurrentFrame -= (TEMPORAL_MODULO - Diff);
                printf("START>Frame: %d\n",CurrentFrame);

	        }
            else if (MBSRead == -3)      /* End of pictures */
	        {
                printf("END>SEQUENCE\n");
                break;
	        }
            if (ReadHeaderHeader()) /* nonzero on error or eof */
	        {
                WHEREAMI();
                printf("Bad header after picture start.\n");
                exit(-1);
	        }
            ReadHeaderTrailer();
            continue;
	    }
        else
	    {
            if (Rate)
	        {
                if (FirstFrame)
		        {
                    FirstFrame=0;
                    BufferOffset = (BufferFullness/90)*(Rate/1000) - mrtell();
                    printf("First decoder buffer bits = %d\n",BufferOffset);
		        }
                else
		        {
                    printf("Actual decoder buffer bits: %ld; On stream: %d\n",
                            (BufferOffset - mrtell()),
                            (BufferFullness/90)*(Rate/1000));
		        }
	        }
            switch (PType)
	        {
                case P_PREDICTED:
                case P_DCINTRA:
                case P_INTRA:
                    if (ClosedGOP&1) ClosedGOP++;   /* Inc by 1, to preserve */
                    else ClosedGOP=0;               /* else zero out */
                    if (BrokenLink&1) BrokenLink++; /* Inc by 1, to preserve */
                    else BrokenLink=0;              /* else zero out */

                    SwapFS(CFSNext,CFSBase);  /* Load into Next */
                    CFStore=CFSNext;
                    BaseBegin = BaseEnd;
                    BaseEnd = CurrentFrame;
                    FrameDistance=BaseEnd-BaseBegin;
                    if (PType==P_INTRA)
                        printf("Intraframe Decode: %d\n",CurrentFrame);
                    else if (PType==P_PREDICTED)
                        printf("Predicted Decode: %d\n",CurrentFrame);
                    else
                        printf("DC Intraframe: %d\n",CurrentFrame);
                    MpegDecodeIPBDFrame();
                    break;
                case P_INTERPOLATED:
                    if (ClosedGOP)
                    {
                        WHEREAMI();
                        printf("Closed GOP frame %d has pictures in it.\n", CurrentFrame);
                    }
                    else if (BrokenLink)
                    {
                        WHEREAMI();
                        printf("Broken link frame %d may be invalid.\n",
                                CurrentFrame);
                    }
                    CFStore=CFSMid;
                    FrameDistance = CurrentFrame-BaseBegin;
                    printf("Interpolated Decode: %d  Base Relative: %d\n",
                            CurrentFrame,FrameDistance);
                    MpegDecodeIPBDFrame();
                    break;
                default:
                    WHEREAMI();
                    printf("Bad Picture Type: %d\n",PType);
                    break;
	        }
            if (Rate) BufferOffset += (Rate*FrameSkip/FrameRate());
	    }
    }
    srclose();
}

/*BFUNC

 MpegDecodeIPBDFrame() is used to decode a generic frame. Note that the
 DC Intraframe decoding is farmed off to a specialized routine for
 speed.

 EFUNC*/
void MpegDecodeIPBDFrame()
{
    BEGIN("MpegDecodeIPBDFrame");

    // Ad ogni inzio frame inizializza la sequenza pseudo-casuale del frame corrente
    if (scrambling>0 && PType == P_INTRA) initPseudo4Frame();

    int x;
    int OldType,OldMVD1V,OldMVD1H,OldMVD2V,OldMVD2H,OldCBP;
    int NextType,NextMVD1V,NextMVD1H,NextMVD2V,NextMVD2H,NextCBP;
    int NextMBA,NextVPos;
    int StartSlice,LastPass=0;

    if (PType==P_DCINTRA)
    {
        MpegDecodeDFrame();
        return;
    }
    CurrentMBS=0;
    CurrentMBA=LastMBA= -1;
    HPos=LastMType= -1; /* Reset MDU, Type pred */
    VPos=0;
    while (1)
    {
        if (MBSRead >= 0)                  /* Read off a slice */
	    {
            ReadMBSHeader();
            CurrentMBS++;
            NextVPos = SVP-1;
	    }
        else
	    {
            NextMBA = MBHeight*MBWidth-1;
            if (CurrentMBA >= NextMBA) break;
            LastPass=1;
            NextMBA++;
	    }
        MVD1H=MVD1V=MVD2H=MVD2V=0;
        /* printf("VPos: %d\n",VPos); */
        UseQuant=SQuant;                 /* Reset quantization to slice */
        if (Loud > MUTE)
            printf("Vertical Position: %d  out of: %d.\n",VPos,MBHeight);
        if (VPos > MBHeight)
	    {
            WHEREAMI();
            printf("VPos: %d  MBHeight: %d. Buffer Overflow\n",VPos,MBHeight);
            return;
	    }
        for (x=0; x<3; x++) LastDC[x]=128;   /* Reset DC prediction */
        StartSlice=1;
        while (1)     /* Handle all coding for that slice */
	    {          /* Save data with previous state */
            OldType=MType; OldCBP = CBP;
            OldMVD1V=MVD1V; OldMVD1H=MVD1H;
            OldMVD2V=MVD2V; OldMVD2H=MVD2H;
            if (StartSlice) MVD1H=MVD1V=MVD2H=MVD2V=0;
            if (!LastPass)
	        {
                if (ReadMBHeader()) break;
                if (StartSlice)
		        {
                    StartSlice=0;
                    NextMBA = NextVPos*MBWidth+MBAIncrement-1;
		        }
                else
                    NextMBA = LastMBA + MBAIncrement;
	        }
            else
	        {
                printf("Entering Last Pass: %d of %d\n",
                        CurrentMBA,NextMBA);
                if (LastPass++>1) break;
	        }
            /* Save data with previous state */
            NextType=MType; NextCBP = CBP;
            NextMVD1V=MVD1V; NextMVD1H=MVD1H;
            NextMVD2V=MVD2V; NextMVD2H=MVD2H;

            while (CurrentMBA < NextMBA)
	        {
                CurrentMBA++;
                if (++HPos >= MBWidth)
		        {
                    HPos=0;
                    VPos++;
                }
                /* printf("Loop:HPos: %d VPos: %d\n",HPos,VPos);*/
                if (CurrentMBA < NextMBA)
	        	{
                    /* printf("Skipping Macroblock.\n"); */
                    /* Added 8/18/93 */
                    for (x=0; x<3; x++) LastDC[x]=128;  /* Reset DC prediction */
                    switch(PType)  /* Skipped Macroblocks */
		            {
                        case P_INTRA:
                            WHEREAMI();
                            printf("Bad skipped macroblock.\n");
                            MType=OldType; CBP=0;
                            break;
                        case P_PREDICTED:
                            if (QuantPMType[PType][OldType])
                                MType=5;
                            else MType=1;
                            CBP=0;
                            MVD1V=0;
                            MVD1H=0;
                            break;
                        case P_INTERPOLATED:
                            /*printf("Skip[%d:%d] T:%d  MV1[%d:%d] MV2[%d:%d].\n",
                             HPos,VPos,OldType,
                             OldMVD1H,OldMVD1V,OldMVD2H,OldMVD2V); */
                            MType=OldType; CBP=0;  /* No blocks coded */
                            MVD1V = OldMVD1V;
                            MVD1H = OldMVD1H; /* Reset MV */
                            MVD2V = OldMVD2V;
                            MVD2H = OldMVD2H;
                            if (IPMType[PType][MType])
                            {
                                WHEREAMI();
                                printf("Interpolated skipped INTRA macroblock\n");
                            }
                            break;
		            }
		        }
                else if (LastPass) break;
                else  /* Reload with new MV, new macro type */
		        {
                    MType=NextType;CBP=NextCBP;
                    MVD1V=NextMVD1V;MVD1H=NextMVD1H;
                    MVD2V=NextMVD2V;MVD2H=NextMVD2H;
		        }
                /* printf("[%d:%d] FM[%d:%d] BM[%d:%d]\n",
                 HPos,VPos,MVD1H,MVD1V,MVD2H,MVD2V); */

                MpegDecompressMDU();
                MpegDecodeSaveMDU();
	        }
            LastMType = MType;
            LastMBA = CurrentMBA;
	    }
        if (MBSRead<0) break;
        else ReadHeaderTrailer();
    }
}

/*BFUNC

 MpegDecompressMDU() is used to decompress the raw data from the
 stream. Motion compensation occurs later.

 EFUNC*/
static void MpegDecompressMDU()
{
    BEGIN("MpegDecompressMDU");
    int c,j,x;
    int *input;

    if (Loud > MUTE)
    {
        printf("CMBS: %d CMDU: %d  LastDC: %d\n", VPos, HPos, LastDC[0]);
    }
    if (PType==P_PREDICTED)
    {
        if (!MFPMType[PType][MType]) MVD1H=MVD1V=0;
    }
    else if (PType==P_INTERPOLATED)
    {
        if (IPMType[PType][MType]) MVD1H=MVD1V=MVD2H=MVD2V=0;
    }
    if (QuantPMType[PType][MType])
    {
        UseQuant=MQuant; /* Macroblock overrides */
        SQuant=MQuant;   /* Overrides for future */
    }
    else UseQuant=SQuant;
    if (IPMType[PType][MType])
    {
        if ((LastMType<0) || !(IPMType[PType][LastMType]))
            for (x=0; x<3; x++)
                LastDC[x]=128;  /* Reset DC prediction */
    }                                    /* if last one wasn't Intra */
    for (c=0; c<6; c++)
    {
        j=BlockJ[c];
        input = &outputbuf[c][0];

        if (CBP & bit_set_mask[5-c])
	    {
            if (CBPPMType[PType][MType])
                CBPDecodeAC(0,input);
            else
	        {
                if (j)
                    *input = DecodeDC(DCChromDHuff) + LastDC[j];
                else
                    *input = DecodeDC(DCLumDHuff) + LastDC[j];
                LastDC[j] = *input;
                DecodeAC(1,input);
	        }
            if (Loud > TALK)
	        {
                printf("Cooked Input\n");
                PrintMatrix(input);
	        }
	    }
        else for (x=0; x<64; x++) input[x]=0;
    }
}


/*BFUNC

 MpegDecodeSaveMDU() is used to decode and save the results into a
 frame store after motion compensation.

 EFUNC*/
static void MpegDecodeSaveMDU()
{
    BEGIN("MpegDecodeSaveMDU");
    int c,j,h,v;
    int *input;

    for (c=0; c<6; c++)
    {
        v=BlockV[c];
        h=BlockH[c];
        j=BlockJ[c];
        input = &outputbuf[c][0];

        if (CBP & bit_set_mask[5-c])
	    {
            IZigzagMatrix(input,output);

            // l'algoritmo per il watermarking è settato AND l'opzione -d è settata (decoder) AND è settato il livello di debug
            if (watermarkType>0 && GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
                if (debugWatermark >= 2) {
                    printf("\nMpegDecodeSaveMDU() -> ********* BLOCCO %d *******************************\n", countIPMType);
                    printf("SCANNING ZIGZAG INVERSO\n");
                    PrintMatrix(output);
                }
            }

            // Applico lo scrambling dopo la quantizzazione per evitare perdita di informazioni sui volti oscurati
            if (GetFlag(CImage->MpegMode,M_DECODER)) { // l'opzione -d non è settata (encoder)
                if (scrambling>0 && PType == P_INTRA) { // se è stato passato il parametro -scramb
                    if (c < 2) ReplacePixelMatrixY(output,1); // Modifico le frequenze delle righe pari del canale di luminanza Y
                    if (c > 1 && c < 4) ReplacePixelMatrixY(output,2); // Modifico le frequenze delle righe dispari del canale di luminanza Y
                    // se è stato passato il parametro della robustezza -streng, applica il descrambling anche ai canali di crominanza
                    if (strength > 0) {
                        if(c == 4) ReplacePixelMatrixU(output); // Modifico le frequenze del canale di crominanza Cr
                        if(c == 5) ReplacePixelMatrixV(output); // Modifico le frequenze del canale di crominanza Cb
                    }
                }
            }

            if (IPMType[PType][MType]) {
                // l'algoritmo per il watermarking è settato AND l'opzione -d è settata (decoder) AND è settato il livello di debug
                if (watermarkType>0 && GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
                    if (debugWatermark >= 2) {
                        printf("ESTRAZIONE WATERMARK\n");
                    }
                }

                if (GetFlag(CImage->MpegMode,M_DECODER)){ // l'opzione -d è settata (decoder)
                    if (watermarkType > 0){ // l'algoritmo per il watermarking è settato
                        if (watermarkType == LSB) {
                            extractWatermark_lsb(output, countIPMType);
                        } else if(watermarkType == COX) {
                            extractWatermark_cox(output, countIPMType);
                        }
                    }
                    countIPMType++;
                }

                MPEGIntraIQuantize(output,MPEGIntraQ,UseQuant);
            } else {
                MPEGNonIntraIQuantize(output,MPEGNonIntraQ,UseQuant);
            }
            BoundIQuantizeMatrix(output);

            // l'algoritmo per il watermarking è settato AND l'opzione -d è settata (decoder) AND è settato il livello di debug
            if (watermarkType>0 && GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
                if (debugWatermark >= 2) {
                    printf("APPLICAZIONE QUANTIZZAZIONE INVERSA \n");
                    PrintMatrix(output);
                }
            }

            DefaultIDct(output,input);

            // l'algoritmo per il watermarking è settato AND l'opzione -d è settata (decoder) AND è settato il livello di debug
            if (watermarkType>0 && GetFlag(CImage->MpegMode,M_DECODER) && debugWatermark) { // Debug watermarking
                if (debugWatermark >= 2) {
                    printf("APPLICAZIONE DCT INVERSA\n");
                    PrintMatrix(output);
                    printf("****************************************************************************\n");
                }
            }
	    }


        if (!IPMType[PType][MType])
	    {
            /*
             printf("MVD1H: %d MVD1V: %d\n",MVD1H,MVD1V);
             printf("MVD2H: %d MVD2V: %d\n",MVD2H,MVD2V);
             */

            if ((MFPMType[PType][MType]) && /* Do both */
                    (MBPMType[PType][MType]))
	        {
                InstallFSIob(CFSBase,j);
                MoveTo(HPos,VPos,h,v);
                InstallFSIob(CFSNext,j);
                MoveTo(HPos,VPos,h,v);
                if (c < 4)
		        {
                    MX = MVD1H;  MY = MVD1V;
                    NX = MVD2H;  NY = MVD2V;
		        }
                else
		        {
                    MX = MVD1H/2;  MY = MVD1V/2;
                    NX = MVD2H/2;  NY = MVD2V/2;
		        }
                Add2Compensate(input,
                        CFSBase->Iob[j],
                        CFSNext->Iob[j]);
	        }
            else if (MBPMType[PType][MType]) /* Do backward */
	        {
                InstallFSIob(CFSNext,j);
                MoveTo(HPos,VPos,h,v);
                if (c < 4) {
                    MX = MVD2H;
                    MY = MVD2V;
                }
                else {
                    MX = MVD2H/2;
                    MY = MVD2V/2;
                }
                AddCompensate(input,CFSNext->Iob[j]);
	        }
            else                            /* Defaults to forward */
	        {
                InstallFSIob(CFSBase,j);
                MoveTo(HPos,VPos,h,v);
                if (c < 4) {
                    MX = MVD1H;
                    MY = MVD1V;
                }
                else
                {
                    MX = MVD1H/2;
                    MY = MVD1V/2;
                }
                AddCompensate(input,CFSBase->Iob[j]);
	        }
	    }
        if (!(GetFlag(CImage->MpegMode,M_DECODER)))
            InstallFSIob(CFSNew,j);
        else
            InstallIob(j);  /* Should be correct */
        MoveTo(HPos,VPos,h,v);

        BoundIntegerMatrix(input);
        WriteBlock(input);

    }
}

/*BFUNC

 MpegDecodeDFrame() decodes a single DC Intraframe off of the stream.
 This function is typically called only from MpegDecodeIPBDFrame().

 EFUNC*/
static void MpegDecodeDFrame()
{
    BEGIN("MpegDecodeDFrame");
    int c,j,v,h,x;
    int input[64];
    int StartSlice;
    int dcval;

    CurrentMBS=0;
    CurrentMBA= -1;
    HPos=VPos=0;
    while (MBSRead >= 0)
    {
        ReadMBSHeader();
        CurrentMBS++;
        VPos = SVP-1;
        /* printf("VPos: %d\n",VPos); */
        if (Loud>MUTE)
            printf("Vertical Position: %d  MBHeight: %d\n",VPos,MBHeight);
        if (VPos > MBHeight)
	    {
            WHEREAMI();
            printf("VPos: %d  MBHeight: %d. Buffer Overflow\n",VPos,MBHeight);
            return;
	    }
        StartSlice=1;
        for (x=0; x<3; x++)
            LastDC[x]=128;   /* Reset DC prediction */
        while (1)     /* Handle all coding */
	    {          /* Save data with previous state */
            if (ReadMBHeader()) break;
            if (StartSlice)
	        {
                if ((HPos+1)!=MBAIncrement)
		        {
                    WHEREAMI();
                    printf("Start-slice MBA: %d != MBAIncr: %d\n",
                            HPos+1,MBAIncrement);
		        }
                HPos=MBAIncrement-1;
                StartSlice=0;
	        }
            else if (MBAIncrement != 1)
	        {
                WHEREAMI();
                printf("Nonconsecutive MBA increments in DCINTRA frame\n");
	        }
            CurrentMBA++;
            /* Save data with previous state */

            if (Loud > MUTE)
	        {
                printf("CMBS: %d CMDU: %d  LastDC: %d\n",
                        VPos, HPos, LastDC[0]);
	        }
            for (c=0; c<6; c++)
	        {
                v=BlockV[c];
                h=BlockH[c];
                j=BlockJ[c];

                if (j)
                    dcval = DecodeDC(DCChromDHuff) + LastDC[j];
                else
                    dcval = DecodeDC(DCLumDHuff) + LastDC[j];
                LastDC[j] = dcval;
                for (x=0; x<64; x++)
                    input[x]=dcval;
                InstallIob(j);  /* Should be correct */
                MoveTo(HPos,VPos,h,v);
                BoundIntegerMatrix(input);
                WriteBlock(input);
	        }
            if (++HPos >= MBWidth)
            {
                HPos=0;
                VPos++;
            }
            /* printf("HPos: %d VPos: %d\n",HPos,VPos); */
	    }
        ReadHeaderTrailer();
    }
}

/*BFUNC

 PrintImage() prints the image structure to stdout.

 EFUNC*/
void PrintImage()
{
    BEGIN("PrintImage");

    //printf("*** Image ID: %x ***\n",CImage);
    if (CImage)
    {
        if (CImage->StreamFileName)
	    {
            printf("StreamFileName %s\n",CImage->StreamFileName);
	    }
        printf("InternalMode: %d   Height: %d   Width: %d\n",
                CImage->MpegMode,CImage->Height,CImage->Width);
    }
}

/*BFUNC

 PrintFrame() prints the frame structure to stdout.

 EFUNC*/
void PrintFrame()
{
    BEGIN("PrintFrame");
    int i;

    //printf("*** Frame ID: %x ***\n",CFrame);
    if (CFrame)
    {
        printf("NumberComponents %d\n", CFrame->NumberComponents);
        for (i=0; i<CFrame->NumberComponents; i++)
	    {
            printf("Component: FilePrefix: %s FileSuffix: %s\n",
                    ((*CFrame->ComponentFilePrefix[i]) ?
                        CFrame->ComponentFilePrefix[i] : "Null"),
                    ((*CFrame->ComponentFileSuffix[i]) ?
                        CFrame->ComponentFileSuffix[i] : "Null"));
            printf("Height: %d  Width: %d\n",
                    CFrame->Height[i],CFrame->Width[i]);
            printf("HorizontalFrequency: %d  VerticalFrequency: %d\n",
                    CFrame->hf[i],CFrame->vf[i]);
	    }
    }
}

/*BFUNC

 MakeImage() makes an image structure and installs it as the current
 image.

 EFUNC*/
void MakeImage()
{
    BEGIN("MakeImage");

    if (!(CImage = MakeStructure(IMAGE)))
    {
        WHEREAMI();
        printf("Cannot make an image structure.\n");
    }
    CImage->StreamFileName = NULL;
    CImage->PartialFrame = 0;
    CImage->MpegMode = 0;
    CImage->Height = 0;
    CImage->Width = 0;
}

/*BFUNC

 MakeFrame() makes a frame structure and installs it as the current
 frame structure.

 EFUNC*/
void MakeFrame()
{
    BEGIN("MakeFrame");
    int i;

    if (!(CFrame = MakeStructure(FRAME)))
    {
        WHEREAMI();
        printf("Cannot make a frame structure.\n");
    }
    CFrame->NumberComponents = 3;
    for (i=0; i<MAXIMUM_SOURCES; i++)
    {
        CFrame->PHeight[i] = 0;
        CFrame->PWidth[i] = 0;
        CFrame->Height[i] = 0;
        CFrame->Width[i] = 0;
        CFrame->hf[i] = 1;
        CFrame->vf[i] = 1;
        *CFrame->ComponentFileName[i] = '\0';
        *CFrame->ComponentFilePrefix[i] = '\0';
        *CFrame->ComponentFileSuffix[i] = '\0';
    }
}

/*BFUNC

 MakeFGroup() creates a memory structure for the frame group.

 EFUNC*/
void MakeFGroup()
{
    BEGIN("MakeFGroup");
    int i;

    FFS = (MEM **) calloc(FrameInterval+1,sizeof(MEM *));
    for (i=0; i<=FrameInterval; i++)
    {
        FFS[i]= MakeMem(CFrame->Width[0],CFrame->Height[0]);
        SetMem(128,FFS[i]);
    }

    initme(); /* doesn't */
}

/*BFUNC

 LoadFGroup() loads in the memory structure of the current frame group.

 EFUNC*/
void LoadFGroup(index)
int index;
{
    BEGIN("LoadFGroup");
    int i;
    static char TheFileName[100];

    for (i=0; i<=FrameInterval; i++)
    {
        printf("Nome del file: %s%d%s\n",
                CFrame->ComponentFilePrefix[0],
                index+i,
                CFrame->ComponentFileSuffix[0]);
        printf("Interval frame: %d\n", i);
        sprintf(TheFileName,"%s%d%s",
                CFrame->ComponentFilePrefix[0],
                index+i,
                CFrame->ComponentFileSuffix[0]);
        printf("Loading file: %s\n",TheFileName);

        if (CImage->PartialFrame)
            FFS[i] = LoadPartialMem(TheFileName,
                    CFrame->PWidth[0],
                    CFrame->PHeight[0],
                    CFrame->Width[0],
                    CFrame->Height[0],
                    FFS[i]);
        else
            FFS[i] = LoadMem(TheFileName,
                    CFrame->Width[0],
                    CFrame->Height[0],
                    FFS[i]);
    }

}

/*BFUNC

 MakeFstore() makes and installs the frame stores for the motion
 estimation and compensation.

 EFUNC*/
void MakeFStore()
{
    BEGIN("MakeFStore");
    int i;

    CFStore = (FSTORE *) malloc(sizeof(FSTORE));
    CFStore->NumberComponents = 0;
    for(i=0; i<MAXIMUM_SOURCES; i++)
    {
        CFStore->Iob[i] = NULL;
    }
}

/*BFUNC

 MakeStat() makes the statistics structure to hold all of the current
 statistics. (CStat).

 EFUNC*/
void MakeStat()
{
    BEGIN("MakeStat");
    CStat = MakeStructure(STAT);
}

/*BFUNC

 SetCCITT() just sets the width and height parameters for the QCIF,
 CIF, NTSC-CIF frame sizes.

 EFUNC*/
void SetCCITT()
{
    BEGIN("SetCCITT");

    switch(ImageType)
    {
        case IT_NTSC:
            HorizontalSize=352;
            VerticalSize=240;
            break;
        case IT_CIF:
            HorizontalSize=352;
            VerticalSize=288;
            break;
        case IT_QCIF:
            HorizontalSize=176;
            VerticalSize=144;
            break;
        default:
            WHEREAMI();
            printf("Unknown ImageType: %d\n",ImageType);
            exit(ERROR_BOUNDS);
            break;
    }
}


/*BFUNC

 CreateFrameSizes() is used to initialize all of the frame sizes to fit
 that of the input image sequence.

 EFUNC*/
void CreateFrameSizes()
{
    BEGIN("CreateFrameSizes");


    int i,maxh,maxv;

    CFrame->NumberComponents = 3;
    CFrame->hf[0] = 2;                 // Default numbers
    CFrame->vf[0] = 2;                 // DO NOT CHANGE
    CFrame->hf[1] = 1;
    CFrame->vf[1] = 1;
    CFrame->hf[2] = 1;
    CFrame->vf[2] = 1;
    if (*CFrame->ComponentFilePrefix[0]=='\0')
    {
        WHEREAMI();
        printf("A file prefix should be specified.\n");
        exit(ERROR_BOUNDS);
    }

    for (i=0; i<CFrame->NumberComponents; i++)
    {
        if (*CFrame->ComponentFilePrefix[i]=='\0')
	    {
            strcpy(CFrame->ComponentFilePrefix[i],
                    CFrame->ComponentFilePrefix[0]);
	    }
        if (*CFrame->ComponentFileSuffix[i]=='\0')
	    {
            strcpy(CFrame->ComponentFileSuffix[i],
                    DefaultSuffix[i]);
	    }
    }
    MBWidth = (HorizontalSize+15)/16;
    MBHeight = (VerticalSize+15)/16;
    CImage->Width = MBWidth*16;
    CImage->Height = MBHeight*16;
    printf("Image Dimensions: %dx%d   MPEG Block Dimensions: %dx%d\n",
            HorizontalSize,VerticalSize,CImage->Width,CImage->Height);
    maxh = CFrame->hf[0];                   // Look for maximum vf, hf
    maxv = CFrame->vf[0];                   // Actually already known
    for(i=1; i<CFrame->NumberComponents; i++)
    {
        if (CFrame->hf[i]>maxh)
            maxh = CFrame->hf[i];
        if (CFrame->vf[i]>maxv)
            maxv = CFrame->vf[i];
    }

    if (CImage->PartialFrame)
    {
        for(i=0; i<CFrame->NumberComponents; i++)
	    {
            CFrame->Width[i]=CImage->Width*CFrame->hf[i]/maxh;
            CFrame->Height[i]=CImage->Height*CFrame->vf[i]/maxv;
            CFrame->PWidth[i]=HorizontalSize*CFrame->hf[i]/maxh;
            CFrame->PHeight[i]=VerticalSize*CFrame->vf[i]/maxv;
	    }
    }
    else
    {
        for(i=0; i<CFrame->NumberComponents; i++)
	    {
            CFrame->PWidth[i]=CFrame->Width[i]=
                    CImage->Width*CFrame->hf[i]/maxh;
            CFrame->PHeight[i]=CFrame->Height[i]=
                    CImage->Height*CFrame->vf[i]/maxv;
	    }
    }
}

/*BFUNC

 Help() prints out help information about the MPEG program.

 EFUNC*/
void Help()
{
    BEGIN("Help");

    printf("mpeg [-d] [-NTSC] [-CIF] [-QCIF] [-PF] [-NPS] [-MBPS mbps] [-UTC]\n");
    printf("     [-XING] [-DMVB] [-MVNT]\n");
    printf("     [-a StartNumber] [-b EndNumber]\n");
    printf("     [-h HorizontalSize] [-v VerticalSize]\n");
    printf("     [-f FrameInterval] [-g GroupInterval]\n");
    printf("     [-4] [-c] [-i MCSearchLimit] [-o] [-p PictureRate]\n");
    printf("     [-q Quantization] [-r Target Rate]\n");
    printf("     [-s StreamFile]  [-x Target Filesize] [-y]\n");
    printf("     [-z ComponentFileSuffix i]\n");
    printf("     ComponentFilePrefix1 [ComponentFilePrefix2 ComponentFilePrefix3]\n");
    printf("     [-ifwf <Watermark File Path>]\n");
    printf("     [-ifwm <Watermark Message>]\n");
    printf("     [-efwf <Watermark File Path>]\n");
    printf("     [-efwm]\n");
    printf("-NTSC (352x240)  -CIF (352x288) -QCIF (176x144) base filesizes.\n");
    printf("-PF is partial frame encoding/decoding...\n");
    printf("    is useful for files horizontalxvertical sizes not multiple of 16\n");
    printf("    otherwise files are assumed to be multiples of 16.\n");
    printf("-NPS is not-perfect slice (first/end) blocks not same...\n");
    printf("-MBPS mbps: is macroblocks per slice.\n");
    printf("-UTC Use time code - forces frames to equal time code value\n");
    printf("-XING default 160x120 partial frame, XING encoding\n");
    printf("-DMVB dynamic motion vector bounding - useful for frames\n");
    printf("      with limited motion vector movement. Not required, however.\n");
    printf("-MVNT Disables motion vector telescoping.  Useful only for very\n");
    printf("      large search windows.\n");
    printf("-d enables the decoder\n");
    printf("-a is the start filename index. [inclusive] Defaults to 0.\n");
    printf("-b is the end filename index. [inclusive] Defaults to 0.\n");
    printf(" overiding -NTSC -CIF -QCIF\n");
    printf("Dimension parameters:\n");
    printf("  -h gives horizontal size of active picture.\n");
    printf("  -v gives vertical size of active picture.\n");
    printf("  -f gives frame interval - distance between intra/pred frame (def 3).\n");
    printf("  -g gives group interval - frame intervals per group (def 2).\n");
    printf("\n");
    printf("-4 used to specify if DC intraframe mode is used for encoding.\n");
    printf("-c is used to give motion vector prediction. (default: off).\n");
    printf("-i gives the MC search area: can be very large, e.g. 128 (default 15).\n");
    printf("-o enables the interpreter.\n");
    printf("-p gives the picture rate (see coding standard; default 30hz).\n");
    printf("-q denotes Quantization, between 1 and 31.\n");
    printf("-r gives the target rate in bits per second.\n");
    printf("-s denotes StreamFile, which defaults to ComponentFilePrefix1.mpg\n");
    printf("-x gives the target filesize in bits. (overrides -r option.)\n");
    printf("-y enables Reference DCT.\n");
    printf("-z gives the ComponentFileSuffixes (repeatable).\n");
    printf("\n");
    printf("For watermarking:\n");
    printf("-ifwf_lsb insert a file as a watermark in the frequency domain, using Least Significant Bit (lsb) algorithm.\n");
    printf("-ifwm_lsb insert a text message as a watermark in the frequency domain, using Least Significant Bit (lsb) algorithm.\n");
    printf("-efwf_lsb extracts from the frequency domain the watermark as a file, using Least Significant Bit (lsb) algorithm.\n");
    printf("-efwm_lsb extracts from the frequency domain the text watermark (on-screen), using Least Significant Bit (lsb) algorithm.\n");
    printf("-ifwf_cox insert a text file as a watermark in the frequency domain, using 'Cox et al.' algorithm.\n");
    printf("-ifwm_cox insert a text message as a watermark in the frequency domain, using 'Cox et al.' algorithm.\n");
    printf("-efwf_cox extracts from the frequency domain the text watermark as a text file, using 'Cox et al.' algorithm.\n");
    printf("-efwm_cox extracts from the frequency domain the text watermark (on-screen), using 'Cox et al.' algorithm.\n");
    printf("-wci Watermark coefficient of insertion (it is multiplied by the size of the watermark) [ > 0 ] (default 1)\n");
    printf("-wncb Number of coefficients (DCT) per block to modify [ 1 to 64 ] (default 1)\n");
    printf("-wseed Numeric seed to spread the watermark (default 1)\n");
    printf("-sogliaCox bit threshold to divide the watermark [ 1 to 32 ] (default 2) (only Cox et al.)\n");
    printf("-originalCoeff denotes StreamFile where the coefficients are stored before the change (with no change) (only Cox et al.)\n");
    printf("-dbw view more info of the watermarking process [ 0 to 2 ] (default 0)\n");
    printf("Examples:\n");
    printf("\t>mpeg -a 0 -b 6 shortOriginal -s short.mpg -ifwf_lsb watermarkOriginal.txt -wci 2 -wncb 2 -wseed 159357\n");
    printf("\t>mpeg -d -s short.mpg shortDecompressed -efwf_lsb watermarkExtracted.txt -wci 2 -wncb 2 -wseed 159357\n");
    printf("\t>mpeg -a 0 -b 6 shortOriginal -s short.mpg -ifwf_cox watermarkOriginal.txt -wci 2 -wncb 2 -wseed 159357 -sogliaCox 4 -originalCoeff coefficientsOriginal.dat\n");
    printf("\t>mpeg -d -s short.mpg shortDecompressed -efwf_cox coefficientsOriginal.dat watermarkExtracted.txt -wci 2 -wncb 2 -wseed 159357 -sogliaCox 4\n");
}

/*BFUNC

 MakeFileNames() creates the filenames for the component files
 from the appropriate prefix and suffix commands.

 EFUNC*/
void MakeFileNames()
{
    BEGIN("MakeFileNames");
    int i;

    for(i=0; i<3; i++)
    {

        sprintf(CFrame->ComponentFileName[i],"%s%d%s",
                CFrame->ComponentFilePrefix[i],
                CurrentFrame,
                CFrame->ComponentFileSuffix[i]);
    }
}

/*BFUNC

 VerifyFiles() checks to see if the component files are present and
 of the correct length.

 EFUNC*/
void VerifyFiles()
{
    BEGIN("VerifyFiles");
    int i,FileSize;
    FILE *test;

    printf("Mumeri di componente: %d\n", CFrame->NumberComponents);

    for(i=0;i<CFrame->NumberComponents;i++)
    {
        printf("Mumero: %s\n", CFrame->ComponentFileName[i]);
        if ((test = fopen(CFrame->ComponentFileName[i],"r")) == NULL)
	{
            WHEREAMI();
            printf("Cannot Open FileName %s\n",
                    CFrame->ComponentFileName[i]);
            exit(ERROR_BOUNDS);
	}
        fseek(test,0,2);
        FileSize = ftell(test);
        rewind(test);
        if (CFrame->PHeight[i] == 0)
	{
            if (CFrame->PWidth[i] == 0)
	    {
                WHEREAMI();
                printf("Bad File Specification for file %s\n",
                        CFrame->ComponentFileName[i]);
	    }
            else
	    {
                CFrame->PHeight[i] = FileSize / CFrame->PWidth[i];
                printf("Autosizing Height to %d\n",
                        CFrame->PHeight[i]);
	    }
	}
        if (FileSize != CFrame->PWidth[i] * CFrame->PHeight[i])
	{
            WHEREAMI();
            printf("Inaccurate File Sizes: Estimated %d: %s: %d \n",
                    CFrame->PWidth[i] * CFrame->PHeight[i],
                    CFrame->ComponentFileName[i],
                    FileSize);
            exit(ERROR_BOUNDS);
	}
        fclose(test);
    }
}

/*BFUNC

 Integer2TimeCode() is used to convert a frame number into a SMPTE
 25bit time code as specified by the standard.

 EFUNC*/
int Integer2TimeCode(fnum)
    int fnum;
{
    BEGIN("Integer2TimeCode");
    int code,temp;
    int TCH,TCM,TCS,TCP;

    if (DropFrameFlag && Prate == 0x1)
    {
        TCH = (fnum/107890)%24;    /* Compensate for irregular sampling */
        fnum = fnum%107890;
        if (fnum < 17980)          /* First 10 minutes treated specially */
	{
            TCM = fnum/1798;       /* Find minutes */
            fnum = fnum%1798;
            if (!fnum) TCS=TCP=0;
            else
	    {
                TCS = (fnum+2)/30; /* Note that frame 1 and 2 in min. insig. */
                TCP = (fnum+2)%30;
	    }
	}
        else                       /* Other 10 minutes have larger first min. */
	{
            fnum-=17980;           /* Remove offset from first 10 min. */
            temp = 10 + (fnum/17982)*10;  /* temp is number of 10 minutes */
            fnum = fnum % 17982;          /* fnum is pictures per 10 min. */
            if (fnum < 1800)              /* Screen out first minute */
	    {
                TCM = temp;
                TCS = fnum/30;            /* No offset required */
                TCP = fnum%30;
	    }
            else                          /* Other minutes are simple... */
	    {
                fnum -=1800;
                TCM = (fnum/1798) + temp + 1;
                fnum = fnum%1798;         /* fnum is pictures per minute */
                if (!fnum) TCS=TCP=0;
                else
		{
                    TCS = (fnum+2)/30;   /* We know each minute offset by 2 */
                    TCP = (fnum+2)%30;
		}
	    }
	}
    }
    else
    {
        if (DropFrameFlag)
	{
            WHEREAMI();
            printf("DropFrameFlag only possible with 29.97 Hz sampling.\n");
	}
        TCP = fnum%PrateIndex[Prate];     /* Nondropped frames are simpler */
        fnum = fnum/PrateIndex[Prate];
        TCS = fnum%60;
        fnum = fnum/60;
        TCM = fnum%60;
        fnum = fnum/60;
        TCH = fnum%24;
    }
    /*  printf("DFF: %d TCH: %d  TCM: %d  TCS: %d  TCP: %d\n",
     DropFrameFlag,TCH,TCM,TCS,TCP); */

    code = ((((((((((DropFrameFlag<<5)|TCH)<<6)|TCM)<<1)|1)<<6)|TCS)<<6)|TCP);
    return(code);
}

/*BFUNC

 TimeCode2Integer() is used to convert the 25 bit SMPTE time code into
 a general frame number based on 0hr 0min 0sec 0pic.

 EFUNC*/
int TimeCode2Integer(tc)
    int tc;
{
    BEGIN("TimeCode2Integer");
    int fnum;
    int TCH,TCM,TCS,TCP;

    TCP = tc &0x3f;
    tc >>=6;
    TCS = tc &0x3f;
    tc >>=6;
    if (!(tc &0x1))
    {
        WHEREAMI();
        printf("Poorly chosen time code. Spare bit not set.\n");
    }
    tc >>=1;
    TCM = tc &0x3f;
    tc >>=6;
    TCH = tc &0x1f;
    tc >>=5;
    DropFrameFlag = (tc&1);

    /*  printf("DFF: %d TCH: %d  TCM: %d  TCS: %d  TCP: %d\n",
     DropFrameFlag,TCH,TCM,TCS,TCP); */

    if (DropFrameFlag && Prate == 0x1)
    {
        fnum = TCH*107890 + TCM*1798 + (TCM ? ((TCM-1)/10)*2 : 0) + TCS*30 + TCP;
        if ((!(TCM)||(TCM%10))&&((TCS)||(TCP)))  /* If not 10 multiple minute */
            fnum -= 2;                            /* Correct for 2 pel offset */
    }
    else  /* Simple  for non-dropped frames */
    {
        if (DropFrameFlag)
	{
            WHEREAMI();
            printf("DropFrameFlag only possible with 29.97 Hz sampling.\n");
	}
        fnum = (((((TCH*60)+TCM)*60)+TCS)*PrateIndex[Prate]+TCP);
    }
    return(fnum);
}


/*END*/
