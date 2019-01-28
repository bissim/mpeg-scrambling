#include<iostream>
#include<fstream>
#include<vector>
#include"OpenCVFaceDetector.h"
#include"opencv2/core/types.hpp"

OpenCVFaceDetector::OpenCVFaceDetector(fstream &image, fstream &templateList)
{
        this->image = &image;
        this->templateList = &templateList;
}

vector<Rect> detectFaces()
{

}
