#include<iostream>
#include<vector>
#include"FaceDetectorInterface.h"
#include"opencv2/core/types.hpp"

using namespace std;
using namespace cv;

class FaceDetector
{
    private: 
            vector<FaceDetectorInterface<Rect>> strategies;
            vector<Rect> checkOverlapResult(vector<Rect> rects);
            static bool overlaps (Rect r1, Rect r2);

    public: 
            FaceDetector();
            void addStrategy(FaceDetectorInterface<Rect> strategy);
            bool mycontains(Rect r1, Rect r2);
            Rect myunion(Rect r1, Rect r2);
};
