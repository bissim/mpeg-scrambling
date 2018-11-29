MATLAB="/usr/local/MATLAB/R2012a"
Arch=glnx86
ENTRYPOINT=mexFunction
MAPFILE=$ENTRYPOINT'.map'
PREFDIR="/home/lorenzo/.matlab/R2012a"
OPTSFILE_NAME="./mexopts.sh"
. $OPTSFILE_NAME
COMPILER=$CC
. $OPTSFILE_NAME
echo "# Make settings for matrix2jpeg" > matrix2jpeg_mex.mki
echo "CC=$CC" >> matrix2jpeg_mex.mki
echo "CFLAGS=$CFLAGS" >> matrix2jpeg_mex.mki
echo "CLIBS=$CLIBS" >> matrix2jpeg_mex.mki
echo "COPTIMFLAGS=$COPTIMFLAGS" >> matrix2jpeg_mex.mki
echo "CDEBUGFLAGS=$CDEBUGFLAGS" >> matrix2jpeg_mex.mki
echo "CXX=$CXX" >> matrix2jpeg_mex.mki
echo "CXXFLAGS=$CXXFLAGS" >> matrix2jpeg_mex.mki
echo "CXXLIBS=$CXXLIBS" >> matrix2jpeg_mex.mki
echo "CXXOPTIMFLAGS=$CXXOPTIMFLAGS" >> matrix2jpeg_mex.mki
echo "CXXDEBUGFLAGS=$CXXDEBUGFLAGS" >> matrix2jpeg_mex.mki
echo "LD=$LD" >> matrix2jpeg_mex.mki
echo "LDFLAGS=$LDFLAGS" >> matrix2jpeg_mex.mki
echo "LDOPTIMFLAGS=$LDOPTIMFLAGS" >> matrix2jpeg_mex.mki
echo "LDDEBUGFLAGS=$LDDEBUGFLAGS" >> matrix2jpeg_mex.mki
echo "Arch=$Arch" >> matrix2jpeg_mex.mki
echo OMPFLAGS= >> matrix2jpeg_mex.mki
echo OMPLINKFLAGS= >> matrix2jpeg_mex.mki
echo "EMC_COMPILER=" >> matrix2jpeg_mex.mki
echo "EMC_CONFIG=optim" >> matrix2jpeg_mex.mki
"/usr/local/MATLAB/R2012a/bin/glnx86/gmake" -B -f matrix2jpeg_mex.mk
