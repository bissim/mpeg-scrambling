mkdir ./test;

mkdir ./test/bike;
mkdir ./test/bike/divCom.txt;
mkdir ./test/bike/stewie.gif;
mkdir ./test/bike/tajMahal.jpg;
mkdir ./test/bike/pinguini.jpg;
mkdir ./test/bike/vid1.mpg;
mkdir ./test/bike/aud1.mp3;
mkdir ./test/bike/spazio.jpg;
mkdir ./test/bike/vid2.mpg;

mkdir ./test/flowg;
mkdir ./test/flowg/divCom.txt;
mkdir ./test/flowg/stewie.gif;
mkdir ./test/flowg/tajMahal.jpg;
mkdir ./test/flowg/pinguini.jpg;
mkdir ./test/flowg/vid1.mpg;
mkdir ./test/flowg/aud1.mp3;
mkdir ./test/flowg/spazio.jpg;
mkdir ./test/flowg/vid2.mpg;

mkdir ./test/tennis;
mkdir ./test/tennis/divCom.txt;
mkdir ./test/tennis/stewie.gif;
mkdir ./test/tennis/tajMahal.jpg;
mkdir ./test/tennis/pinguini.jpg;
mkdir ./test/tennis/vid1.mpg;
mkdir ./test/tennis/aud1.mp3;
mkdir ./test/tennis/spazio.jpg;
mkdir ./test/tennis/vid2.mpg;

mkdir ./test/bike/divCom.txt/bikeW[dec][lsb_wci-1_wncb-1]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][lsb_wci-5042_wncb-64]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][lsb_wci-509_wncb-8]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][lsb_wci-1017_wncb-16]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-1_wncb-1].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 1 -wncb 1	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-5042_wncb-64].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 5042 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-509_wncb-8].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 509 -wncb 8	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-1017_wncb-16].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 1017 -wncb 16	;

./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-1_wncb-1].mpg ./test/bike/divCom.txt/bikeW[dec][lsb_wci-1_wncb-1]/bikeW[dec][lsb_wci-1_wncb-1] -efwf_lsb ./test/bike/divCom.txt/bikeW[lsb_wci-1_wncb-1][divCom.txt].txt -wci 1 -wncb 1	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-1_wncb-64].mpg ./test/bike/divCom.txt/bikeW[dec][lsb_wci-1_wncb-64]/bikeW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/bike/divCom.txt/bikeW[lsb_wci-1_wncb-64][divCom.txt].txt -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-5042_wncb-64].mpg ./test/bike/divCom.txt/bikeW[dec][lsb_wci-5042_wncb-64]/bikeW[dec][lsb_wci-5042_wncb-64] -efwf_lsb ./test/bike/divCom.txt/bikeW[lsb_wci-5042_wncb-64][divCom.txt].txt -wci 5042 -wncb 64	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-509_wncb-8].mpg ./test/bike/divCom.txt/bikeW[dec][lsb_wci-509_wncb-8]/bikeW[dec][lsb_wci-509_wncb-8] -efwf_lsb ./test/bike/divCom.txt/bikeW[lsb_wci-509_wncb-8][divCom.txt].txt -wci 509 -wncb 8	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][lsb_wci-1017_wncb-16].mpg ./test/bike/divCom.txt/bikeW[dec][lsb_wci-1017_wncb-16]/bikeW[dec][lsb_wci-1017_wncb-16] -efwf_lsb ./test/bike/divCom.txt/bikeW[lsb_wci-1017_wncb-16][divCom.txt].txt -wci 1017 -wncb 16	;

./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][lsb_wci-1_wncb-1].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(lsb_wci-1_wncb-1)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(lsb_wci-1_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][lsb_wci-5042_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(lsb_wci-5042_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][lsb_wci-509_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(lsb_wci-509_wncb-8)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][lsb_wci-1017_wncb-16].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(lsb_wci-1017_wncb-16)(divCom.txt)(psrn).log" -f null -	;

mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-1_wncb-1]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-8523_wncb-64]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-509_wncb-4]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-1017_wncb-8]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-1_wncb-1]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-17425_wncb-64]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-1017_wncb-4]	;
mkdir ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-2144_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-8523_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-8523_wncb-64].dat -wci 8523 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-509_wncb-4].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-509_wncb-4].dat -wci 509 -wncb 4 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1017_wncb-8].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1017_wncb-8].dat -wci 1017 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-17425_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-17425_wncb-64].dat -wci 17425 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1017_wncb-4].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1017_wncb-4].dat -wci 1017 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-2144_wncb-8].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-2144_wncb-8].dat -wci 2144 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-1].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-1_wncb-1]/bikeW[dec][cox_soglia-2_wci-1_wncb-1] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-1].dat ./test/bike/divCom.txt/bikeW[cox_soglia-2_wci-1_wncb-1][divCom.txt].txt -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-1_wncb-64]/bikeW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/bike/divCom.txt/bikeW[cox_soglia-2_wci-1_wncb-64][divCom.txt].txt -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-8523_wncb-64].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-8523_wncb-64]/bikeW[dec][cox_soglia-2_wci-8523_wncb-64] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-8523_wncb-64].dat ./test/bike/divCom.txt/bikeW[cox_soglia-2_wci-8523_wncb-64][divCom.txt].txt -wci 8523 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-509_wncb-4].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-509_wncb-4]/bikeW[dec][cox_soglia-2_wci-509_wncb-4] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-509_wncb-4].dat ./test/bike/divCom.txt/bikeW[cox_soglia-2_wci-509_wncb-4][divCom.txt].txt -wci 509 -wncb 4 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1017_wncb-8].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-2_wci-1017_wncb-8]/bikeW[dec][cox_soglia-2_wci-1017_wncb-8] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1017_wncb-8].dat ./test/bike/divCom.txt/bikeW[cox_soglia-2_wci-1017_wncb-8][divCom.txt].txt -wci 1017 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-1].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-1_wncb-1]/bikeW[dec][cox_soglia-4_wci-1_wncb-1] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-1].dat ./test/bike/divCom.txt/bikeW[cox_soglia-4_wci-1_wncb-1][divCom.txt].txt -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-1_wncb-64]/bikeW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/bike/divCom.txt/bikeW[cox_soglia-4_wci-1_wncb-64][divCom.txt].txt -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-17425_wncb-64].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-17425_wncb-64]/bikeW[dec][cox_soglia-4_wci-17425_wncb-64] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-17425_wncb-64].dat ./test/bike/divCom.txt/bikeW[cox_soglia-4_wci-17425_wncb-64][divCom.txt].txt -wci 17425 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1017_wncb-4].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-1017_wncb-4]/bikeW[dec][cox_soglia-4_wci-1017_wncb-4] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1017_wncb-4].dat ./test/bike/divCom.txt/bikeW[cox_soglia-4_wci-1017_wncb-4][divCom.txt].txt -wci 1017 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-2144_wncb-8].mpg ./test/bike/divCom.txt/bikeW[dec][cox_soglia-4_wci-2144_wncb-8]/bikeW[dec][cox_soglia-4_wci-2144_wncb-8] -efwf_cox ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-2144_wncb-8].dat ./test/bike/divCom.txt/bikeW[cox_soglia-4_wci-2144_wncb-8][divCom.txt].txt -wci 2144 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-1].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-2_wci-1_wncb-1)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-2_wci-1_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-8523_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-2_wci-8523_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-509_wncb-4].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-2_wci-509_wncb-4)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-2_wci-1017_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-2_wci-1017_wncb-8)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-1].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-4_wci-1_wncb-1)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-4_wci-1_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-17425_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-4_wci-17425_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-1017_wncb-4].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-4_wci-1017_wncb-4)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/divCom.txt/bikeW[enc][cox_soglia-4_wci-2144_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/divCom.txt/bikeW(cox_soglia-4_wci-2144_wncb-8)(divCom.txt)(psrn).log" -f null -	;

mkdir ./test/bike/stewie.gif/bikeW[dec][lsb_wci-1_wncb-2]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][lsb_wci-53_wncb-64]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][lsb_wci-6_wncb-8]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][lsb_wci-13_wncb-16]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-1_wncb-2].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 1 -wncb 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-53_wncb-64].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 53 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-6_wncb-8].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 6 -wncb 8	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-13_wncb-16].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 13 -wncb 16	;

./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-1_wncb-2].mpg ./test/bike/stewie.gif/bikeW[dec][lsb_wci-1_wncb-2]/bikeW[dec][lsb_wci-1_wncb-2] -efwf_lsb ./test/bike/stewie.gif/bikeW[lsb_wci-1_wncb-2][stewie.gif].gif -wci 1 -wncb 2	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-1_wncb-64].mpg ./test/bike/stewie.gif/bikeW[dec][lsb_wci-1_wncb-64]/bikeW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/bike/stewie.gif/bikeW[lsb_wci-1_wncb-64][stewie.gif].gif -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-53_wncb-64].mpg ./test/bike/stewie.gif/bikeW[dec][lsb_wci-53_wncb-64]/bikeW[dec][lsb_wci-53_wncb-64] -efwf_lsb ./test/bike/stewie.gif/bikeW[lsb_wci-53_wncb-64][stewie.gif].gif -wci 53 -wncb 64	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-6_wncb-8].mpg ./test/bike/stewie.gif/bikeW[dec][lsb_wci-6_wncb-8]/bikeW[dec][lsb_wci-6_wncb-8] -efwf_lsb ./test/bike/stewie.gif/bikeW[lsb_wci-6_wncb-8][stewie.gif].gif -wci 6 -wncb 8	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][lsb_wci-13_wncb-16].mpg ./test/bike/stewie.gif/bikeW[dec][lsb_wci-13_wncb-16]/bikeW[dec][lsb_wci-13_wncb-16] -efwf_lsb ./test/bike/stewie.gif/bikeW[lsb_wci-13_wncb-16][stewie.gif].gif -wci 13 -wncb 16	;

./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][lsb_wci-1_wncb-2].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(lsb_wci-1_wncb-2)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(lsb_wci-1_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][lsb_wci-53_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(lsb_wci-53_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][lsb_wci-6_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(lsb_wci-6_wncb-8)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][lsb_wci-13_wncb-16].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(lsb_wci-13_wncb-16)(stewie.gif)(psrn).log" -f null -	;

mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-1_wncb-1]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-106_wncb-64]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-6_wncb-4]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-13_wncb-8]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-1_wncb-1]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-216_wncb-64]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-14_wncb-4]	;
mkdir ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-28_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-106_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-106_wncb-64].dat -wci 106 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-6_wncb-4].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-6_wncb-4].dat -wci 6 -wncb 4 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-13_wncb-8].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-13_wncb-8].dat -wci 13 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-216_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-216_wncb-64].dat -wci 216 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-14_wncb-4].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-14_wncb-4].dat -wci 14 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-28_wncb-8].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-28_wncb-8].dat -wci 28 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-1].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-1_wncb-1]/bikeW[dec][cox_soglia-2_wci-1_wncb-1] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-1].dat ./test/bike/stewie.gif/bikeW[cox_soglia-2_wci-1_wncb-1][stewie.gif].gif -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-1_wncb-64]/bikeW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/bike/stewie.gif/bikeW[cox_soglia-2_wci-1_wncb-64][stewie.gif].gif -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-106_wncb-64].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-106_wncb-64]/bikeW[dec][cox_soglia-2_wci-106_wncb-64] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-106_wncb-64].dat ./test/bike/stewie.gif/bikeW[cox_soglia-2_wci-106_wncb-64][stewie.gif].gif -wci 106 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-6_wncb-4].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-6_wncb-4]/bikeW[dec][cox_soglia-2_wci-6_wncb-4] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-6_wncb-4].dat ./test/bike/stewie.gif/bikeW[cox_soglia-2_wci-6_wncb-4][stewie.gif].gif -wci 6 -wncb 4 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-13_wncb-8].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-2_wci-13_wncb-8]/bikeW[dec][cox_soglia-2_wci-13_wncb-8] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-13_wncb-8].dat ./test/bike/stewie.gif/bikeW[cox_soglia-2_wci-13_wncb-8][stewie.gif].gif -wci 13 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-1].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-1_wncb-1]/bikeW[dec][cox_soglia-4_wci-1_wncb-1] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-1].dat ./test/bike/stewie.gif/bikeW[cox_soglia-4_wci-1_wncb-1][stewie.gif].gif -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-1_wncb-64]/bikeW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/bike/stewie.gif/bikeW[cox_soglia-4_wci-1_wncb-64][stewie.gif].gif -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-216_wncb-64].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-216_wncb-64]/bikeW[dec][cox_soglia-4_wci-216_wncb-64] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-216_wncb-64].dat ./test/bike/stewie.gif/bikeW[cox_soglia-4_wci-216_wncb-64][stewie.gif].gif -wci 216 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-14_wncb-4].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-14_wncb-4]/bikeW[dec][cox_soglia-4_wci-14_wncb-4] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-14_wncb-4].dat ./test/bike/stewie.gif/bikeW[cox_soglia-4_wci-14_wncb-4][stewie.gif].gif -wci 14 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-28_wncb-8].mpg ./test/bike/stewie.gif/bikeW[dec][cox_soglia-4_wci-28_wncb-8]/bikeW[dec][cox_soglia-4_wci-28_wncb-8] -efwf_cox ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-28_wncb-8].dat ./test/bike/stewie.gif/bikeW[cox_soglia-4_wci-28_wncb-8][stewie.gif].gif -wci 28 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-1].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-2_wci-1_wncb-1)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-2_wci-1_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-106_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-2_wci-106_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-6_wncb-4].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-2_wci-6_wncb-4)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-2_wci-13_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-2_wci-13_wncb-8)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-1].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-4_wci-1_wncb-1)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-4_wci-1_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-216_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-4_wci-216_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-14_wncb-4].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-4_wci-14_wncb-4)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/stewie.gif/bikeW[enc][cox_soglia-4_wci-28_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/stewie.gif/bikeW(cox_soglia-4_wci-28_wncb-8)(stewie.gif)(psrn).log" -f null -	;

mkdir ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-1_wncb-6]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-12_wncb-64]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-3_wncb-16]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-6_wncb-32]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-1_wncb-6].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 1 -wncb 6	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-12_wncb-64].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 12 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-3_wncb-16].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 3 -wncb 16	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-6_wncb-32].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 6 -wncb 32	;

./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-1_wncb-6].mpg ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-1_wncb-6]/bikeW[dec][lsb_wci-1_wncb-6] -efwf_lsb ./test/bike/tajMahal.jpg/bikeW[lsb_wci-1_wncb-6][tajMahal.jpg].jpg -wci 1 -wncb 6	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-1_wncb-64].mpg ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-1_wncb-64]/bikeW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/bike/tajMahal.jpg/bikeW[lsb_wci-1_wncb-64][tajMahal.jpg].jpg -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-12_wncb-64].mpg ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-12_wncb-64]/bikeW[dec][lsb_wci-12_wncb-64] -efwf_lsb ./test/bike/tajMahal.jpg/bikeW[lsb_wci-12_wncb-64][tajMahal.jpg].jpg -wci 12 -wncb 64	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-3_wncb-16].mpg ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-3_wncb-16]/bikeW[dec][lsb_wci-3_wncb-16] -efwf_lsb ./test/bike/tajMahal.jpg/bikeW[lsb_wci-3_wncb-16][tajMahal.jpg].jpg -wci 3 -wncb 16	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-6_wncb-32].mpg ./test/bike/tajMahal.jpg/bikeW[dec][lsb_wci-6_wncb-32]/bikeW[dec][lsb_wci-6_wncb-32] -efwf_lsb ./test/bike/tajMahal.jpg/bikeW[lsb_wci-6_wncb-32][tajMahal.jpg].jpg -wci 6 -wncb 32	;

./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-1_wncb-6].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(lsb_wci-1_wncb-6)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(lsb_wci-1_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-12_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(lsb_wci-12_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-3_wncb-16].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(lsb_wci-3_wncb-16)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][lsb_wci-6_wncb-32].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(lsb_wci-6_wncb-32)(tajMahal.jpg)(psrn).log" -f null -	;

mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-3]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-25_wncb-64]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-4]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-3_wncb-8]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-1]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-52_wncb-64]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-4_wncb-4]	;
mkdir ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-7_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-3].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-3].dat -wci 1 -wncb 3 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-25_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-25_wncb-64].dat -wci 25 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-4].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-4].dat -wci 1 -wncb 4 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-8].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-8].dat -wci 3 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-52_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-52_wncb-64].dat -wci 52 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-4].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-4].dat -wci 4 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-7_wncb-8].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-7_wncb-8].dat -wci 7 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-3].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-3]/bikeW[dec][cox_soglia-2_wci-1_wncb-3] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-3].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-2_wci-1_wncb-3][tajMahal.jpg].jpg -wci 1 -wncb 3 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]/bikeW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-2_wci-1_wncb-64][tajMahal.jpg].jpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-25_wncb-64].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-25_wncb-64]/bikeW[dec][cox_soglia-2_wci-25_wncb-64] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-25_wncb-64].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-2_wci-25_wncb-64][tajMahal.jpg].jpg -wci 25 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-4].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-4]/bikeW[dec][cox_soglia-2_wci-1_wncb-4] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-4].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-2_wci-1_wncb-4][tajMahal.jpg].jpg -wci 1 -wncb 4 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-8].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-2_wci-3_wncb-8]/bikeW[dec][cox_soglia-2_wci-3_wncb-8] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-8].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-2_wci-3_wncb-8][tajMahal.jpg].jpg -wci 3 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-1].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-1]/bikeW[dec][cox_soglia-4_wci-1_wncb-1] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-1].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-4_wci-1_wncb-1][tajMahal.jpg].jpg -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]/bikeW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-4_wci-1_wncb-64][tajMahal.jpg].jpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-52_wncb-64].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-52_wncb-64]/bikeW[dec][cox_soglia-4_wci-52_wncb-64] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-52_wncb-64].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-4_wci-52_wncb-64][tajMahal.jpg].jpg -wci 52 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-4].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-4_wncb-4]/bikeW[dec][cox_soglia-4_wci-4_wncb-4] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-4].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-4_wci-4_wncb-4][tajMahal.jpg].jpg -wci 4 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-7_wncb-8].mpg ./test/bike/tajMahal.jpg/bikeW[dec][cox_soglia-4_wci-7_wncb-8]/bikeW[dec][cox_soglia-4_wci-7_wncb-8] -efwf_cox ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-7_wncb-8].dat ./test/bike/tajMahal.jpg/bikeW[cox_soglia-4_wci-7_wncb-8][tajMahal.jpg].jpg -wci 7 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-3].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-2_wci-1_wncb-3)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-2_wci-1_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-25_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-2_wci-25_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-4].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-2_wci-1_wncb-4)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-2_wci-3_wncb-8)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-1].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-4_wci-1_wncb-1)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-4_wci-1_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-52_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-4_wci-52_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-4].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-4_wci-4_wncb-4)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/tajMahal.jpg/bikeW[enc][cox_soglia-4_wci-7_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/tajMahal.jpg/bikeW(cox_soglia-4_wci-7_wncb-8)(tajMahal.jpg)(psrn).log" -f null -	;

mkdir ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-1_wncb-10]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-6_wncb-64]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-2_wncb-24]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-3_wncb-32]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-1_wncb-10].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 1 -wncb 10	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-6_wncb-64].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 6 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-2_wncb-24].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 2 -wncb 24	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-3_wncb-32].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 3 -wncb 32	;

./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-1_wncb-10].mpg ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-1_wncb-10]/bikeW[dec][lsb_wci-1_wncb-10] -efwf_lsb ./test/bike/pinguini.jpg/bikeW[lsb_wci-1_wncb-10][pinguini.jpg].jpg -wci 1 -wncb 10	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-1_wncb-64].mpg ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-1_wncb-64]/bikeW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/bike/pinguini.jpg/bikeW[lsb_wci-1_wncb-64][pinguini.jpg].jpg -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-6_wncb-64].mpg ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-6_wncb-64]/bikeW[dec][lsb_wci-6_wncb-64] -efwf_lsb ./test/bike/pinguini.jpg/bikeW[lsb_wci-6_wncb-64][pinguini.jpg].jpg -wci 6 -wncb 64	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-2_wncb-24].mpg ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-2_wncb-24]/bikeW[dec][lsb_wci-2_wncb-24] -efwf_lsb ./test/bike/pinguini.jpg/bikeW[lsb_wci-2_wncb-24][pinguini.jpg].jpg -wci 2 -wncb 24	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-3_wncb-32].mpg ./test/bike/pinguini.jpg/bikeW[dec][lsb_wci-3_wncb-32]/bikeW[dec][lsb_wci-3_wncb-32] -efwf_lsb ./test/bike/pinguini.jpg/bikeW[lsb_wci-3_wncb-32][pinguini.jpg].jpg -wci 3 -wncb 32	;

./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-1_wncb-10].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(lsb_wci-1_wncb-10)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(lsb_wci-1_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-6_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(lsb_wci-6_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-2_wncb-24].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(lsb_wci-2_wncb-24)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][lsb_wci-3_wncb-32].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(lsb_wci-3_wncb-32)(pinguini.jpg)(psrn).log" -f null -	;

mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-5]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-14_wncb-64]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-2_wncb-10]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-3_wncb-14]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-2]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-30_wncb-64]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-2_wncb-4]	;
mkdir ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-4_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-5].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-5].dat -wci 1 -wncb 5 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-14_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-14_wncb-64].dat -wci 14 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-10].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-10].dat -wci 2 -wncb 10 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-14].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-14].dat -wci 3 -wncb 14 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].dat -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-30_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-30_wncb-64].dat -wci 30 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].dat -wci 2 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].dat -wci 4 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-5].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-5]/bikeW[dec][cox_soglia-2_wci-1_wncb-5] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-5].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-2_wci-1_wncb-5][pinguini.jpg].jpg -wci 1 -wncb 5 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]/bikeW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-2_wci-1_wncb-64][pinguini.jpg].jpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-14_wncb-64].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-14_wncb-64]/bikeW[dec][cox_soglia-2_wci-14_wncb-64] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-14_wncb-64].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-2_wci-14_wncb-64][pinguini.jpg].jpg -wci 14 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-10].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-2_wncb-10]/bikeW[dec][cox_soglia-2_wci-2_wncb-10] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-10].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-2_wci-2_wncb-10][pinguini.jpg].jpg -wci 2 -wncb 10 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-14].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-2_wci-3_wncb-14]/bikeW[dec][cox_soglia-2_wci-3_wncb-14] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-14].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-2_wci-3_wncb-14][pinguini.jpg].jpg -wci 3 -wncb 14 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-2]/bikeW[dec][cox_soglia-4_wci-1_wncb-2] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-4_wci-1_wncb-2][pinguini.jpg].jpg -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]/bikeW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-4_wci-1_wncb-64][pinguini.jpg].jpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-30_wncb-64].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-30_wncb-64]/bikeW[dec][cox_soglia-4_wci-30_wncb-64] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-30_wncb-64].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-4_wci-30_wncb-64][pinguini.jpg].jpg -wci 30 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-2_wncb-4]/bikeW[dec][cox_soglia-4_wci-2_wncb-4] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-4_wci-2_wncb-4][pinguini.jpg].jpg -wci 2 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].mpg ./test/bike/pinguini.jpg/bikeW[dec][cox_soglia-4_wci-4_wncb-8]/bikeW[dec][cox_soglia-4_wci-4_wncb-8] -efwf_cox ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].dat ./test/bike/pinguini.jpg/bikeW[cox_soglia-4_wci-4_wncb-8][pinguini.jpg].jpg -wci 4 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-5].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-2_wci-1_wncb-5)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-2_wci-1_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-14_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-2_wci-14_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-10].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-2_wci-2_wncb-10)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-2_wci-3_wncb-14].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-2_wci-3_wncb-14)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-4_wci-1_wncb-2)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-4_wci-1_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-30_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-4_wci-30_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-4_wci-2_wncb-4)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/pinguini.jpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/pinguini.jpg/bikeW(cox_soglia-4_wci-4_wncb-8)(pinguini.jpg)(psrn).log" -f null -	;

mkdir ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-1_wncb-13]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-5_wncb-64]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-2_wncb-32]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-3_wncb-40]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-1_wncb-13].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 1 -wncb 13	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-5_wncb-64].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 5 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-2_wncb-32].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 2 -wncb 32	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-3_wncb-40].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 3 -wncb 40	;

./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-1_wncb-13].mpg ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-1_wncb-13]/bikeW[dec][lsb_wci-1_wncb-13] -efwf_lsb ./test/bike/vid1.mpg/bikeW[lsb_wci-1_wncb-13][vid1.mpg].mpg -wci 1 -wncb 13	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-1_wncb-64].mpg ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-1_wncb-64]/bikeW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/bike/vid1.mpg/bikeW[lsb_wci-1_wncb-64][vid1.mpg].mpg -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-5_wncb-64].mpg ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-5_wncb-64]/bikeW[dec][lsb_wci-5_wncb-64] -efwf_lsb ./test/bike/vid1.mpg/bikeW[lsb_wci-5_wncb-64][vid1.mpg].mpg -wci 5 -wncb 64	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-2_wncb-32].mpg ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-2_wncb-32]/bikeW[dec][lsb_wci-2_wncb-32] -efwf_lsb ./test/bike/vid1.mpg/bikeW[lsb_wci-2_wncb-32][vid1.mpg].mpg -wci 2 -wncb 32	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-3_wncb-40].mpg ./test/bike/vid1.mpg/bikeW[dec][lsb_wci-3_wncb-40]/bikeW[dec][lsb_wci-3_wncb-40] -efwf_lsb ./test/bike/vid1.mpg/bikeW[lsb_wci-3_wncb-40][vid1.mpg].mpg -wci 3 -wncb 40	;

./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-1_wncb-13].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(lsb_wci-1_wncb-13)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(lsb_wci-1_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-5_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(lsb_wci-5_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-2_wncb-32].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(lsb_wci-2_wncb-32)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][lsb_wci-3_wncb-40].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(lsb_wci-3_wncb-40)(vid1.mpg)(psrn).log" -f null -	;

mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-1_wncb-7]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-10_wncb-64]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-2_wncb-13]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-3_wncb-19]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-1_wncb-2]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-23_wncb-64]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-2_wncb-4]	;
mkdir ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-4_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-7].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-7].dat -wci 1 -wncb 7 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-10_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-10_wncb-64].dat -wci 10 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-2_wncb-13].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-2_wncb-13].dat -wci 2 -wncb 13 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-3_wncb-19].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-3_wncb-19].dat -wci 3 -wncb 19 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].dat -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-23_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-23_wncb-64].dat -wci 23 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].dat -wci 2 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].dat -wci 4 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-7].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-1_wncb-7]/bikeW[dec][cox_soglia-2_wci-1_wncb-7] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-7].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-2_wci-1_wncb-7][vid1.mpg].mpg -wci 1 -wncb 7 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]/bikeW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-2_wci-1_wncb-64][vid1.mpg].mpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-10_wncb-64].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-10_wncb-64]/bikeW[dec][cox_soglia-2_wci-10_wncb-64] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-10_wncb-64].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-2_wci-10_wncb-64][vid1.mpg].mpg -wci 10 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-2_wncb-13].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-2_wncb-13]/bikeW[dec][cox_soglia-2_wci-2_wncb-13] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-2_wncb-13].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-2_wci-2_wncb-13][vid1.mpg].mpg -wci 2 -wncb 13 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-3_wncb-19].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-2_wci-3_wncb-19]/bikeW[dec][cox_soglia-2_wci-3_wncb-19] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-3_wncb-19].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-2_wci-3_wncb-19][vid1.mpg].mpg -wci 3 -wncb 19 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-1_wncb-2]/bikeW[dec][cox_soglia-4_wci-1_wncb-2] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-4_wci-1_wncb-2][vid1.mpg].mpg -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]/bikeW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-4_wci-1_wncb-64][vid1.mpg].mpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-23_wncb-64].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-23_wncb-64]/bikeW[dec][cox_soglia-4_wci-23_wncb-64] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-23_wncb-64].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-4_wci-23_wncb-64][vid1.mpg].mpg -wci 23 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-2_wncb-4]/bikeW[dec][cox_soglia-4_wci-2_wncb-4] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-4_wci-2_wncb-4][vid1.mpg].mpg -wci 2 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].mpg ./test/bike/vid1.mpg/bikeW[dec][cox_soglia-4_wci-4_wncb-8]/bikeW[dec][cox_soglia-4_wci-4_wncb-8] -efwf_cox ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].dat ./test/bike/vid1.mpg/bikeW[cox_soglia-4_wci-4_wncb-8][vid1.mpg].mpg -wci 4 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-7].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-2_wci-1_wncb-7)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-2_wci-1_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-10_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-2_wci-10_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-2_wncb-13].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-2_wci-2_wncb-13)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-2_wci-3_wncb-19].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-2_wci-3_wncb-19)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-2].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-4_wci-1_wncb-2)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-4_wci-1_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-23_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-4_wci-23_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-4].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-4_wci-2_wncb-4)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid1.mpg/bikeW[enc][cox_soglia-4_wci-4_wncb-8].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid1.mpg/bikeW(cox_soglia-4_wci-4_wncb-8)(vid1.mpg)(psrn).log" -f null -	;

mkdir ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-1_wncb-21]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-3_wncb-64]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-2_wncb-41]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-3_wncb-60]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-1_wncb-21].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 1 -wncb 21	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-3_wncb-64].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 3 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-2_wncb-41].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 2 -wncb 41	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-3_wncb-60].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 3 -wncb 60	;

./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-1_wncb-21].mpg ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-1_wncb-21]/bikeW[dec][lsb_wci-1_wncb-21] -efwf_lsb ./test/bike/aud1.mp3/bikeW[lsb_wci-1_wncb-21][aud1.mp3].mp3 -wci 1 -wncb 21	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-1_wncb-64].mpg ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-1_wncb-64]/bikeW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/bike/aud1.mp3/bikeW[lsb_wci-1_wncb-64][aud1.mp3].mp3 -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-3_wncb-64].mpg ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-3_wncb-64]/bikeW[dec][lsb_wci-3_wncb-64] -efwf_lsb ./test/bike/aud1.mp3/bikeW[lsb_wci-3_wncb-64][aud1.mp3].mp3 -wci 3 -wncb 64	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-2_wncb-41].mpg ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-2_wncb-41]/bikeW[dec][lsb_wci-2_wncb-41] -efwf_lsb ./test/bike/aud1.mp3/bikeW[lsb_wci-2_wncb-41][aud1.mp3].mp3 -wci 2 -wncb 41	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-3_wncb-60].mpg ./test/bike/aud1.mp3/bikeW[dec][lsb_wci-3_wncb-60]/bikeW[dec][lsb_wci-3_wncb-60] -efwf_lsb ./test/bike/aud1.mp3/bikeW[lsb_wci-3_wncb-60][aud1.mp3].mp3 -wci 3 -wncb 60	;

./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-1_wncb-21].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(lsb_wci-1_wncb-21)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(lsb_wci-1_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-3_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(lsb_wci-3_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-2_wncb-41].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(lsb_wci-2_wncb-41)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][lsb_wci-3_wncb-60].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(lsb_wci-3_wncb-60)(aud1.mp3)(psrn).log" -f null -	;

mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-1_wncb-10]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-6_wncb-64]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-2_wncb-19]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-3_wncb-28]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-1_wncb-2]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-15_wncb-64]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-2_wncb-5]	;
mkdir ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-3_wncb-7]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-10].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-10].dat -wci 1 -wncb 10 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-6_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-6_wncb-64].dat -wci 6 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-2_wncb-19].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-2_wncb-19].dat -wci 2 -wncb 19 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-3_wncb-28].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-3_wncb-28].dat -wci 3 -wncb 28 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-2].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-2].dat -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-15_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-15_wncb-64].dat -wci 15 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-2_wncb-5].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-2_wncb-5].dat -wci 2 -wncb 5 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-3_wncb-7].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-3_wncb-7].dat -wci 3 -wncb 7 -sogliaCox 4	;

./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-10].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-1_wncb-10]/bikeW[dec][cox_soglia-2_wci-1_wncb-10] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-10].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-2_wci-1_wncb-10][aud1.mp3].mp3 -wci 1 -wncb 10 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-1_wncb-64]/bikeW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-2_wci-1_wncb-64][aud1.mp3].mp3 -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-6_wncb-64].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-6_wncb-64]/bikeW[dec][cox_soglia-2_wci-6_wncb-64] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-6_wncb-64].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-2_wci-6_wncb-64][aud1.mp3].mp3 -wci 6 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-2_wncb-19].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-2_wncb-19]/bikeW[dec][cox_soglia-2_wci-2_wncb-19] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-2_wncb-19].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-2_wci-2_wncb-19][aud1.mp3].mp3 -wci 2 -wncb 19 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-3_wncb-28].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-2_wci-3_wncb-28]/bikeW[dec][cox_soglia-2_wci-3_wncb-28] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-3_wncb-28].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-2_wci-3_wncb-28][aud1.mp3].mp3 -wci 3 -wncb 28 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-2].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-1_wncb-2]/bikeW[dec][cox_soglia-4_wci-1_wncb-2] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-2].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-4_wci-1_wncb-2][aud1.mp3].mp3 -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-1_wncb-64]/bikeW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-4_wci-1_wncb-64][aud1.mp3].mp3 -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-15_wncb-64].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-15_wncb-64]/bikeW[dec][cox_soglia-4_wci-15_wncb-64] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-15_wncb-64].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-4_wci-15_wncb-64][aud1.mp3].mp3 -wci 15 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-2_wncb-5].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-2_wncb-5]/bikeW[dec][cox_soglia-4_wci-2_wncb-5] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-2_wncb-5].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-4_wci-2_wncb-5][aud1.mp3].mp3 -wci 2 -wncb 5 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-3_wncb-7].mpg ./test/bike/aud1.mp3/bikeW[dec][cox_soglia-4_wci-3_wncb-7]/bikeW[dec][cox_soglia-4_wci-3_wncb-7] -efwf_cox ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-3_wncb-7].dat ./test/bike/aud1.mp3/bikeW[cox_soglia-4_wci-3_wncb-7][aud1.mp3].mp3 -wci 3 -wncb 7 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-10].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-2_wci-1_wncb-10)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-2_wci-1_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-6_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-2_wci-6_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-2_wncb-19].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-2_wci-2_wncb-19)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-2_wci-3_wncb-28].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-2_wci-3_wncb-28)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-2].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-4_wci-1_wncb-2)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-4_wci-1_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-15_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-4_wci-15_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-2_wncb-5].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-4_wci-2_wncb-5)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/aud1.mp3/bikeW[enc][cox_soglia-4_wci-3_wncb-7].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/aud1.mp3/bikeW(cox_soglia-4_wci-3_wncb-7)(aud1.mp3)(psrn).log" -f null -	;

mkdir ./test/bike/spazio.jpg/bikeW[dec][lsb_wci-1_wncb-64]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/spazio.jpg/bikeW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/spazio.jpg -wci 1 -wncb 64	;

./mpeg.exe -d -s ./test/bike/spazio.jpg/bikeW[enc][lsb_wci-1_wncb-64].mpg ./test/bike/spazio.jpg/bikeW[dec][lsb_wci-1_wncb-64]/bikeW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/bike/spazio.jpg/bikeW[lsb_wci-1_wncb-64][spazio.jpg].jpg -wci 1 -wncb 64	;

./ffmpeg/ffmpeg.exe -i ./test/bike/spazio.jpg/bikeW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/spazio.jpg/bikeW(lsb_wci-1_wncb-64)(spazio.jpg)(psrn).log" -f null -	;

mkdir ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-23]	;
mkdir ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-2_wci-2_wncb-64]	;
mkdir ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-5]	;
mkdir ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-6_wncb-64]	;
mkdir ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-2_wncb-10]	;
mkdir ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-3_wncb-17]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-23].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-23].dat -wci 1 -wncb 23 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-64].dat -wci 2 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-5].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-5].dat -wci 1 -wncb 5 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-6_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-6_wncb-64].dat -wci 6 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-10].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-10].dat -wci 2 -wncb 10 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-3_wncb-17].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-3_wncb-17].dat -wci 3 -wncb 17 -sogliaCox 4	;

./mpeg.exe -d -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-23].mpg ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-23]/bikeW[dec][cox_soglia-2_wci-1_wncb-23] -efwf_cox ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-23].dat ./test/bike/spazio.jpg/bikeW[cox_soglia-2_wci-1_wncb-23][spazio.jpg].jpg -wci 1 -wncb 23 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]/bikeW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/bike/spazio.jpg/bikeW[cox_soglia-2_wci-1_wncb-64][spazio.jpg].jpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-64].mpg ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-2_wci-2_wncb-64]/bikeW[dec][cox_soglia-2_wci-2_wncb-64] -efwf_cox ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-64].dat ./test/bike/spazio.jpg/bikeW[cox_soglia-2_wci-2_wncb-64][spazio.jpg].jpg -wci 2 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-5].mpg ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-5]/bikeW[dec][cox_soglia-4_wci-1_wncb-5] -efwf_cox ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-5].dat ./test/bike/spazio.jpg/bikeW[cox_soglia-4_wci-1_wncb-5][spazio.jpg].jpg -wci 1 -wncb 5 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]/bikeW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/bike/spazio.jpg/bikeW[cox_soglia-4_wci-1_wncb-64][spazio.jpg].jpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-6_wncb-64].mpg ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-6_wncb-64]/bikeW[dec][cox_soglia-4_wci-6_wncb-64] -efwf_cox ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-6_wncb-64].dat ./test/bike/spazio.jpg/bikeW[cox_soglia-4_wci-6_wncb-64][spazio.jpg].jpg -wci 6 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-10].mpg ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-2_wncb-10]/bikeW[dec][cox_soglia-4_wci-2_wncb-10] -efwf_cox ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-10].dat ./test/bike/spazio.jpg/bikeW[cox_soglia-4_wci-2_wncb-10][spazio.jpg].jpg -wci 2 -wncb 10 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-3_wncb-17].mpg ./test/bike/spazio.jpg/bikeW[dec][cox_soglia-4_wci-3_wncb-17]/bikeW[dec][cox_soglia-4_wci-3_wncb-17] -efwf_cox ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-3_wncb-17].dat ./test/bike/spazio.jpg/bikeW[cox_soglia-4_wci-3_wncb-17][spazio.jpg].jpg -wci 3 -wncb 17 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-23].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/spazio.jpg/bikeW(cox_soglia-2_wci-1_wncb-23)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/spazio.jpg/bikeW(cox_soglia-2_wci-1_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-2_wci-2_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/spazio.jpg/bikeW(cox_soglia-2_wci-2_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-5].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/spazio.jpg/bikeW(cox_soglia-4_wci-1_wncb-5)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/spazio.jpg/bikeW(cox_soglia-4_wci-1_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-6_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/spazio.jpg/bikeW(cox_soglia-4_wci-6_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-2_wncb-10].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/spazio.jpg/bikeW(cox_soglia-4_wci-2_wncb-10)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/spazio.jpg/bikeW[enc][cox_soglia-4_wci-3_wncb-17].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/spazio.jpg/bikeW(cox_soglia-4_wci-3_wncb-17)(spazio.jpg)(psrn).log" -f null -	;

mkdir ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-2_wci-1_wncb-34]	;
mkdir ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-4_wci-1_wncb-7]	;
mkdir ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-4_wci-5_wncb-64]	;
mkdir ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-4_wci-2_wncb-16]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-34].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-34].dat -wci 1 -wncb 34 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-7].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-7].dat -wci 1 -wncb 7 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-5_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-5_wncb-64].dat -wci 5 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/bike/bike -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-16].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-16].dat -wci 2 -wncb 16 -sogliaCox 4	;

./mpeg.exe -d -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-34].mpg ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-2_wci-1_wncb-34]/bikeW[dec][cox_soglia-2_wci-1_wncb-34] -efwf_cox ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-34].dat ./test/bike/vid2.mpg/bikeW[cox_soglia-2_wci-1_wncb-34][vid2.mpg].mpg -wci 1 -wncb 34 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-2_wci-1_wncb-64]/bikeW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/bike/vid2.mpg/bikeW[cox_soglia-2_wci-1_wncb-64][vid2.mpg].mpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-7].mpg ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-4_wci-1_wncb-7]/bikeW[dec][cox_soglia-4_wci-1_wncb-7] -efwf_cox ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-7].dat ./test/bike/vid2.mpg/bikeW[cox_soglia-4_wci-1_wncb-7][vid2.mpg].mpg -wci 1 -wncb 7 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-4_wci-1_wncb-64]/bikeW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/bike/vid2.mpg/bikeW[cox_soglia-4_wci-1_wncb-64][vid2.mpg].mpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-5_wncb-64].mpg ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-4_wci-5_wncb-64]/bikeW[dec][cox_soglia-4_wci-5_wncb-64] -efwf_cox ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-5_wncb-64].dat ./test/bike/vid2.mpg/bikeW[cox_soglia-4_wci-5_wncb-64][vid2.mpg].mpg -wci 5 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-16].mpg ./test/bike/vid2.mpg/bikeW[dec][cox_soglia-4_wci-2_wncb-16]/bikeW[dec][cox_soglia-4_wci-2_wncb-16] -efwf_cox ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-16].dat ./test/bike/vid2.mpg/bikeW[cox_soglia-4_wci-2_wncb-16][vid2.mpg].mpg -wci 2 -wncb 16 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-34].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid2.mpg/bikeW(cox_soglia-2_wci-1_wncb-34)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid2.mpg/bikeW(cox_soglia-2_wci-1_wncb-64)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-7].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid2.mpg/bikeW(cox_soglia-4_wci-1_wncb-7)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid2.mpg/bikeW(cox_soglia-4_wci-1_wncb-64)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-5_wncb-64].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid2.mpg/bikeW(cox_soglia-4_wci-5_wncb-64)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/bike/vid2.mpg/bikeW[enc][cox_soglia-4_wci-2_wncb-16].mpg -i ./testSet/compressed/bike.mpg -lavfi psnr="stats_file=./test/bike/vid2.mpg/bikeW(cox_soglia-4_wci-2_wncb-16)(vid2.mpg)(psrn).log" -f null -	;

mkdir ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-1_wncb-1]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-5044_wncb-64]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-525_wncb-8]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-1074_wncb-16]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-1_wncb-1].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 1 -wncb 1	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-5044_wncb-64].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 5044 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-525_wncb-8].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 525 -wncb 8	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-1074_wncb-16].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 1074 -wncb 16	;

./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-1_wncb-1].mpg ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-1_wncb-1]/flowgW[dec][lsb_wci-1_wncb-1] -efwf_lsb ./test/flowg/divCom.txt/flowgW[lsb_wci-1_wncb-1][divCom.txt].txt -wci 1 -wncb 1	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-1_wncb-64].mpg ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-1_wncb-64]/flowgW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/flowg/divCom.txt/flowgW[lsb_wci-1_wncb-64][divCom.txt].txt -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-5044_wncb-64].mpg ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-5044_wncb-64]/flowgW[dec][lsb_wci-5044_wncb-64] -efwf_lsb ./test/flowg/divCom.txt/flowgW[lsb_wci-5044_wncb-64][divCom.txt].txt -wci 5044 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-525_wncb-8].mpg ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-525_wncb-8]/flowgW[dec][lsb_wci-525_wncb-8] -efwf_lsb ./test/flowg/divCom.txt/flowgW[lsb_wci-525_wncb-8][divCom.txt].txt -wci 525 -wncb 8	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-1074_wncb-16].mpg ./test/flowg/divCom.txt/flowgW[dec][lsb_wci-1074_wncb-16]/flowgW[dec][lsb_wci-1074_wncb-16] -efwf_lsb ./test/flowg/divCom.txt/flowgW[lsb_wci-1074_wncb-16][divCom.txt].txt -wci 1074 -wncb 16	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-1_wncb-1].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(lsb_wci-1_wncb-1)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(lsb_wci-1_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-5044_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(lsb_wci-5044_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-525_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(lsb_wci-525_wncb-8)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][lsb_wci-1074_wncb-16].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(lsb_wci-1074_wncb-16)(divCom.txt)(psrn).log" -f null -	;

mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-1_wncb-1]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-8523_wncb-64]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-525_wncb-4]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-1074_wncb-8]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-1_wncb-1]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-17425_wncb-64]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-1074_wncb-4]	;
mkdir ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-2144_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-8523_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-8523_wncb-64].dat -wci 8523 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-525_wncb-4].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-525_wncb-4].dat -wci 525 -wncb 4 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1074_wncb-8].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1074_wncb-8].dat -wci 1074 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-17425_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-17425_wncb-64].dat -wci 17425 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1074_wncb-4].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1074_wncb-4].dat -wci 1074 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-2144_wncb-8].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-2144_wncb-8].dat -wci 2144 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-1].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-1_wncb-1]/flowgW[dec][cox_soglia-2_wci-1_wncb-1] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-1].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-2_wci-1_wncb-1][divCom.txt].txt -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-1_wncb-64]/flowgW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-2_wci-1_wncb-64][divCom.txt].txt -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-8523_wncb-64].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-8523_wncb-64]/flowgW[dec][cox_soglia-2_wci-8523_wncb-64] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-8523_wncb-64].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-2_wci-8523_wncb-64][divCom.txt].txt -wci 8523 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-525_wncb-4].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-525_wncb-4]/flowgW[dec][cox_soglia-2_wci-525_wncb-4] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-525_wncb-4].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-2_wci-525_wncb-4][divCom.txt].txt -wci 525 -wncb 4 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1074_wncb-8].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-2_wci-1074_wncb-8]/flowgW[dec][cox_soglia-2_wci-1074_wncb-8] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1074_wncb-8].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-2_wci-1074_wncb-8][divCom.txt].txt -wci 1074 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-1].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-1_wncb-1]/flowgW[dec][cox_soglia-4_wci-1_wncb-1] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-1].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-4_wci-1_wncb-1][divCom.txt].txt -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-1_wncb-64]/flowgW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-4_wci-1_wncb-64][divCom.txt].txt -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-17425_wncb-64].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-17425_wncb-64]/flowgW[dec][cox_soglia-4_wci-17425_wncb-64] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-17425_wncb-64].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-4_wci-17425_wncb-64][divCom.txt].txt -wci 17425 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1074_wncb-4].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-1074_wncb-4]/flowgW[dec][cox_soglia-4_wci-1074_wncb-4] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1074_wncb-4].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-4_wci-1074_wncb-4][divCom.txt].txt -wci 1074 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-2144_wncb-8].mpg ./test/flowg/divCom.txt/flowgW[dec][cox_soglia-4_wci-2144_wncb-8]/flowgW[dec][cox_soglia-4_wci-2144_wncb-8] -efwf_cox ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-2144_wncb-8].dat ./test/flowg/divCom.txt/flowgW[cox_soglia-4_wci-2144_wncb-8][divCom.txt].txt -wci 2144 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-1].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-2_wci-1_wncb-1)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-2_wci-1_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-8523_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-2_wci-8523_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-525_wncb-4].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-2_wci-525_wncb-4)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-2_wci-1074_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-2_wci-1074_wncb-8)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-1].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-4_wci-1_wncb-1)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-4_wci-1_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-17425_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-4_wci-17425_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-1074_wncb-4].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-4_wci-1074_wncb-4)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/divCom.txt/flowgW[enc][cox_soglia-4_wci-2144_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/divCom.txt/flowgW(cox_soglia-4_wci-2144_wncb-8)(divCom.txt)(psrn).log" -f null -	;

mkdir ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-1_wncb-2]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-54_wncb-64]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-6_wncb-8]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-13_wncb-16]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-1_wncb-2].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 1 -wncb 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-54_wncb-64].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 54 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-6_wncb-8].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 6 -wncb 8	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-13_wncb-16].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 13 -wncb 16	;

./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-1_wncb-2].mpg ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-1_wncb-2]/flowgW[dec][lsb_wci-1_wncb-2] -efwf_lsb ./test/flowg/stewie.gif/flowgW[lsb_wci-1_wncb-2][stewie.gif].gif -wci 1 -wncb 2	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-1_wncb-64].mpg ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-1_wncb-64]/flowgW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/flowg/stewie.gif/flowgW[lsb_wci-1_wncb-64][stewie.gif].gif -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-54_wncb-64].mpg ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-54_wncb-64]/flowgW[dec][lsb_wci-54_wncb-64] -efwf_lsb ./test/flowg/stewie.gif/flowgW[lsb_wci-54_wncb-64][stewie.gif].gif -wci 54 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-6_wncb-8].mpg ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-6_wncb-8]/flowgW[dec][lsb_wci-6_wncb-8] -efwf_lsb ./test/flowg/stewie.gif/flowgW[lsb_wci-6_wncb-8][stewie.gif].gif -wci 6 -wncb 8	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-13_wncb-16].mpg ./test/flowg/stewie.gif/flowgW[dec][lsb_wci-13_wncb-16]/flowgW[dec][lsb_wci-13_wncb-16] -efwf_lsb ./test/flowg/stewie.gif/flowgW[lsb_wci-13_wncb-16][stewie.gif].gif -wci 13 -wncb 16	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-1_wncb-2].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(lsb_wci-1_wncb-2)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(lsb_wci-1_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-54_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(lsb_wci-54_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-6_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(lsb_wci-6_wncb-8)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][lsb_wci-13_wncb-16].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(lsb_wci-13_wncb-16)(stewie.gif)(psrn).log" -f null -	;

mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-1_wncb-1]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-109_wncb-64]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-6_wncb-4]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-13_wncb-8]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-1_wncb-1]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-219_wncb-64]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-13_wncb-4]	;
mkdir ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-27_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-109_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-109_wncb-64].dat -wci 109 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-6_wncb-4].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-6_wncb-4].dat -wci 6 -wncb 4 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-13_wncb-8].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-13_wncb-8].dat -wci 13 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-219_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-219_wncb-64].dat -wci 219 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-13_wncb-4].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-13_wncb-4].dat -wci 13 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-27_wncb-8].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-27_wncb-8].dat -wci 27 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-1].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-1_wncb-1]/flowgW[dec][cox_soglia-2_wci-1_wncb-1] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-1].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-2_wci-1_wncb-1][stewie.gif].gif -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-1_wncb-64]/flowgW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-2_wci-1_wncb-64][stewie.gif].gif -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-109_wncb-64].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-109_wncb-64]/flowgW[dec][cox_soglia-2_wci-109_wncb-64] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-109_wncb-64].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-2_wci-109_wncb-64][stewie.gif].gif -wci 109 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-6_wncb-4].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-6_wncb-4]/flowgW[dec][cox_soglia-2_wci-6_wncb-4] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-6_wncb-4].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-2_wci-6_wncb-4][stewie.gif].gif -wci 6 -wncb 4 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-13_wncb-8].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-2_wci-13_wncb-8]/flowgW[dec][cox_soglia-2_wci-13_wncb-8] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-13_wncb-8].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-2_wci-13_wncb-8][stewie.gif].gif -wci 13 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-1].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-1_wncb-1]/flowgW[dec][cox_soglia-4_wci-1_wncb-1] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-1].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-4_wci-1_wncb-1][stewie.gif].gif -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-1_wncb-64]/flowgW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-4_wci-1_wncb-64][stewie.gif].gif -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-219_wncb-64].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-219_wncb-64]/flowgW[dec][cox_soglia-4_wci-219_wncb-64] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-219_wncb-64].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-4_wci-219_wncb-64][stewie.gif].gif -wci 219 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-13_wncb-4].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-13_wncb-4]/flowgW[dec][cox_soglia-4_wci-13_wncb-4] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-13_wncb-4].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-4_wci-13_wncb-4][stewie.gif].gif -wci 13 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-27_wncb-8].mpg ./test/flowg/stewie.gif/flowgW[dec][cox_soglia-4_wci-27_wncb-8]/flowgW[dec][cox_soglia-4_wci-27_wncb-8] -efwf_cox ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-27_wncb-8].dat ./test/flowg/stewie.gif/flowgW[cox_soglia-4_wci-27_wncb-8][stewie.gif].gif -wci 27 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-1].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-2_wci-1_wncb-1)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-2_wci-1_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-109_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-2_wci-109_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-6_wncb-4].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-2_wci-6_wncb-4)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-2_wci-13_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-2_wci-13_wncb-8)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-1].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-4_wci-1_wncb-1)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-4_wci-1_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-219_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-4_wci-219_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-13_wncb-4].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-4_wci-13_wncb-4)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/stewie.gif/flowgW[enc][cox_soglia-4_wci-27_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/stewie.gif/flowgW(cox_soglia-4_wci-27_wncb-8)(stewie.gif)(psrn).log" -f null -	;

mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-1_wncb-6]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-12_wncb-64]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-3_wncb-16]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-6_wncb-32]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-1_wncb-6].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 1 -wncb 6	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-12_wncb-64].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 12 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-3_wncb-16].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 3 -wncb 16	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-6_wncb-32].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 6 -wncb 32	;

./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-1_wncb-6].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-1_wncb-6]/flowgW[dec][lsb_wci-1_wncb-6] -efwf_lsb ./test/flowg/tajMahal.jpg/flowgW[lsb_wci-1_wncb-6][tajMahal.jpg].jpg -wci 1 -wncb 6	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-1_wncb-64].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-1_wncb-64]/flowgW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/flowg/tajMahal.jpg/flowgW[lsb_wci-1_wncb-64][tajMahal.jpg].jpg -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-12_wncb-64].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-12_wncb-64]/flowgW[dec][lsb_wci-12_wncb-64] -efwf_lsb ./test/flowg/tajMahal.jpg/flowgW[lsb_wci-12_wncb-64][tajMahal.jpg].jpg -wci 12 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-3_wncb-16].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-3_wncb-16]/flowgW[dec][lsb_wci-3_wncb-16] -efwf_lsb ./test/flowg/tajMahal.jpg/flowgW[lsb_wci-3_wncb-16][tajMahal.jpg].jpg -wci 3 -wncb 16	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-6_wncb-32].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][lsb_wci-6_wncb-32]/flowgW[dec][lsb_wci-6_wncb-32] -efwf_lsb ./test/flowg/tajMahal.jpg/flowgW[lsb_wci-6_wncb-32][tajMahal.jpg].jpg -wci 6 -wncb 32	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-1_wncb-6].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(lsb_wci-1_wncb-6)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(lsb_wci-1_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-12_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(lsb_wci-12_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-3_wncb-16].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(lsb_wci-3_wncb-16)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][lsb_wci-6_wncb-32].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(lsb_wci-6_wncb-32)(tajMahal.jpg)(psrn).log" -f null -	;

mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-3]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-25_wncb-64]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-4]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-3_wncb-8]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-2]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-51_wncb-64]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-3_wncb-4]	;
mkdir ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-6_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-3].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-3].dat -wci 1 -wncb 3 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-25_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-25_wncb-64].dat -wci 25 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-4].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-4].dat -wci 1 -wncb 4 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-8].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-8].dat -wci 3 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].dat -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-51_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-51_wncb-64].dat -wci 51 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-4].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-4].dat -wci 3 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-6_wncb-8].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-6_wncb-8].dat -wci 6 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-3].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-3]/flowgW[dec][cox_soglia-2_wci-1_wncb-3] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-3].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-2_wci-1_wncb-3][tajMahal.jpg].jpg -wci 1 -wncb 3 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]/flowgW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-2_wci-1_wncb-64][tajMahal.jpg].jpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-25_wncb-64].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-25_wncb-64]/flowgW[dec][cox_soglia-2_wci-25_wncb-64] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-25_wncb-64].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-2_wci-25_wncb-64][tajMahal.jpg].jpg -wci 25 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-4].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-4]/flowgW[dec][cox_soglia-2_wci-1_wncb-4] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-4].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-2_wci-1_wncb-4][tajMahal.jpg].jpg -wci 1 -wncb 4 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-8].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-2_wci-3_wncb-8]/flowgW[dec][cox_soglia-2_wci-3_wncb-8] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-8].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-2_wci-3_wncb-8][tajMahal.jpg].jpg -wci 3 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-2]/flowgW[dec][cox_soglia-4_wci-1_wncb-2] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-4_wci-1_wncb-2][tajMahal.jpg].jpg -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]/flowgW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-4_wci-1_wncb-64][tajMahal.jpg].jpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-51_wncb-64].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-51_wncb-64]/flowgW[dec][cox_soglia-4_wci-51_wncb-64] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-51_wncb-64].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-4_wci-51_wncb-64][tajMahal.jpg].jpg -wci 51 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-4].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-3_wncb-4]/flowgW[dec][cox_soglia-4_wci-3_wncb-4] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-4].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-4_wci-3_wncb-4][tajMahal.jpg].jpg -wci 3 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-6_wncb-8].mpg ./test/flowg/tajMahal.jpg/flowgW[dec][cox_soglia-4_wci-6_wncb-8]/flowgW[dec][cox_soglia-4_wci-6_wncb-8] -efwf_cox ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-6_wncb-8].dat ./test/flowg/tajMahal.jpg/flowgW[cox_soglia-4_wci-6_wncb-8][tajMahal.jpg].jpg -wci 6 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-3].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-2_wci-1_wncb-3)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-2_wci-1_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-25_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-2_wci-25_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-4].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-2_wci-1_wncb-4)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-2_wci-3_wncb-8)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-4_wci-1_wncb-2)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-4_wci-1_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-51_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-4_wci-51_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-4].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-4_wci-3_wncb-4)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/tajMahal.jpg/flowgW[enc][cox_soglia-4_wci-6_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/tajMahal.jpg/flowgW(cox_soglia-4_wci-6_wncb-8)(tajMahal.jpg)(psrn).log" -f null -	;

mkdir ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-1_wncb-10]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-7_wncb-64]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-2_wncb-24]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-3_wncb-32]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-1_wncb-10].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 1 -wncb 10	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-7_wncb-64].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 7 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-2_wncb-24].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 2 -wncb 24	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-3_wncb-32].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 3 -wncb 32	;

./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-1_wncb-10].mpg ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-1_wncb-10]/flowgW[dec][lsb_wci-1_wncb-10] -efwf_lsb ./test/flowg/pinguini.jpg/flowgW[lsb_wci-1_wncb-10][pinguini.jpg].jpg -wci 1 -wncb 10	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-1_wncb-64].mpg ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-1_wncb-64]/flowgW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/flowg/pinguini.jpg/flowgW[lsb_wci-1_wncb-64][pinguini.jpg].jpg -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-7_wncb-64].mpg ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-7_wncb-64]/flowgW[dec][lsb_wci-7_wncb-64] -efwf_lsb ./test/flowg/pinguini.jpg/flowgW[lsb_wci-7_wncb-64][pinguini.jpg].jpg -wci 7 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-2_wncb-24].mpg ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-2_wncb-24]/flowgW[dec][lsb_wci-2_wncb-24] -efwf_lsb ./test/flowg/pinguini.jpg/flowgW[lsb_wci-2_wncb-24][pinguini.jpg].jpg -wci 2 -wncb 24	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-3_wncb-32].mpg ./test/flowg/pinguini.jpg/flowgW[dec][lsb_wci-3_wncb-32]/flowgW[dec][lsb_wci-3_wncb-32] -efwf_lsb ./test/flowg/pinguini.jpg/flowgW[lsb_wci-3_wncb-32][pinguini.jpg].jpg -wci 3 -wncb 32	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-1_wncb-10].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(lsb_wci-1_wncb-10)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(lsb_wci-1_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-7_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(lsb_wci-7_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-2_wncb-24].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(lsb_wci-2_wncb-24)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][lsb_wci-3_wncb-32].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(lsb_wci-3_wncb-32)(pinguini.jpg)(psrn).log" -f null -	;

mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-5]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-14_wncb-64]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-2_wncb-10]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-3_wncb-14]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-2]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-29_wncb-64]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-2_wncb-4]	;
mkdir ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-4_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-5].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-5].dat -wci 1 -wncb 5 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-14_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-14_wncb-64].dat -wci 14 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-10].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-10].dat -wci 2 -wncb 10 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-14].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-14].dat -wci 3 -wncb 14 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].dat -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-29_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-29_wncb-64].dat -wci 29 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-4].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-4].dat -wci 2 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-4_wncb-8].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-4_wncb-8].dat -wci 4 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-5].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-5]/flowgW[dec][cox_soglia-2_wci-1_wncb-5] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-5].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-2_wci-1_wncb-5][pinguini.jpg].jpg -wci 1 -wncb 5 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]/flowgW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-2_wci-1_wncb-64][pinguini.jpg].jpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-14_wncb-64].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-14_wncb-64]/flowgW[dec][cox_soglia-2_wci-14_wncb-64] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-14_wncb-64].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-2_wci-14_wncb-64][pinguini.jpg].jpg -wci 14 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-10].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-2_wncb-10]/flowgW[dec][cox_soglia-2_wci-2_wncb-10] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-10].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-2_wci-2_wncb-10][pinguini.jpg].jpg -wci 2 -wncb 10 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-14].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-2_wci-3_wncb-14]/flowgW[dec][cox_soglia-2_wci-3_wncb-14] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-14].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-2_wci-3_wncb-14][pinguini.jpg].jpg -wci 3 -wncb 14 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-2]/flowgW[dec][cox_soglia-4_wci-1_wncb-2] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-4_wci-1_wncb-2][pinguini.jpg].jpg -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]/flowgW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-4_wci-1_wncb-64][pinguini.jpg].jpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-29_wncb-64].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-29_wncb-64]/flowgW[dec][cox_soglia-4_wci-29_wncb-64] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-29_wncb-64].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-4_wci-29_wncb-64][pinguini.jpg].jpg -wci 29 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-4].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-2_wncb-4]/flowgW[dec][cox_soglia-4_wci-2_wncb-4] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-4].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-4_wci-2_wncb-4][pinguini.jpg].jpg -wci 2 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-4_wncb-8].mpg ./test/flowg/pinguini.jpg/flowgW[dec][cox_soglia-4_wci-4_wncb-8]/flowgW[dec][cox_soglia-4_wci-4_wncb-8] -efwf_cox ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-4_wncb-8].dat ./test/flowg/pinguini.jpg/flowgW[cox_soglia-4_wci-4_wncb-8][pinguini.jpg].jpg -wci 4 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-5].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-2_wci-1_wncb-5)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-2_wci-1_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-14_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-2_wci-14_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-10].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-2_wci-2_wncb-10)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-2_wci-3_wncb-14].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-2_wci-3_wncb-14)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-4_wci-1_wncb-2)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-4_wci-1_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-29_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-4_wci-29_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-4].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-4_wci-2_wncb-4)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/pinguini.jpg/flowgW[enc][cox_soglia-4_wci-4_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/pinguini.jpg/flowgW(cox_soglia-4_wci-4_wncb-8)(pinguini.jpg)(psrn).log" -f null -	;

mkdir ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-1_wncb-13]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-5_wncb-64]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-2_wncb-32]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-3_wncb-40]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-1_wncb-13].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 1 -wncb 13	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-5_wncb-64].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 5 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-2_wncb-32].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 2 -wncb 32	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-3_wncb-40].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 3 -wncb 40	;

./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-1_wncb-13].mpg ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-1_wncb-13]/flowgW[dec][lsb_wci-1_wncb-13] -efwf_lsb ./test/flowg/vid1.mpg/flowgW[lsb_wci-1_wncb-13][vid1.mpg].mpg -wci 1 -wncb 13	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-1_wncb-64].mpg ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-1_wncb-64]/flowgW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/flowg/vid1.mpg/flowgW[lsb_wci-1_wncb-64][vid1.mpg].mpg -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-5_wncb-64].mpg ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-5_wncb-64]/flowgW[dec][lsb_wci-5_wncb-64] -efwf_lsb ./test/flowg/vid1.mpg/flowgW[lsb_wci-5_wncb-64][vid1.mpg].mpg -wci 5 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-2_wncb-32].mpg ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-2_wncb-32]/flowgW[dec][lsb_wci-2_wncb-32] -efwf_lsb ./test/flowg/vid1.mpg/flowgW[lsb_wci-2_wncb-32][vid1.mpg].mpg -wci 2 -wncb 32	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-3_wncb-40].mpg ./test/flowg/vid1.mpg/flowgW[dec][lsb_wci-3_wncb-40]/flowgW[dec][lsb_wci-3_wncb-40] -efwf_lsb ./test/flowg/vid1.mpg/flowgW[lsb_wci-3_wncb-40][vid1.mpg].mpg -wci 3 -wncb 40	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-1_wncb-13].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(lsb_wci-1_wncb-13)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(lsb_wci-1_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-5_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(lsb_wci-5_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-2_wncb-32].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(lsb_wci-2_wncb-32)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][lsb_wci-3_wncb-40].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(lsb_wci-3_wncb-40)(vid1.mpg)(psrn).log" -f null -	;

mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-1_wncb-7]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-10_wncb-64]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-2_wncb-13]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-3_wncb-19]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-1_wncb-2]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-22_wncb-64]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-2_wncb-5]	;
mkdir ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-4_wncb-10]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-7].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-7].dat -wci 1 -wncb 7 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-10_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-10_wncb-64].dat -wci 10 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-2_wncb-13].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-2_wncb-13].dat -wci 2 -wncb 13 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-3_wncb-19].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-3_wncb-19].dat -wci 3 -wncb 19 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].dat -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-22_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-22_wncb-64].dat -wci 22 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-5].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-5].dat -wci 2 -wncb 5 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-4_wncb-10].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-4_wncb-10].dat -wci 4 -wncb 10 -sogliaCox 4	;

./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-7].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-1_wncb-7]/flowgW[dec][cox_soglia-2_wci-1_wncb-7] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-7].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-2_wci-1_wncb-7][vid1.mpg].mpg -wci 1 -wncb 7 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]/flowgW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-2_wci-1_wncb-64][vid1.mpg].mpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-10_wncb-64].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-10_wncb-64]/flowgW[dec][cox_soglia-2_wci-10_wncb-64] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-10_wncb-64].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-2_wci-10_wncb-64][vid1.mpg].mpg -wci 10 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-2_wncb-13].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-2_wncb-13]/flowgW[dec][cox_soglia-2_wci-2_wncb-13] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-2_wncb-13].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-2_wci-2_wncb-13][vid1.mpg].mpg -wci 2 -wncb 13 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-3_wncb-19].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-2_wci-3_wncb-19]/flowgW[dec][cox_soglia-2_wci-3_wncb-19] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-3_wncb-19].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-2_wci-3_wncb-19][vid1.mpg].mpg -wci 3 -wncb 19 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-1_wncb-2]/flowgW[dec][cox_soglia-4_wci-1_wncb-2] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-4_wci-1_wncb-2][vid1.mpg].mpg -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]/flowgW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-4_wci-1_wncb-64][vid1.mpg].mpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-22_wncb-64].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-22_wncb-64]/flowgW[dec][cox_soglia-4_wci-22_wncb-64] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-22_wncb-64].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-4_wci-22_wncb-64][vid1.mpg].mpg -wci 22 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-5].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-2_wncb-5]/flowgW[dec][cox_soglia-4_wci-2_wncb-5] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-5].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-4_wci-2_wncb-5][vid1.mpg].mpg -wci 2 -wncb 5 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-4_wncb-10].mpg ./test/flowg/vid1.mpg/flowgW[dec][cox_soglia-4_wci-4_wncb-10]/flowgW[dec][cox_soglia-4_wci-4_wncb-10] -efwf_cox ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-4_wncb-10].dat ./test/flowg/vid1.mpg/flowgW[cox_soglia-4_wci-4_wncb-10][vid1.mpg].mpg -wci 4 -wncb 10 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-7].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-2_wci-1_wncb-7)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-2_wci-1_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-10_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-2_wci-10_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-2_wncb-13].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-2_wci-2_wncb-13)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-2_wci-3_wncb-19].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-2_wci-3_wncb-19)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-2].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-4_wci-1_wncb-2)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-4_wci-1_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-22_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-4_wci-22_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-5].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-4_wci-2_wncb-5)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid1.mpg/flowgW[enc][cox_soglia-4_wci-4_wncb-10].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid1.mpg/flowgW(cox_soglia-4_wci-4_wncb-10)(vid1.mpg)(psrn).log" -f null -	;

mkdir ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-1_wncb-20]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-3_wncb-64]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-2_wncb-40]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-3_wncb-59]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-1_wncb-20].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 1 -wncb 20	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-3_wncb-64].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 3 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-2_wncb-40].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 2 -wncb 40	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-3_wncb-59].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 3 -wncb 59	;

./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-1_wncb-20].mpg ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-1_wncb-20]/flowgW[dec][lsb_wci-1_wncb-20] -efwf_lsb ./test/flowg/aud1.mp3/flowgW[lsb_wci-1_wncb-20][aud1.mp3].mp3 -wci 1 -wncb 20	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-1_wncb-64].mpg ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-1_wncb-64]/flowgW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/flowg/aud1.mp3/flowgW[lsb_wci-1_wncb-64][aud1.mp3].mp3 -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-3_wncb-64].mpg ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-3_wncb-64]/flowgW[dec][lsb_wci-3_wncb-64] -efwf_lsb ./test/flowg/aud1.mp3/flowgW[lsb_wci-3_wncb-64][aud1.mp3].mp3 -wci 3 -wncb 64	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-2_wncb-40].mpg ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-2_wncb-40]/flowgW[dec][lsb_wci-2_wncb-40] -efwf_lsb ./test/flowg/aud1.mp3/flowgW[lsb_wci-2_wncb-40][aud1.mp3].mp3 -wci 2 -wncb 40	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-3_wncb-59].mpg ./test/flowg/aud1.mp3/flowgW[dec][lsb_wci-3_wncb-59]/flowgW[dec][lsb_wci-3_wncb-59] -efwf_lsb ./test/flowg/aud1.mp3/flowgW[lsb_wci-3_wncb-59][aud1.mp3].mp3 -wci 3 -wncb 59	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-1_wncb-20].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(lsb_wci-1_wncb-20)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(lsb_wci-1_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-3_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(lsb_wci-3_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-2_wncb-40].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(lsb_wci-2_wncb-40)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][lsb_wci-3_wncb-59].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(lsb_wci-3_wncb-59)(aud1.mp3)(psrn).log" -f null -	;

mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-1_wncb-10]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-6_wncb-64]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-2_wncb-19]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-3_wncb-29]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-1_wncb-3]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-14_wncb-64]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-2_wncb-7]	;
mkdir ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-3_wncb-11]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-10].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-10].dat -wci 1 -wncb 10 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-6_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-6_wncb-64].dat -wci 6 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-2_wncb-19].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-2_wncb-19].dat -wci 2 -wncb 19 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-3_wncb-29].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-3_wncb-29].dat -wci 3 -wncb 29 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-3].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-3].dat -wci 1 -wncb 3 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-14_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-14_wncb-64].dat -wci 14 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-2_wncb-7].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-2_wncb-7].dat -wci 2 -wncb 7 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-3_wncb-11].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-3_wncb-11].dat -wci 3 -wncb 11 -sogliaCox 4	;

./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-10].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-1_wncb-10]/flowgW[dec][cox_soglia-2_wci-1_wncb-10] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-10].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-2_wci-1_wncb-10][aud1.mp3].mp3 -wci 1 -wncb 10 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-1_wncb-64]/flowgW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-2_wci-1_wncb-64][aud1.mp3].mp3 -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-6_wncb-64].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-6_wncb-64]/flowgW[dec][cox_soglia-2_wci-6_wncb-64] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-6_wncb-64].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-2_wci-6_wncb-64][aud1.mp3].mp3 -wci 6 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-2_wncb-19].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-2_wncb-19]/flowgW[dec][cox_soglia-2_wci-2_wncb-19] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-2_wncb-19].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-2_wci-2_wncb-19][aud1.mp3].mp3 -wci 2 -wncb 19 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-3_wncb-29].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-2_wci-3_wncb-29]/flowgW[dec][cox_soglia-2_wci-3_wncb-29] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-3_wncb-29].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-2_wci-3_wncb-29][aud1.mp3].mp3 -wci 3 -wncb 29 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-3].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-1_wncb-3]/flowgW[dec][cox_soglia-4_wci-1_wncb-3] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-3].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-4_wci-1_wncb-3][aud1.mp3].mp3 -wci 1 -wncb 3 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-1_wncb-64]/flowgW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-4_wci-1_wncb-64][aud1.mp3].mp3 -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-14_wncb-64].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-14_wncb-64]/flowgW[dec][cox_soglia-4_wci-14_wncb-64] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-14_wncb-64].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-4_wci-14_wncb-64][aud1.mp3].mp3 -wci 14 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-2_wncb-7].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-2_wncb-7]/flowgW[dec][cox_soglia-4_wci-2_wncb-7] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-2_wncb-7].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-4_wci-2_wncb-7][aud1.mp3].mp3 -wci 2 -wncb 7 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-3_wncb-11].mpg ./test/flowg/aud1.mp3/flowgW[dec][cox_soglia-4_wci-3_wncb-11]/flowgW[dec][cox_soglia-4_wci-3_wncb-11] -efwf_cox ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-3_wncb-11].dat ./test/flowg/aud1.mp3/flowgW[cox_soglia-4_wci-3_wncb-11][aud1.mp3].mp3 -wci 3 -wncb 11 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-10].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-2_wci-1_wncb-10)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-2_wci-1_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-6_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-2_wci-6_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-2_wncb-19].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-2_wci-2_wncb-19)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-2_wci-3_wncb-29].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-2_wci-3_wncb-29)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-3].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-4_wci-1_wncb-3)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-4_wci-1_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-14_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-4_wci-14_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-2_wncb-7].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-4_wci-2_wncb-7)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/aud1.mp3/flowgW[enc][cox_soglia-4_wci-3_wncb-11].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/aud1.mp3/flowgW(cox_soglia-4_wci-3_wncb-11)(aud1.mp3)(psrn).log" -f null -	;

mkdir ./test/flowg/spazio.jpg/flowgW[dec][lsb_wci-1_wncb-64]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/spazio.jpg/flowgW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/spazio.jpg -wci 1 -wncb 64	;

./mpeg.exe -d -s ./test/flowg/spazio.jpg/flowgW[enc][lsb_wci-1_wncb-64].mpg ./test/flowg/spazio.jpg/flowgW[dec][lsb_wci-1_wncb-64]/flowgW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/flowg/spazio.jpg/flowgW[lsb_wci-1_wncb-64][spazio.jpg].jpg -wci 1 -wncb 64	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/spazio.jpg/flowgW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/spazio.jpg/flowgW(lsb_wci-1_wncb-64)(spazio.jpg)(psrn).log" -f null -	;

mkdir ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-27]	;
mkdir ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-2_wci-2_wncb-64]	;
mkdir ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-8]	;
mkdir ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-5_wncb-64]	;
mkdir ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-2_wncb-18]	;
mkdir ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-3_wncb-30]	;


./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-27].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-27].dat -wci 1 -wncb 27 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-64].dat -wci 2 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-8].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-8].dat -wci 1 -wncb 8 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-5_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-5_wncb-64].dat -wci 5 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-18].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-18].dat -wci 2 -wncb 18 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-30].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-30].dat -wci 3 -wncb 30 -sogliaCox 4	;

./mpeg.exe -d -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-27].mpg ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-27]/flowgW[dec][cox_soglia-2_wci-1_wncb-27] -efwf_cox ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-27].dat ./test/flowg/spazio.jpg/flowgW[cox_soglia-2_wci-1_wncb-27][spazio.jpg].jpg -wci 1 -wncb 27 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]/flowgW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/flowg/spazio.jpg/flowgW[cox_soglia-2_wci-1_wncb-64][spazio.jpg].jpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-64].mpg ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-2_wci-2_wncb-64]/flowgW[dec][cox_soglia-2_wci-2_wncb-64] -efwf_cox ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-64].dat ./test/flowg/spazio.jpg/flowgW[cox_soglia-2_wci-2_wncb-64][spazio.jpg].jpg -wci 2 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-8].mpg ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-8]/flowgW[dec][cox_soglia-4_wci-1_wncb-8] -efwf_cox ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-8].dat ./test/flowg/spazio.jpg/flowgW[cox_soglia-4_wci-1_wncb-8][spazio.jpg].jpg -wci 1 -wncb 8 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]/flowgW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/flowg/spazio.jpg/flowgW[cox_soglia-4_wci-1_wncb-64][spazio.jpg].jpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-5_wncb-64].mpg ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-5_wncb-64]/flowgW[dec][cox_soglia-4_wci-5_wncb-64] -efwf_cox ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-5_wncb-64].dat ./test/flowg/spazio.jpg/flowgW[cox_soglia-4_wci-5_wncb-64][spazio.jpg].jpg -wci 5 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-18].mpg ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-2_wncb-18]/flowgW[dec][cox_soglia-4_wci-2_wncb-18] -efwf_cox ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-18].dat ./test/flowg/spazio.jpg/flowgW[cox_soglia-4_wci-2_wncb-18][spazio.jpg].jpg -wci 2 -wncb 18 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-30].mpg ./test/flowg/spazio.jpg/flowgW[dec][cox_soglia-4_wci-3_wncb-30]/flowgW[dec][cox_soglia-4_wci-3_wncb-30] -efwf_cox ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-30].dat ./test/flowg/spazio.jpg/flowgW[cox_soglia-4_wci-3_wncb-30][spazio.jpg].jpg -wci 3 -wncb 30 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-27].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/spazio.jpg/flowgW(cox_soglia-2_wci-1_wncb-27)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/spazio.jpg/flowgW(cox_soglia-2_wci-1_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-2_wci-2_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/spazio.jpg/flowgW(cox_soglia-2_wci-2_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-8].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/spazio.jpg/flowgW(cox_soglia-4_wci-1_wncb-8)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/spazio.jpg/flowgW(cox_soglia-4_wci-1_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-5_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/spazio.jpg/flowgW(cox_soglia-4_wci-5_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-2_wncb-18].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/spazio.jpg/flowgW(cox_soglia-4_wci-2_wncb-18)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/spazio.jpg/flowgW[enc][cox_soglia-4_wci-3_wncb-30].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/spazio.jpg/flowgW(cox_soglia-4_wci-3_wncb-30)(spazio.jpg)(psrn).log" -f null -	;

mkdir ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-2_wci-1_wncb-45]	;
mkdir ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-4_wci-1_wncb-13]	;
mkdir ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-4_wci-3_wncb-64]	;
mkdir ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-4_wci-2_wncb-29]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-45].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-45].dat -wci 1 -wncb 45 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-13].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-13].dat -wci 1 -wncb 13 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-3_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-3_wncb-64].dat -wci 3 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/flowg/flowg -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-29].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-29].dat -wci 2 -wncb 29 -sogliaCox 4	;

./mpeg.exe -d -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-45].mpg ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-2_wci-1_wncb-45]/flowgW[dec][cox_soglia-2_wci-1_wncb-45] -efwf_cox ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-45].dat ./test/flowg/vid2.mpg/flowgW[cox_soglia-2_wci-1_wncb-45][vid2.mpg].mpg -wci 1 -wncb 45 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-2_wci-1_wncb-64]/flowgW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/flowg/vid2.mpg/flowgW[cox_soglia-2_wci-1_wncb-64][vid2.mpg].mpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-13].mpg ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-4_wci-1_wncb-13]/flowgW[dec][cox_soglia-4_wci-1_wncb-13] -efwf_cox ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-13].dat ./test/flowg/vid2.mpg/flowgW[cox_soglia-4_wci-1_wncb-13][vid2.mpg].mpg -wci 1 -wncb 13 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-4_wci-1_wncb-64]/flowgW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/flowg/vid2.mpg/flowgW[cox_soglia-4_wci-1_wncb-64][vid2.mpg].mpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-3_wncb-64].mpg ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-4_wci-3_wncb-64]/flowgW[dec][cox_soglia-4_wci-3_wncb-64] -efwf_cox ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-3_wncb-64].dat ./test/flowg/vid2.mpg/flowgW[cox_soglia-4_wci-3_wncb-64][vid2.mpg].mpg -wci 3 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-29].mpg ./test/flowg/vid2.mpg/flowgW[dec][cox_soglia-4_wci-2_wncb-29]/flowgW[dec][cox_soglia-4_wci-2_wncb-29] -efwf_cox ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-29].dat ./test/flowg/vid2.mpg/flowgW[cox_soglia-4_wci-2_wncb-29][vid2.mpg].mpg -wci 2 -wncb 29 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-45].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid2.mpg/flowgW(cox_soglia-2_wci-1_wncb-45)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid2.mpg/flowgW(cox_soglia-2_wci-1_wncb-64)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-13].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid2.mpg/flowgW(cox_soglia-4_wci-1_wncb-13)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid2.mpg/flowgW(cox_soglia-4_wci-1_wncb-64)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-3_wncb-64].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid2.mpg/flowgW(cox_soglia-4_wci-3_wncb-64)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/flowg/vid2.mpg/flowgW[enc][cox_soglia-4_wci-2_wncb-29].mpg -i ./testSet/compressed/flowg.mpg -lavfi psnr="stats_file=./test/flowg/vid2.mpg/flowgW(cox_soglia-4_wci-2_wncb-29)(vid2.mpg)(psrn).log" -f null -	;

mkdir ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-1_wncb-1]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-5044_wncb-64]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-550_wncb-8]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-1092_wncb-16]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-1_wncb-1].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 1 -wncb 1	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-5044_wncb-64].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 5044 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-550_wncb-8].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 550 -wncb 8	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-1092_wncb-16].mpg -ifwf_lsb ./testSet/watermark/divCom.txt -wci 1092 -wncb 16	;

./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-1_wncb-1].mpg ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-1_wncb-1]/tennisW[dec][lsb_wci-1_wncb-1] -efwf_lsb ./test/tennis/divCom.txt/tennisW[lsb_wci-1_wncb-1][divCom.txt].txt -wci 1 -wncb 1	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-1_wncb-64].mpg ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-1_wncb-64]/tennisW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/tennis/divCom.txt/tennisW[lsb_wci-1_wncb-64][divCom.txt].txt -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-5044_wncb-64].mpg ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-5044_wncb-64]/tennisW[dec][lsb_wci-5044_wncb-64] -efwf_lsb ./test/tennis/divCom.txt/tennisW[lsb_wci-5044_wncb-64][divCom.txt].txt -wci 5044 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-550_wncb-8].mpg ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-550_wncb-8]/tennisW[dec][lsb_wci-550_wncb-8] -efwf_lsb ./test/tennis/divCom.txt/tennisW[lsb_wci-550_wncb-8][divCom.txt].txt -wci 550 -wncb 8	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-1092_wncb-16].mpg ./test/tennis/divCom.txt/tennisW[dec][lsb_wci-1092_wncb-16]/tennisW[dec][lsb_wci-1092_wncb-16] -efwf_lsb ./test/tennis/divCom.txt/tennisW[lsb_wci-1092_wncb-16][divCom.txt].txt -wci 1092 -wncb 16	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-1_wncb-1].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(lsb_wci-1_wncb-1)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(lsb_wci-1_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-5044_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(lsb_wci-5044_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-550_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(lsb_wci-550_wncb-8)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][lsb_wci-1092_wncb-16].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(lsb_wci-1092_wncb-16)(divCom.txt)(psrn).log" -f null -	;

mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-1_wncb-1]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-8528_wncb-64]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-550_wncb-4]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-1092_wncb-8]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-1_wncb-1]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-17425_wncb-64]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-1078_wncb-4]	;
mkdir ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-2189_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-8528_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-8528_wncb-64].dat -wci 8528 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-550_wncb-4].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-550_wncb-4].dat -wci 550 -wncb 4 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1092_wncb-8].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1092_wncb-8].dat -wci 1092 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-17425_wncb-64].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-17425_wncb-64].dat -wci 17425 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1078_wncb-4].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1078_wncb-4].dat -wci 1078 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-2189_wncb-8].mpg -ifwf_cox ./testSet/watermark/divCom.txt -originalCoeff ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-2189_wncb-8].dat -wci 2189 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-1].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-1_wncb-1]/tennisW[dec][cox_soglia-2_wci-1_wncb-1] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-1].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-2_wci-1_wncb-1][divCom.txt].txt -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-1_wncb-64]/tennisW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-2_wci-1_wncb-64][divCom.txt].txt -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-8528_wncb-64].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-8528_wncb-64]/tennisW[dec][cox_soglia-2_wci-8528_wncb-64] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-8528_wncb-64].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-2_wci-8528_wncb-64][divCom.txt].txt -wci 8528 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-550_wncb-4].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-550_wncb-4]/tennisW[dec][cox_soglia-2_wci-550_wncb-4] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-550_wncb-4].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-2_wci-550_wncb-4][divCom.txt].txt -wci 550 -wncb 4 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1092_wncb-8].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-2_wci-1092_wncb-8]/tennisW[dec][cox_soglia-2_wci-1092_wncb-8] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1092_wncb-8].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-2_wci-1092_wncb-8][divCom.txt].txt -wci 1092 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-1].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-1_wncb-1]/tennisW[dec][cox_soglia-4_wci-1_wncb-1] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-1].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-4_wci-1_wncb-1][divCom.txt].txt -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-1_wncb-64]/tennisW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-4_wci-1_wncb-64][divCom.txt].txt -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-17425_wncb-64].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-17425_wncb-64]/tennisW[dec][cox_soglia-4_wci-17425_wncb-64] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-17425_wncb-64].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-4_wci-17425_wncb-64][divCom.txt].txt -wci 17425 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1078_wncb-4].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-1078_wncb-4]/tennisW[dec][cox_soglia-4_wci-1078_wncb-4] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1078_wncb-4].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-4_wci-1078_wncb-4][divCom.txt].txt -wci 1078 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-2189_wncb-8].mpg ./test/tennis/divCom.txt/tennisW[dec][cox_soglia-4_wci-2189_wncb-8]/tennisW[dec][cox_soglia-4_wci-2189_wncb-8] -efwf_cox ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-2189_wncb-8].dat ./test/tennis/divCom.txt/tennisW[cox_soglia-4_wci-2189_wncb-8][divCom.txt].txt -wci 2189 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-1].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-2_wci-1_wncb-1)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-2_wci-1_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-8528_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-2_wci-8528_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-550_wncb-4].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-2_wci-550_wncb-4)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-2_wci-1092_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-2_wci-1092_wncb-8)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-1].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-4_wci-1_wncb-1)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-4_wci-1_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-17425_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-4_wci-17425_wncb-64)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-1078_wncb-4].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-4_wci-1078_wncb-4)(divCom.txt)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/divCom.txt/tennisW[enc][cox_soglia-4_wci-2189_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/divCom.txt/tennisW(cox_soglia-4_wci-2189_wncb-8)(divCom.txt)(psrn).log" -f null -	;

mkdir ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-1_wncb-2]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-56_wncb-64]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-7_wncb-8]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-14_wncb-16]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-1_wncb-2].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 1 -wncb 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-56_wncb-64].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 56 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-7_wncb-8].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 7 -wncb 8	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-14_wncb-16].mpg -ifwf_lsb ./testSet/watermark/stewie.gif -wci 14 -wncb 16	;

./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-1_wncb-2].mpg ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-1_wncb-2]/tennisW[dec][lsb_wci-1_wncb-2] -efwf_lsb ./test/tennis/stewie.gif/tennisW[lsb_wci-1_wncb-2][stewie.gif].gif -wci 1 -wncb 2	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-1_wncb-64].mpg ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-1_wncb-64]/tennisW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/tennis/stewie.gif/tennisW[lsb_wci-1_wncb-64][stewie.gif].gif -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-56_wncb-64].mpg ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-56_wncb-64]/tennisW[dec][lsb_wci-56_wncb-64] -efwf_lsb ./test/tennis/stewie.gif/tennisW[lsb_wci-56_wncb-64][stewie.gif].gif -wci 56 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-7_wncb-8].mpg ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-7_wncb-8]/tennisW[dec][lsb_wci-7_wncb-8] -efwf_lsb ./test/tennis/stewie.gif/tennisW[lsb_wci-7_wncb-8][stewie.gif].gif -wci 7 -wncb 8	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-14_wncb-16].mpg ./test/tennis/stewie.gif/tennisW[dec][lsb_wci-14_wncb-16]/tennisW[dec][lsb_wci-14_wncb-16] -efwf_lsb ./test/tennis/stewie.gif/tennisW[lsb_wci-14_wncb-16][stewie.gif].gif -wci 14 -wncb 16	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-1_wncb-2].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(lsb_wci-1_wncb-2)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(lsb_wci-1_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-56_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(lsb_wci-56_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-7_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(lsb_wci-7_wncb-8)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][lsb_wci-14_wncb-16].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(lsb_wci-14_wncb-16)(stewie.gif)(psrn).log" -f null -	;

mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-1_wncb-1]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-114_wncb-64]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-7_wncb-4]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-14_wncb-8]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-1_wncb-1]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-227_wncb-64]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-15_wncb-4]	;
mkdir ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-30_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-114_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-114_wncb-64].dat -wci 114 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-7_wncb-4].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-7_wncb-4].dat -wci 7 -wncb 4 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-14_wncb-8].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-14_wncb-8].dat -wci 14 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-227_wncb-64].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-227_wncb-64].dat -wci 227 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-15_wncb-4].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-15_wncb-4].dat -wci 15 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-30_wncb-8].mpg -ifwf_cox ./testSet/watermark/stewie.gif -originalCoeff ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-30_wncb-8].dat -wci 30 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-1].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-1_wncb-1]/tennisW[dec][cox_soglia-2_wci-1_wncb-1] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-1].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-2_wci-1_wncb-1][stewie.gif].gif -wci 1 -wncb 1 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-1_wncb-64]/tennisW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-2_wci-1_wncb-64][stewie.gif].gif -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-114_wncb-64].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-114_wncb-64]/tennisW[dec][cox_soglia-2_wci-114_wncb-64] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-114_wncb-64].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-2_wci-114_wncb-64][stewie.gif].gif -wci 114 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-7_wncb-4].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-7_wncb-4]/tennisW[dec][cox_soglia-2_wci-7_wncb-4] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-7_wncb-4].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-2_wci-7_wncb-4][stewie.gif].gif -wci 7 -wncb 4 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-14_wncb-8].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-2_wci-14_wncb-8]/tennisW[dec][cox_soglia-2_wci-14_wncb-8] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-14_wncb-8].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-2_wci-14_wncb-8][stewie.gif].gif -wci 14 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-1].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-1_wncb-1]/tennisW[dec][cox_soglia-4_wci-1_wncb-1] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-1].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-4_wci-1_wncb-1][stewie.gif].gif -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-1_wncb-64]/tennisW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-4_wci-1_wncb-64][stewie.gif].gif -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-227_wncb-64].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-227_wncb-64]/tennisW[dec][cox_soglia-4_wci-227_wncb-64] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-227_wncb-64].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-4_wci-227_wncb-64][stewie.gif].gif -wci 227 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-15_wncb-4].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-15_wncb-4]/tennisW[dec][cox_soglia-4_wci-15_wncb-4] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-15_wncb-4].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-4_wci-15_wncb-4][stewie.gif].gif -wci 15 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-30_wncb-8].mpg ./test/tennis/stewie.gif/tennisW[dec][cox_soglia-4_wci-30_wncb-8]/tennisW[dec][cox_soglia-4_wci-30_wncb-8] -efwf_cox ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-30_wncb-8].dat ./test/tennis/stewie.gif/tennisW[cox_soglia-4_wci-30_wncb-8][stewie.gif].gif -wci 30 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-1].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-2_wci-1_wncb-1)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-2_wci-1_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-114_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-2_wci-114_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-7_wncb-4].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-2_wci-7_wncb-4)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-2_wci-14_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-2_wci-14_wncb-8)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-1].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-4_wci-1_wncb-1)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-4_wci-1_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-227_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-4_wci-227_wncb-64)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-15_wncb-4].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-4_wci-15_wncb-4)(stewie.gif)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/stewie.gif/tennisW[enc][cox_soglia-4_wci-30_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/stewie.gif/tennisW(cox_soglia-4_wci-30_wncb-8)(stewie.gif)(psrn).log" -f null -	;

mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-1_wncb-5]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-13_wncb-64]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-3_wncb-16]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-6_wncb-32]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-1_wncb-5].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 1 -wncb 5	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-13_wncb-64].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 13 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-3_wncb-16].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 3 -wncb 16	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-6_wncb-32].mpg -ifwf_lsb ./testSet/watermark/tajMahal.jpg -wci 6 -wncb 32	;

./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-1_wncb-5].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-1_wncb-5]/tennisW[dec][lsb_wci-1_wncb-5] -efwf_lsb ./test/tennis/tajMahal.jpg/tennisW[lsb_wci-1_wncb-5][tajMahal.jpg].jpg -wci 1 -wncb 5	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-1_wncb-64].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-1_wncb-64]/tennisW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/tennis/tajMahal.jpg/tennisW[lsb_wci-1_wncb-64][tajMahal.jpg].jpg -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-13_wncb-64].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-13_wncb-64]/tennisW[dec][lsb_wci-13_wncb-64] -efwf_lsb ./test/tennis/tajMahal.jpg/tennisW[lsb_wci-13_wncb-64][tajMahal.jpg].jpg -wci 13 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-3_wncb-16].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-3_wncb-16]/tennisW[dec][lsb_wci-3_wncb-16] -efwf_lsb ./test/tennis/tajMahal.jpg/tennisW[lsb_wci-3_wncb-16][tajMahal.jpg].jpg -wci 3 -wncb 16	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-6_wncb-32].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][lsb_wci-6_wncb-32]/tennisW[dec][lsb_wci-6_wncb-32] -efwf_lsb ./test/tennis/tajMahal.jpg/tennisW[lsb_wci-6_wncb-32][tajMahal.jpg].jpg -wci 6 -wncb 32	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-1_wncb-5].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(lsb_wci-1_wncb-5)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(lsb_wci-1_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-13_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(lsb_wci-13_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-3_wncb-16].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(lsb_wci-3_wncb-16)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][lsb_wci-6_wncb-32].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(lsb_wci-6_wncb-32)(tajMahal.jpg)(psrn).log" -f null -	;

mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-3]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-27_wncb-64]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-2_wncb-5]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-3_wncb-8]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-1]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-55_wncb-64]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-6_wncb-6]	;
mkdir ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-10_wncb-10]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-3].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-3].dat -wci 1 -wncb 3 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-27_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-27_wncb-64].dat -wci 27 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-5].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-5].dat -wci 2 -wncb 5 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-8].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-8].dat -wci 3 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-1].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-1].dat -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-55_wncb-64].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-55_wncb-64].dat -wci 55 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-6_wncb-6].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-6_wncb-6].dat -wci 6 -wncb 6 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-10_wncb-10].mpg -ifwf_cox ./testSet/watermark/tajMahal.jpg -originalCoeff ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-10_wncb-10].dat -wci 10 -wncb 10 -sogliaCox 4	;

./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-3].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-3]/tennisW[dec][cox_soglia-2_wci-1_wncb-3] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-3].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-2_wci-1_wncb-3][tajMahal.jpg].jpg -wci 1 -wncb 3 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]/tennisW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-2_wci-1_wncb-64][tajMahal.jpg].jpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-27_wncb-64].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-27_wncb-64]/tennisW[dec][cox_soglia-2_wci-27_wncb-64] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-27_wncb-64].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-2_wci-27_wncb-64][tajMahal.jpg].jpg -wci 27 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-5].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-2_wncb-5]/tennisW[dec][cox_soglia-2_wci-2_wncb-5] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-5].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-2_wci-2_wncb-5][tajMahal.jpg].jpg -wci 2 -wncb 5 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-8].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-2_wci-3_wncb-8]/tennisW[dec][cox_soglia-2_wci-3_wncb-8] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-8].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-2_wci-3_wncb-8][tajMahal.jpg].jpg -wci 3 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-1].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-1]/tennisW[dec][cox_soglia-4_wci-1_wncb-1] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-1].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-4_wci-1_wncb-1][tajMahal.jpg].jpg -wci 1 -wncb 1 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]/tennisW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-4_wci-1_wncb-64][tajMahal.jpg].jpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-55_wncb-64].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-55_wncb-64]/tennisW[dec][cox_soglia-4_wci-55_wncb-64] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-55_wncb-64].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-4_wci-55_wncb-64][tajMahal.jpg].jpg -wci 55 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-6_wncb-6].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-6_wncb-6]/tennisW[dec][cox_soglia-4_wci-6_wncb-6] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-6_wncb-6].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-4_wci-6_wncb-6][tajMahal.jpg].jpg -wci 6 -wncb 6 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-10_wncb-10].mpg ./test/tennis/tajMahal.jpg/tennisW[dec][cox_soglia-4_wci-10_wncb-10]/tennisW[dec][cox_soglia-4_wci-10_wncb-10] -efwf_cox ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-10_wncb-10].dat ./test/tennis/tajMahal.jpg/tennisW[cox_soglia-4_wci-10_wncb-10][tajMahal.jpg].jpg -wci 10 -wncb 10 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-3].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-2_wci-1_wncb-3)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-2_wci-1_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-27_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-2_wci-27_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-5].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-2_wci-2_wncb-5)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-2_wci-3_wncb-8)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-1].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-4_wci-1_wncb-1)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-4_wci-1_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-55_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-4_wci-55_wncb-64)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-6_wncb-6].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-4_wci-6_wncb-6)(tajMahal.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/tajMahal.jpg/tennisW[enc][cox_soglia-4_wci-10_wncb-10].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/tajMahal.jpg/tennisW(cox_soglia-4_wci-10_wncb-10)(tajMahal.jpg)(psrn).log" -f null -	;

mkdir ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-1_wncb-9]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-7_wncb-64]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-2_wncb-24]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-3_wncb-32]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-1_wncb-9].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 1 -wncb 9	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-7_wncb-64].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 7 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-2_wncb-24].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 2 -wncb 24	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-3_wncb-32].mpg -ifwf_lsb ./testSet/watermark/pinguini.jpg -wci 3 -wncb 32	;

./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-1_wncb-9].mpg ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-1_wncb-9]/tennisW[dec][lsb_wci-1_wncb-9] -efwf_lsb ./test/tennis/pinguini.jpg/tennisW[lsb_wci-1_wncb-9][pinguini.jpg].jpg -wci 1 -wncb 9	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-1_wncb-64].mpg ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-1_wncb-64]/tennisW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/tennis/pinguini.jpg/tennisW[lsb_wci-1_wncb-64][pinguini.jpg].jpg -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-7_wncb-64].mpg ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-7_wncb-64]/tennisW[dec][lsb_wci-7_wncb-64] -efwf_lsb ./test/tennis/pinguini.jpg/tennisW[lsb_wci-7_wncb-64][pinguini.jpg].jpg -wci 7 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-2_wncb-24].mpg ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-2_wncb-24]/tennisW[dec][lsb_wci-2_wncb-24] -efwf_lsb ./test/tennis/pinguini.jpg/tennisW[lsb_wci-2_wncb-24][pinguini.jpg].jpg -wci 2 -wncb 24	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-3_wncb-32].mpg ./test/tennis/pinguini.jpg/tennisW[dec][lsb_wci-3_wncb-32]/tennisW[dec][lsb_wci-3_wncb-32] -efwf_lsb ./test/tennis/pinguini.jpg/tennisW[lsb_wci-3_wncb-32][pinguini.jpg].jpg -wci 3 -wncb 32	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-1_wncb-9].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(lsb_wci-1_wncb-9)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(lsb_wci-1_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-7_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(lsb_wci-7_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-2_wncb-24].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(lsb_wci-2_wncb-24)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][lsb_wci-3_wncb-32].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(lsb_wci-3_wncb-32)(pinguini.jpg)(psrn).log" -f null -	;

mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-5]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-15_wncb-64]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-2_wncb-10]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-3_wncb-14]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-2]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-31_wncb-64]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-2_wncb-4]	;
mkdir ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-5_wncb-8]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-5].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-5].dat -wci 1 -wncb 5 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-15_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-15_wncb-64].dat -wci 15 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-10].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-10].dat -wci 2 -wncb 10 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-14].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-14].dat -wci 3 -wncb 14 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].dat -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-31_wncb-64].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-31_wncb-64].dat -wci 31 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-4].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-4].dat -wci 2 -wncb 4 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-5_wncb-8].mpg -ifwf_cox ./testSet/watermark/pinguini.jpg -originalCoeff ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-5_wncb-8].dat -wci 5 -wncb 8 -sogliaCox 4	;

./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-5].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-5]/tennisW[dec][cox_soglia-2_wci-1_wncb-5] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-5].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-2_wci-1_wncb-5][pinguini.jpg].jpg -wci 1 -wncb 5 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]/tennisW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-2_wci-1_wncb-64][pinguini.jpg].jpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-15_wncb-64].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-15_wncb-64]/tennisW[dec][cox_soglia-2_wci-15_wncb-64] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-15_wncb-64].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-2_wci-15_wncb-64][pinguini.jpg].jpg -wci 15 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-10].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-2_wncb-10]/tennisW[dec][cox_soglia-2_wci-2_wncb-10] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-10].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-2_wci-2_wncb-10][pinguini.jpg].jpg -wci 2 -wncb 10 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-14].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-2_wci-3_wncb-14]/tennisW[dec][cox_soglia-2_wci-3_wncb-14] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-14].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-2_wci-3_wncb-14][pinguini.jpg].jpg -wci 3 -wncb 14 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-2]/tennisW[dec][cox_soglia-4_wci-1_wncb-2] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-4_wci-1_wncb-2][pinguini.jpg].jpg -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]/tennisW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-4_wci-1_wncb-64][pinguini.jpg].jpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-31_wncb-64].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-31_wncb-64]/tennisW[dec][cox_soglia-4_wci-31_wncb-64] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-31_wncb-64].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-4_wci-31_wncb-64][pinguini.jpg].jpg -wci 31 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-4].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-2_wncb-4]/tennisW[dec][cox_soglia-4_wci-2_wncb-4] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-4].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-4_wci-2_wncb-4][pinguini.jpg].jpg -wci 2 -wncb 4 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-5_wncb-8].mpg ./test/tennis/pinguini.jpg/tennisW[dec][cox_soglia-4_wci-5_wncb-8]/tennisW[dec][cox_soglia-4_wci-5_wncb-8] -efwf_cox ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-5_wncb-8].dat ./test/tennis/pinguini.jpg/tennisW[cox_soglia-4_wci-5_wncb-8][pinguini.jpg].jpg -wci 5 -wncb 8 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-5].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-2_wci-1_wncb-5)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-2_wci-1_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-15_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-2_wci-15_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-10].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-2_wci-2_wncb-10)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-14].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-2_wci-3_wncb-14)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-4_wci-1_wncb-2)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-4_wci-1_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-31_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-4_wci-31_wncb-64)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-4].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-4_wci-2_wncb-4)(pinguini.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/pinguini.jpg/tennisW[enc][cox_soglia-4_wci-5_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/pinguini.jpg/tennisW(cox_soglia-4_wci-5_wncb-8)(pinguini.jpg)(psrn).log" -f null -	;

mkdir ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-1_wncb-13]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-5_wncb-64]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-2_wncb-32]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-3_wncb-40]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-1_wncb-13].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 1 -wncb 13	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-5_wncb-64].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 5 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-2_wncb-32].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 2 -wncb 32	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-3_wncb-40].mpg -ifwf_lsb ./testSet/watermark/vid1.mpg -wci 3 -wncb 40	;

./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-1_wncb-13].mpg ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-1_wncb-13]/tennisW[dec][lsb_wci-1_wncb-13] -efwf_lsb ./test/tennis/vid1.mpg/tennisW[lsb_wci-1_wncb-13][vid1.mpg].mpg -wci 1 -wncb 13	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-1_wncb-64].mpg ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-1_wncb-64]/tennisW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/tennis/vid1.mpg/tennisW[lsb_wci-1_wncb-64][vid1.mpg].mpg -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-5_wncb-64].mpg ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-5_wncb-64]/tennisW[dec][lsb_wci-5_wncb-64] -efwf_lsb ./test/tennis/vid1.mpg/tennisW[lsb_wci-5_wncb-64][vid1.mpg].mpg -wci 5 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-2_wncb-32].mpg ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-2_wncb-32]/tennisW[dec][lsb_wci-2_wncb-32] -efwf_lsb ./test/tennis/vid1.mpg/tennisW[lsb_wci-2_wncb-32][vid1.mpg].mpg -wci 2 -wncb 32	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-3_wncb-40].mpg ./test/tennis/vid1.mpg/tennisW[dec][lsb_wci-3_wncb-40]/tennisW[dec][lsb_wci-3_wncb-40] -efwf_lsb ./test/tennis/vid1.mpg/tennisW[lsb_wci-3_wncb-40][vid1.mpg].mpg -wci 3 -wncb 40	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-1_wncb-13].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(lsb_wci-1_wncb-13)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(lsb_wci-1_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-5_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(lsb_wci-5_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-2_wncb-32].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(lsb_wci-2_wncb-32)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][lsb_wci-3_wncb-40].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(lsb_wci-3_wncb-40)(vid1.mpg)(psrn).log" -f null -	;

mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-1_wncb-6]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-12_wncb-64]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-2_wncb-13]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-3_wncb-19]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-1_wncb-2]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-24_wncb-64]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-3_wncb-5]	;
mkdir ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-5_wncb-10]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-6].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-6].dat -wci 1 -wncb 6 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-12_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-12_wncb-64].dat -wci 12 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-2_wncb-13].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-2_wncb-13].dat -wci 2 -wncb 13 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-3_wncb-19].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-3_wncb-19].dat -wci 3 -wncb 19 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].dat -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-24_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-24_wncb-64].dat -wci 24 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-5].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-5].dat -wci 3 -wncb 5 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-5_wncb-10].mpg -ifwf_cox ./testSet/watermark/vid1.mpg -originalCoeff ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-5_wncb-10].dat -wci 5 -wncb 10 -sogliaCox 4	;

./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-6].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-1_wncb-6]/tennisW[dec][cox_soglia-2_wci-1_wncb-6] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-6].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-2_wci-1_wncb-6][vid1.mpg].mpg -wci 1 -wncb 6 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]/tennisW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-2_wci-1_wncb-64][vid1.mpg].mpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-12_wncb-64].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-12_wncb-64]/tennisW[dec][cox_soglia-2_wci-12_wncb-64] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-12_wncb-64].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-2_wci-12_wncb-64][vid1.mpg].mpg -wci 12 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-2_wncb-13].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-2_wncb-13]/tennisW[dec][cox_soglia-2_wci-2_wncb-13] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-2_wncb-13].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-2_wci-2_wncb-13][vid1.mpg].mpg -wci 2 -wncb 13 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-3_wncb-19].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-2_wci-3_wncb-19]/tennisW[dec][cox_soglia-2_wci-3_wncb-19] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-3_wncb-19].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-2_wci-3_wncb-19][vid1.mpg].mpg -wci 3 -wncb 19 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-1_wncb-2]/tennisW[dec][cox_soglia-4_wci-1_wncb-2] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-4_wci-1_wncb-2][vid1.mpg].mpg -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]/tennisW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-4_wci-1_wncb-64][vid1.mpg].mpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-24_wncb-64].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-24_wncb-64]/tennisW[dec][cox_soglia-4_wci-24_wncb-64] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-24_wncb-64].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-4_wci-24_wncb-64][vid1.mpg].mpg -wci 24 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-5].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-3_wncb-5]/tennisW[dec][cox_soglia-4_wci-3_wncb-5] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-5].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-4_wci-3_wncb-5][vid1.mpg].mpg -wci 3 -wncb 5 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-5_wncb-10].mpg ./test/tennis/vid1.mpg/tennisW[dec][cox_soglia-4_wci-5_wncb-10]/tennisW[dec][cox_soglia-4_wci-5_wncb-10] -efwf_cox ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-5_wncb-10].dat ./test/tennis/vid1.mpg/tennisW[cox_soglia-4_wci-5_wncb-10][vid1.mpg].mpg -wci 5 -wncb 10 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-6].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-2_wci-1_wncb-6)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-2_wci-1_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-12_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-2_wci-12_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-2_wncb-13].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-2_wci-2_wncb-13)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-2_wci-3_wncb-19].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-2_wci-3_wncb-19)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-2].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-4_wci-1_wncb-2)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-4_wci-1_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-24_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-4_wci-24_wncb-64)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-5].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-4_wci-3_wncb-5)(vid1.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid1.mpg/tennisW[enc][cox_soglia-4_wci-5_wncb-10].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid1.mpg/tennisW(cox_soglia-4_wci-5_wncb-10)(vid1.mpg)(psrn).log" -f null -	;

mkdir ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-1_wncb-19]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-1_wncb-64]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-3_wncb-64]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-2_wncb-40]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-3_wncb-59]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-1_wncb-19].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 1 -wncb 19	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 1 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-3_wncb-64].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 3 -wncb 64	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-2_wncb-40].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 2 -wncb 40	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-3_wncb-59].mpg -ifwf_lsb ./testSet/watermark/aud1.mp3 -wci 3 -wncb 59	;

./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-1_wncb-19].mpg ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-1_wncb-19]/tennisW[dec][lsb_wci-1_wncb-19] -efwf_lsb ./test/tennis/aud1.mp3/tennisW[lsb_wci-1_wncb-19][aud1.mp3].mp3 -wci 1 -wncb 19	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-1_wncb-64].mpg ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-1_wncb-64]/tennisW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/tennis/aud1.mp3/tennisW[lsb_wci-1_wncb-64][aud1.mp3].mp3 -wci 1 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-3_wncb-64].mpg ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-3_wncb-64]/tennisW[dec][lsb_wci-3_wncb-64] -efwf_lsb ./test/tennis/aud1.mp3/tennisW[lsb_wci-3_wncb-64][aud1.mp3].mp3 -wci 3 -wncb 64	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-2_wncb-40].mpg ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-2_wncb-40]/tennisW[dec][lsb_wci-2_wncb-40] -efwf_lsb ./test/tennis/aud1.mp3/tennisW[lsb_wci-2_wncb-40][aud1.mp3].mp3 -wci 2 -wncb 40	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-3_wncb-59].mpg ./test/tennis/aud1.mp3/tennisW[dec][lsb_wci-3_wncb-59]/tennisW[dec][lsb_wci-3_wncb-59] -efwf_lsb ./test/tennis/aud1.mp3/tennisW[lsb_wci-3_wncb-59][aud1.mp3].mp3 -wci 3 -wncb 59	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-1_wncb-19].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(lsb_wci-1_wncb-19)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(lsb_wci-1_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-3_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(lsb_wci-3_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-2_wncb-40].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(lsb_wci-2_wncb-40)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][lsb_wci-3_wncb-59].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(lsb_wci-3_wncb-59)(aud1.mp3)(psrn).log" -f null -	;

mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-1_wncb-8]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-8_wncb-64]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-2_wncb-19]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-3_wncb-29]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-1_wncb-2]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-16_wncb-64]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-3_wncb-7]	;
mkdir ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-5_wncb-13]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-8].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-8].dat -wci 1 -wncb 8 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-8_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-8_wncb-64].dat -wci 8 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-2_wncb-19].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-2_wncb-19].dat -wci 2 -wncb 19 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-3_wncb-29].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-3_wncb-29].dat -wci 3 -wncb 29 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-2].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-2].dat -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-16_wncb-64].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-16_wncb-64].dat -wci 16 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-3_wncb-7].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-3_wncb-7].dat -wci 3 -wncb 7 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-5_wncb-13].mpg -ifwf_cox ./testSet/watermark/aud1.mp3 -originalCoeff ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-5_wncb-13].dat -wci 5 -wncb 13 -sogliaCox 4	;

./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-8].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-1_wncb-8]/tennisW[dec][cox_soglia-2_wci-1_wncb-8] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-8].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-2_wci-1_wncb-8][aud1.mp3].mp3 -wci 1 -wncb 8 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-1_wncb-64]/tennisW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-2_wci-1_wncb-64][aud1.mp3].mp3 -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-8_wncb-64].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-8_wncb-64]/tennisW[dec][cox_soglia-2_wci-8_wncb-64] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-8_wncb-64].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-2_wci-8_wncb-64][aud1.mp3].mp3 -wci 8 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-2_wncb-19].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-2_wncb-19]/tennisW[dec][cox_soglia-2_wci-2_wncb-19] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-2_wncb-19].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-2_wci-2_wncb-19][aud1.mp3].mp3 -wci 2 -wncb 19 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-3_wncb-29].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-2_wci-3_wncb-29]/tennisW[dec][cox_soglia-2_wci-3_wncb-29] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-3_wncb-29].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-2_wci-3_wncb-29][aud1.mp3].mp3 -wci 3 -wncb 29 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-2].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-1_wncb-2]/tennisW[dec][cox_soglia-4_wci-1_wncb-2] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-2].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-4_wci-1_wncb-2][aud1.mp3].mp3 -wci 1 -wncb 2 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-1_wncb-64]/tennisW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-4_wci-1_wncb-64][aud1.mp3].mp3 -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-16_wncb-64].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-16_wncb-64]/tennisW[dec][cox_soglia-4_wci-16_wncb-64] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-16_wncb-64].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-4_wci-16_wncb-64][aud1.mp3].mp3 -wci 16 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-3_wncb-7].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-3_wncb-7]/tennisW[dec][cox_soglia-4_wci-3_wncb-7] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-3_wncb-7].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-4_wci-3_wncb-7][aud1.mp3].mp3 -wci 3 -wncb 7 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-5_wncb-13].mpg ./test/tennis/aud1.mp3/tennisW[dec][cox_soglia-4_wci-5_wncb-13]/tennisW[dec][cox_soglia-4_wci-5_wncb-13] -efwf_cox ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-5_wncb-13].dat ./test/tennis/aud1.mp3/tennisW[cox_soglia-4_wci-5_wncb-13][aud1.mp3].mp3 -wci 5 -wncb 13 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-2_wci-1_wncb-8)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-2_wci-1_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-8_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-2_wci-8_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-2_wncb-19].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-2_wci-2_wncb-19)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-2_wci-3_wncb-29].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-2_wci-3_wncb-29)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-2].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-4_wci-1_wncb-2)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-4_wci-1_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-16_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-4_wci-16_wncb-64)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-3_wncb-7].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-4_wci-3_wncb-7)(aud1.mp3)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/aud1.mp3/tennisW[enc][cox_soglia-4_wci-5_wncb-13].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/aud1.mp3/tennisW(cox_soglia-4_wci-5_wncb-13)(aud1.mp3)(psrn).log" -f null -	;

mkdir ./test/tennis/spazio.jpg/tennisW[dec][lsb_wci-1_wncb-48]	;
mkdir ./test/tennis/spazio.jpg/tennisW[dec][lsb_wci-1_wncb-64]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][lsb_wci-1_wncb-48].mpg -ifwf_lsb ./testSet/watermark/spazio.jpg -wci 1 -wncb 48	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][lsb_wci-1_wncb-64].mpg -ifwf_lsb ./testSet/watermark/spazio.jpg -wci 1 -wncb 64	;

./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][lsb_wci-1_wncb-48].mpg ./test/tennis/spazio.jpg/tennisW[dec][lsb_wci-1_wncb-48]/tennisW[dec][lsb_wci-1_wncb-48] -efwf_lsb ./test/tennis/spazio.jpg/tennisW[lsb_wci-1_wncb-48][spazio.jpg].jpg -wci 1 -wncb 48	;
./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][lsb_wci-1_wncb-64].mpg ./test/tennis/spazio.jpg/tennisW[dec][lsb_wci-1_wncb-64]/tennisW[dec][lsb_wci-1_wncb-64] -efwf_lsb ./test/tennis/spazio.jpg/tennisW[lsb_wci-1_wncb-64][spazio.jpg].jpg -wci 1 -wncb 64	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][lsb_wci-1_wncb-48].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(lsb_wci-1_wncb-48)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][lsb_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(lsb_wci-1_wncb-64)(spazio.jpg)(psrn).log" -f null -	;

mkdir ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-17]	;
mkdir ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-2_wci-3_wncb-64]	;
mkdir ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-2_wci-2_wncb-35]	;
mkdir ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-5]	;
mkdir ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-7_wncb-64]	;
mkdir ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-2_wncb-10]	;
mkdir ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-3_wncb-17]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-17].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-17].dat -wci 1 -wncb 17 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-64].dat -wci 3 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-35].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-35].dat -wci 2 -wncb 35 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-5].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-5].dat -wci 1 -wncb 5 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-7_wncb-64].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-7_wncb-64].dat -wci 7 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-10].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-10].dat -wci 2 -wncb 10 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-3_wncb-17].mpg -ifwf_cox ./testSet/watermark/spazio.jpg -originalCoeff ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-3_wncb-17].dat -wci 3 -wncb 17 -sogliaCox 4	;

./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-17].mpg ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-17]/tennisW[dec][cox_soglia-2_wci-1_wncb-17] -efwf_cox ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-17].dat ./test/tennis/spazio.jpg/tennisW[cox_soglia-2_wci-1_wncb-17][spazio.jpg].jpg -wci 1 -wncb 17 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]/tennisW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/tennis/spazio.jpg/tennisW[cox_soglia-2_wci-1_wncb-64][spazio.jpg].jpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-64].mpg ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-2_wci-3_wncb-64]/tennisW[dec][cox_soglia-2_wci-3_wncb-64] -efwf_cox ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-64].dat ./test/tennis/spazio.jpg/tennisW[cox_soglia-2_wci-3_wncb-64][spazio.jpg].jpg -wci 3 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-35].mpg ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-2_wci-2_wncb-35]/tennisW[dec][cox_soglia-2_wci-2_wncb-35] -efwf_cox ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-35].dat ./test/tennis/spazio.jpg/tennisW[cox_soglia-2_wci-2_wncb-35][spazio.jpg].jpg -wci 2 -wncb 35 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-5].mpg ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-5]/tennisW[dec][cox_soglia-4_wci-1_wncb-5] -efwf_cox ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-5].dat ./test/tennis/spazio.jpg/tennisW[cox_soglia-4_wci-1_wncb-5][spazio.jpg].jpg -wci 1 -wncb 5 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]/tennisW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/tennis/spazio.jpg/tennisW[cox_soglia-4_wci-1_wncb-64][spazio.jpg].jpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-7_wncb-64].mpg ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-7_wncb-64]/tennisW[dec][cox_soglia-4_wci-7_wncb-64] -efwf_cox ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-7_wncb-64].dat ./test/tennis/spazio.jpg/tennisW[cox_soglia-4_wci-7_wncb-64][spazio.jpg].jpg -wci 7 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-10].mpg ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-2_wncb-10]/tennisW[dec][cox_soglia-4_wci-2_wncb-10] -efwf_cox ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-10].dat ./test/tennis/spazio.jpg/tennisW[cox_soglia-4_wci-2_wncb-10][spazio.jpg].jpg -wci 2 -wncb 10 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-3_wncb-17].mpg ./test/tennis/spazio.jpg/tennisW[dec][cox_soglia-4_wci-3_wncb-17]/tennisW[dec][cox_soglia-4_wci-3_wncb-17] -efwf_cox ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-3_wncb-17].dat ./test/tennis/spazio.jpg/tennisW[cox_soglia-4_wci-3_wncb-17][spazio.jpg].jpg -wci 3 -wncb 17 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-17].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(cox_soglia-2_wci-1_wncb-17)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(cox_soglia-2_wci-1_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-3_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(cox_soglia-2_wci-3_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-2_wci-2_wncb-35].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(cox_soglia-2_wci-2_wncb-35)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-5].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(cox_soglia-4_wci-1_wncb-5)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(cox_soglia-4_wci-1_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-7_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(cox_soglia-4_wci-7_wncb-64)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-2_wncb-10].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(cox_soglia-4_wci-2_wncb-10)(spazio.jpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/spazio.jpg/tennisW[enc][cox_soglia-4_wci-3_wncb-17].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/spazio.jpg/tennisW(cox_soglia-4_wci-3_wncb-17)(spazio.jpg)(psrn).log" -f null -	;

mkdir ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-2_wci-1_wncb-26]	;
mkdir ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]	;
mkdir ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-4_wci-1_wncb-8]	;
mkdir ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]	;
mkdir ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-4_wci-2_wncb-16]	;
mkdir ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-4_wci-3_wncb-28]	;

./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-26].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-26].dat -wci 1 -wncb 26 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-8].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-8].dat -wci 1 -wncb 8 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-2_wncb-16].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-2_wncb-16].dat -wci 2 -wncb 16 -sogliaCox 4	;
./mpeg.exe -a 0 -b 149 ./testSet/yuv/tennis/tennis -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-28].mpg -ifwf_cox ./testSet/watermark/vid2.mpg -originalCoeff ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-28].dat -wci 3 -wncb 28 -sogliaCox 4	;

./mpeg.exe -d -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-26].mpg ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-2_wci-1_wncb-26]/tennisW[dec][cox_soglia-2_wci-1_wncb-26] -efwf_cox ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-26].dat ./test/tennis/vid2.mpg/tennisW[cox_soglia-2_wci-1_wncb-26][vid2.mpg].mpg -wci 1 -wncb 26 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-2_wci-1_wncb-64]/tennisW[dec][cox_soglia-2_wci-1_wncb-64] -efwf_cox ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].dat ./test/tennis/vid2.mpg/tennisW[cox_soglia-2_wci-1_wncb-64][vid2.mpg].mpg -wci 1 -wncb 64 -sogliaCox 2	;
./mpeg.exe -d -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-8].mpg ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-4_wci-1_wncb-8]/tennisW[dec][cox_soglia-4_wci-1_wncb-8] -efwf_cox ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-8].dat ./test/tennis/vid2.mpg/tennisW[cox_soglia-4_wci-1_wncb-8][vid2.mpg].mpg -wci 1 -wncb 8 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-4_wci-1_wncb-64]/tennisW[dec][cox_soglia-4_wci-1_wncb-64] -efwf_cox ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].dat ./test/tennis/vid2.mpg/tennisW[cox_soglia-4_wci-1_wncb-64][vid2.mpg].mpg -wci 1 -wncb 64 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-2_wncb-16].mpg ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-4_wci-2_wncb-16]/tennisW[dec][cox_soglia-4_wci-2_wncb-16] -efwf_cox ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-2_wncb-16].dat ./test/tennis/vid2.mpg/tennisW[cox_soglia-4_wci-2_wncb-16][vid2.mpg].mpg -wci 2 -wncb 16 -sogliaCox 4	;
./mpeg.exe -d -s ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-28].mpg ./test/tennis/vid2.mpg/tennisW[dec][cox_soglia-4_wci-3_wncb-28]/tennisW[dec][cox_soglia-4_wci-3_wncb-28] -efwf_cox ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-28].dat ./test/tennis/vid2.mpg/tennisW[cox_soglia-4_wci-3_wncb-28][vid2.mpg].mpg -wci 3 -wncb 28 -sogliaCox 4	;

./ffmpeg/ffmpeg.exe -i ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-26].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid2.mpg/tennisW(cox_soglia-2_wci-1_wncb-26)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-2_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid2.mpg/tennisW(cox_soglia-2_wci-1_wncb-64)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-8].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid2.mpg/tennisW(cox_soglia-4_wci-1_wncb-8)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-1_wncb-64].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid2.mpg/tennisW(cox_soglia-4_wci-1_wncb-64)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-2_wncb-16].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid2.mpg/tennisW(cox_soglia-4_wci-2_wncb-16)(vid2.mpg)(psrn).log" -f null -	;
./ffmpeg/ffmpeg.exe -i ./test/tennis/vid2.mpg/tennisW[enc][cox_soglia-4_wci-3_wncb-28].mpg -i ./testSet/compressed/tennis.mpg -lavfi psnr="stats_file=./test/tennis/vid2.mpg/tennisW(cox_soglia-4_wci-3_wncb-28)(vid2.mpg)(psrn).log" -f null -	;

