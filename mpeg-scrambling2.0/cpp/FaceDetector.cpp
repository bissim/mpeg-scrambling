#include<iostream>
#include<vector>
#include"FaceDetector.h"
#include"opencv2/core/types.hpp"
#include<exception>
#include<limits>

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
                        Rect r = myunion(rects.at(i),rects.at(j));
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

Rect FaceDetector::myunion(Rect r1, Rect r2)
{
    long tx2 = r1.width;
    long ty2 = r1.height;
    if ((tx2 | ty2) < 0) 
    {
        // This rectangle has negative dimensions...
        // If r has non-negative dimensions then it is the answer.
        // If r is non-existant (has a negative dimension), then both
        // are non-existant and we can return any non-existant rectangle
        // as an answer.  Thus, returning r meets that criterion.
        // Either way, r is our answer.
        return r2;
    }

    long rx2 = r2.width;
    long ry2 = r2.height;
    if ((rx2 | ry2) < 0) 
    {
        return r1;
    }

    int tx1 = r1.x;
    int ty1 = r1.y;
    tx2 += tx1;
    ty2 += ty1;
    int rx1 = r2.x;
    int ry1 = r2.y;
    rx2 += rx1;
    ry2 += ry1;
    if (tx1 > rx1) tx1 = rx1;
    if (ty1 > ry1) ty1 = ry1;
    if (tx2 < rx2) tx2 = rx2;
    if (ty2 < ry2) ty2 = ry2;
    tx2 -= tx1;
    ty2 -= ty1;
    // tx2,ty2 will never underflow since both original rectangles
    // were already proven to be non-empty
    // they might overflow, though...
    if (tx2 > numeric_limits<int>::max()) tx2 = numeric_limits<int>::max();
    if (ty2 > numeric_limits<int>::max()) ty2 = numeric_limits<int>::max();
    return Rect(tx1, ty1, (int) tx2, (int) ty2);
}
