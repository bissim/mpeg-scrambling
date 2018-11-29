/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   mpeg.h
 * Author: lorenzo
 *
 * Created on 21 luglio 2018, 16.57
 */

#ifndef MPEG_H
#define MPEG_H

IMAGE *CImage;              /* Current Image definition structure */

int HorizontalSize;               /* Horizontal dimensions */
int VerticalSize;                 /* Vertical dimensions */
int Aprat;                      /* Aspect ratio */
int DropFrameFlag;                /* Whether frame will be dropped */
int Prate;                      /* Picture rate (def 30fps) */
int Brate;                /* Bit rate */
int Bsize;                      /* Buffer size */
int ConstrainedParameterFlag;     /* Default: unconstrained */
int LoadIntraQuantizerMatrix;     /* Quantization load */
int LoadNonIntraQuantizerMatrix;


/* Group of pictures layer */
int TimeCode;                     /* SMPTE timestamp */
int ClosedGOP;                    /* Back pred. needed of GOP */
int BrokenLink;                   /* Whether editing has occurred. */
/* Picture layer */
int TemporalReference;            /* "frame" reference with base of GOP */
int PType;                  /* Picture type */
int BufferFullness;               /* Current fullness of buffer */
int FullPelForward;               /* Forward motion vector on full pel */
int ForwardIndex;                 /* Decoding table to be used */
int FullPelBackward;              /* Backward motion vector on full pel */
int BackwardIndex;                /* Decoding table to be used */
int PictureExtra;                 /* Flag set if extra info present */
int PictureExtraInfo;

int SQuant;          /* Slice quantization */
int MBperSlice;      /* Number of macroblocks per slice */
/* If zero, set automaticallly */
int SliceExtra;      /* (Last) slice extra flag */
int SliceExtraInfo;  /* (Last) slice extra information */

int MType;           /* Macroblock type */
int LastMType;  /* Last encoded MType */
int SkipMode;   /* Whether we skip coding */
int EncStartSlice;    /* If encoder has started a slice */
int EncEndSlice;      /* If encoder has ended a slice */
int EncPerfectSlice;  /* Set if you want first and  last block */
/* of a slice to be defined. Clear if you */
/* allow skipped macroblocks between frames */
int UseTimeCode;/*If 1 forces frame number to be same as time code */

/* Fixed coding parameters */
int inputbuf[10][64];
int interbuf[10][64];
int fmcbuf[10][64];
int bmcbuf[10][64];
int imcbuf[10][64]; 
int outputbuf[10][64];
int output[64];
int LastDC[3]; 

int MQuant;          /* Macroblock quantization */
int SVP;             /* Slice vertical position */
int MVD1H;           /* Forward motion vector */
int MVD1V;
int MVD2H;           /* Backward motion vector */
int MVD2V;
int LastMVD1H;       /* Interpolative predictors */
int LastMVD1V;
int LastMVD2H;
int LastMVD2V;
int CBP;          /* Coded block pattern */

int MBSRead;
int MBAIncrement;
int LastMBA;
int CurrentMBA;

/*Xing Added 9; added to 15 */
int PrateIndex[];
int FileSizeBits;
int Rate;             /* Rate of the system in bits/second */
int BufferOffset;     /* Number of bits assumed for initial buffer. */
int QDFact;
int QOffs;
int QUpdateFrequency;
int QUse;
int QSum;

int MBWidth;              /* Number macroblocks widexhigh */
int MBHeight;
int HPos;                 /* Current macroblock position widexhigh */
int VPos; 
int CurrentMBS;           /* Current macroblock slice count */

/* Not used, but sometimes defined for P*64 */
int FrameSkip;            /* Frame skip value */

int DCIntraFlag;                 /* Whether we use DC Intra or not*/
int ErrorValue;                  /* Error value registered */
int Loud;                     /* Loudness of debug */
int Oracle;                      /* Oracle consults fed program */

int BaseFrame;            /* Base frame for interpolative mode */
int CurrentFrame;         /* Current frame in encoding */
int StartFrame;           /* Start frame of encoding */
int LastFrame;            /* Last frame of encoding */
int GroupFirstFrame;      /* First frame number of current group */
int FrameOffset;        /* Offset by TIMECODE */
int framesNumber;           /* Frames number */

int FrameDistance;        /* Distance between interpol. frame and base */
int FrameInterval;        /* Frame interval between pred/intra frames */
int FrameGroup;           /* Number of frame intervals per group */
int FrameIntervalCount;   /* Current frame interval count */

int BufferSize;       /* 320 kbits */
#define FrameRate() PrateIndex[Prate]
#define BufferContents() (mwtell() + BufferOffset -\
			  (((VPos*MBWidth)+HPos)\
                          *Rate*FrameSkip\
                          /(MBHeight*MBWidth*FrameRate())))

/* We define the following variables by layers, to avoid compatibility
 problems with compilers unable to do automatic aggregate
 initialization.
 
 The MType arrays are indexed on macroblock type.
 The PMType arrays are indexed on picture type and macroblock type. */

/* Quantization used */
int IntraQuantMType[];
int PredQuantMType[];
int InterQuantMType[];
int DCQuantMType[];
int *QuantPMType[];

/* Motion forward vector used */
int IntraMFMType[];
int PredMFMType[];
int InterMFMType[];
int DCMFMType[];
int *MFPMType[];

/* Motion backward vector used */
int IntraMBMType[];
int PredMBMType[];
int InterMBMType[];
int DCMBMType[];
int *MBPMType[];

/* CBP used in coding */
int IntraCBPMType[];
int PredCBPMType[];
int InterCBPMType[];
int DCCBPMType[];
int *CBPPMType[];

/* Intra coded macroblock */
int IntraIMType[];
int PredIMType[];
int InterIMType[];
int DCIMType[];
int *IPMType[];

/* Some internal parameters for rate control */

#define DEFAULT_QUANTIZATION 8
int InitialQuant;
int UseQuant;


/* Statistics */

int NumberNZ;                    /* Number transform nonzero */
int NumberOvfl;                  /* Number overflows registered */
extern int MotionVectorBits;       /* Number of bits for motion vectors */
extern int MacroAttributeBits;     /* Number of bits for macroblocks */
extern int CodedBlockBits;         /* Number of bits for coded block */
int YCoefBits;                   /* Number of bits for Y coeff */
int UCoefBits;                   /* Number of bits for U coeff */
int VCoefBits;                   /* Number of bits for V coeff */
extern int EOBBits;                /* Number of bits for End-of-block */
static int StuffCount;

/* Variabile utili per lo scrambling */
extern char *pass_scramb;
extern int clean;

extern void MpegEncodeSequence();
extern void MpegDecodeSequence();
extern void MpegEncodeIPBDFrame();
extern void MpegDecodeIPBDFrame();
extern void PrintImage();
extern void PrintFrame();
extern void MakeImage();
extern void MakeFrame();
extern void MakeFGroup();
extern void LoadFGroup();
extern void MakeFStore();
extern void MakeStat();
extern void SetCCITT();
extern void CreateFrameSizes();
extern void Help();
extern void MakeFileNames();
extern void VerifyFiles();
extern int Integer2TimeCode();
extern int TimeCode2Integer();

static void MpegEncodeDSequence();
void ExecuteQuantization();
static void CleanStatistics();
void CollectStatistics();

static void MpegEncodeSlice();
static void MpegEncodeMDU();
void MpegFindMType();
static void MpegCompressMType();
static void MpegWriteMType();

static void ProvaIterator();
static void MpegProvaIterator();

static void MpegEncodeDFrame();
static void MpegDecodeDFrame();
static void MpegDecodeSaveMDU();
static void MpegDecompressMDU();

#ifdef __cplusplus
extern "C" {
#endif




#ifdef __cplusplus
}
#endif

#endif /* MPEG_H */



