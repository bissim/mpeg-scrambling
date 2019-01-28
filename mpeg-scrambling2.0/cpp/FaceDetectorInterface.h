#include<vector>
#include<iostream>

using namespace std;
template <class T>

class FaceDetectorInterface
{
    public: virtual vector<T> detectFaces();
};
