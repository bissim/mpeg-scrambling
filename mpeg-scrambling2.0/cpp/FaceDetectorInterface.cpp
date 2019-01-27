#include<list>
#include<iostream>

using namespace std;
template <class T>

class FaceDetectorInterface
{
    public: virtual list<T> detectFaces();
};
