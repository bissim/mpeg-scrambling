#include<iostream>
#include<vector>
#include"FaceDetector.h"
#include"opencv2/core/types.hpp"
#include<exception>

using namespace std;
using namespace cv;

FaceDetector::FaceDetector() 
{
    strategies = vector<FaceDetectorInterface<Rect>>();
}

void FaceDetector::addStrategy(FaceDetectorInterface<Rect> strategy) 
{
    strategies.push_back(strategy);
}

vector<Rect> FaceDetector::checkOverlapResult(vector<Rect> rects) 
{
    bool overlap = true;
    while(overlap) 
    {
        overlap=false;
        try 
        {
            for (int i = 0; i < rects.size(); i++) 
            {
                for (int j = 0; j < rects.size(); j++) 
                {
                    if (i == j) continue;
                    if (mycontains(rects.at(i),rects.at(j))) 
                    {
                        rects.erase(rects.begin() + j);
                        overlap = true;
                        j--;
                        if (i == rects.size()) i--;
                    }

                }
            }

            for (int i = 0; i < rects.size(); i++)
            {
                for (int j = 0; j < rects.size(); j++) 
                {
                    if (i == j) continue;
                    if (overlaps(rects.at(i), rects.at(j)))
                    {
                        cout<<("overlap");
                        Rect r = rects.at(i).union(rects.at(j));
                        rects.erase(rects.begin() + i);
                        rects.insert(rects.begin() + i, r);
                        rects.erase(rects.begin() + j);
                        overlap = true;
                        j--;

                    }

                }
            }
        } 
        catch (exception e) {}
    }
    return rects;
}

bool FaceDetector::overlaps (Rect r1, Rect r2) 
{
        return r2.x < r1.x + r1.width && r2.x + r2.width > r1.x && r2.y < r1.y + r1.height && r2.y + r2.height > r1.y;
}

bool FaceDetector::mycontains(Rect r1, Rect r2)
{
    return r1.width > 0 && r1.height > 0 && r2.width > 0 && r2.height > 0
    && r2.x >= r1.x && r2.x + r2.width <= r1.x + r1.width
    && r2.y >= r1.y && r2.y + r2.height <= r1.y + r1.height;
}
