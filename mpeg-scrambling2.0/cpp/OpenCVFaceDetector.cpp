#include<iostream>
#include<fstream>
#include<vector>
#include<string>
#include<experimental/filesystem>
#include"OpenCVFaceDetector.h"
#include"opencv2/core/types.hpp"
#include"opencv2/objdetect/objdetect.hpp"
#include"opencv2/core/mat.hpp"
#include"opencv2/imgcodecs.hpp"

using namespace std;
using namespace cv;

OpenCVFaceDetector::OpenCVFaceDetector(fstream &image, string templateList)
{
        this->image = &image;
        this->templateList = templateList;
}

vector<Rect> detectFaces()
{
        vector<Rect> rects = vector<Rect>();
        CascadeClassifier faceDetector = CascadeClassifier();
        vector<Rect> faceDetections = vector<Rect>();

        for(const auto & entry : directory_iterator(templateList)) 
        {
                Mat image = imread(""/*this.image.getAbsolutePath()*/);

                //faceDetector.load(templateList.listFiles()[i].getAbsolutePath()); //controlla
                faceDetector.detectMultiScale(image, faceDetections);
                
                for (Rect rect : faceDetections)
                {
                        rects.push_back(Rect(rect.x, rect.y, rect.width, rect.height));
                }

        }
}
