#include<iostream>
#include<fstream>
#include"FaceDetectorInterface.h"
#include"opencv2/core/types.hpp"

using namespace std;
using namespace cv;

class OpenCVFaceDetector : public FaceDetectorInterface<Rect>
{
    private:
            fstream *image;
            string templateList;

    public:
            OpenCVFaceDetector(fstream &image,string templateList);
};
