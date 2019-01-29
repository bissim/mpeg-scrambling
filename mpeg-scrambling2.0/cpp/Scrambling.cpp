#include<iostream>
#include<vector>
#include<string>
#include<exception>
#include"opencv2/core/types.hpp"
#include"opencv2/objdetect/objdetect.hpp"
#include"opencv2/core/mat.hpp"
#include"opencv2/imgcodecs.hpp"
#include"opencv2/imgproc.hpp"
#include<stdlib.h>
#include<fstream>
#include<bits/stdc++.h>

using namespace std;
using namespace cv;

bool overlaps(Rect r1, Rect r2);
bool mycontains(Rect r1, Rect r2);
Rect myunion(Rect r1, Rect r2);
vector<Rect> checkOverlapResult(vector<Rect> rects);

int main(int argc, char *argv[])
{		
    int w = 0;
    int h = 0;
    string path = "";
    string file_format = "bmp";
    int rgb;
    
    w = atoi(argv[1]);
    h = atoi(argv[2]);
    path = argv[3]; 
    
    string n_frame = argv[4];

    string fileY = path+"~Y.txt";
    string fileU = path+"~U.txt";
    string fileV = path+"~V.txt";
        
    cout<<"Scrambling...  frame: "<<n_frame<<endl;
    cout<<"Apro il file "<<fileY<<endl;
    cout<<"Apro il file "<<fileU<<endl;
    cout<<"Apro il file "<<fileV<<endl;

    int i=0, j=0, block=0, block_i=0, block_j=0, count=0;
    int matrix[h][w];
    int matrix2[h/2][w/2];
    int matrix3[h/2][w/2];

    ////////////////////////////////////////////////////////////////////////////////
	///////////// CREO L'IMMAGINE A PARTIRE DAL FILE TXT PROVENIENTE DA C //////////
    ///////////// CONTENENTE IL FRAME Y ////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////
    
    string lineY;
    ifstream inputY;
    inputY.open(fileY);
    
    while(getline(inputY,lineY))
    {   
        vector<string> tokens;
        stringstream check1(lineY);
        string intermediate;
        
        while(getline(check1, intermediate, ',')) 
        { 
            tokens.push_back(intermediate); 
        } 
        
        int cvect=0;
        while (cvect < tokens.size())
        {
            int a = stoi(tokens.at(cvect));
            matrix[i+block_i][j+block_j] = a;
            j++;
            cvect++;
        }

        i++;
        j = 0;
        
        if(i == 8) 
        {
            i = 0;
            j = 0;
            block_j += 8;
            if(block_j >= w) {
                block_j = 0;
                block_i += 8;
            }
            
            if(block_i >= h) {
                block_i = 0;
                break;
            }	
        }
    }

    ofstream fileoutputY;
    fileoutputY.open(fileY+"."+"ppm");

    fileoutputY << "P3" << endl;
    fileoutputY << w << " " << h <<endl;
    fileoutputY << "255" << endl;

    for(i = 0;i < h;i++) 
    {
        for(j = 0;j < w;j++) 
        {
            int a = matrix[i][j];

            if(a <= 255 && a >= 0)
            {
                fileoutputY << a << " " << a << " " << a <<endl;
            }
            else
            {
                a = 255;
                fileoutputY << a << " " << a << " " << a <<endl;
            }
        }
    }

    ////////////////////////////////////////////////////////////////////////////////
    ///////////// CREO L'IMMAGINE A PARTIRE DAL FILE TXT PROVENIENTE DA C //////////
    ///////////// CONTENENTE IL FRAME U ////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////

    string lineU;
    ifstream inputU;
    inputU.open(fileU);
    i = 0;
    j = 0;
    block = 0;
    block_i = 0;
    block_j = 0;
    count = 0;
    
    while(getline(inputU,lineU)) 
    {
        vector<string> tokens;
        stringstream check1(lineU);
        string intermediate;
        
        while(getline(check1, intermediate, ',')) 
        { 
            tokens.push_back(intermediate); 
        } 

        int cvect=0;
        while (cvect < tokens.size())
        {
            int a = stoi(tokens.at(cvect));
            matrix2[i+block_i][j+block_j] = a;
            j++;
            cvect++;
        }
        
        i++;
        j = 0;
        
        if(i == 8) {
            i = 0;
            j = 0;
            block_j += 8;
            if(block_j >= w/2) {
                block_j = 0;
                block_i += 8;
            }
            
            if(block_i >= h/2) {
                block_i = 0;
                break;
            }	
        }
    }
    
    ofstream fileoutputU;
    fileoutputU.open(fileU+"."+"ppm");

    fileoutputU << "P3" << endl;
    fileoutputU << w/2 << " " << h/2 <<endl;
    fileoutputU << "255" << endl;

    for(i = 0;i < h/2;i++) 
    {
        for(j = 0;j < w/2;j++) 
        {
            int a = matrix2[i][j];
            fileoutputU << a << " " << a << " " << a <<endl; 
        }
    }

    ////////////////////////////////////////////////////////////////////////////////
    ///////////// CREO L'IMMAGINE A PARTIRE DAL FILE TXT PROVENIENTE DA C //////////
    ///////////// CONTENENTE IL FRAME V ////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////

    string lineV;
    ifstream inputV;
    inputV.open(fileV);
    i = 0;
    j = 0;
    block = 0;
    block_i = 0;
    block_j = 0;
    count = 0;
    
    while(getline(inputV,lineV)) 
    {
        vector<string> tokens;
        stringstream check1(lineV);
        string intermediate;
       
        while(getline(check1, intermediate, ',')) 
        { 
            tokens.push_back(intermediate); 
        } 

        int cvect=0;
        while (cvect < tokens.size())
        {
            int a = stoi(tokens.at(cvect));
            matrix3[i+block_i][j+block_j] = a;
            j++;
            cvect++;
        }
        
        i++;
        j = 0;
        
        if(i == 8) {
            i = 0;
            j = 0;
            block_j += 8;
            if(block_j >= w/2) {
                block_j = 0;
                block_i += 8;
            }
            
            if(block_i >= h/2) {
                block_i = 0;
                break;
            }	
        }
    }
    
    ofstream fileoutputV;
    fileoutputV.open(fileV+"."+"ppm");

    fileoutputV << "P3" << endl;
    fileoutputV << w/2 << " " << h/2 <<endl;
    fileoutputV << "255" << endl;

    for(i = 0;i < h/2;i++) 
    {
        for(j = 0;j < w/2;j++) 
        {
            int a = matrix3[i][j];
            fileoutputV << a << " " << a << " " << a <<endl; 
        }
    }
    
    //////////////////////////////////////////////////////////////////////////
    // APPLICO LO SCRAMBLING SULLA LUMINANZA DEL FRAME PER CALCOLARE LE ROI //
    //////////////////////////////////////////////////////////////////////////

    vector<string> strategies;
    strategies.push_back("../xml/lbpcascade_frontalface.xml");
    strategies.push_back("../xml/lbpcascade_frontalcatface.xml");
    strategies.push_back("../xml/lbpcascade_frontalface_improved.xml");
    strategies.push_back("../xml/lbpcascade_profileface.xml");
    strategies.push_back("../xml/lbpcascade_silverware.xml");
    strategies.push_back("../xml/haarcascade_eye.xml");
    strategies.push_back("../xml/haarcascade_profileface.xml");
    strategies.push_back("../xml/haarcascade_frontalface_alt.xml");
    
    
    // DEFINISCO LA STRATEGIA DI RICERCA
    Mat image = imread("./~Y.txt.ppm",1);
    
    if(image.empty()) 
    {
        cout<<"Immagine non caricata!"<<endl;
        return -1;
    }
    
    vector<vector<vector<Point>>> pts;
    CascadeClassifier faceDetector;
    vector<Rect> rettangoli;
    
    int faces = 0;
    for(string strategy : strategies) 
    {
        
        faceDetector = CascadeClassifier(strategy);
        
        vector<Rect> faceVectors;
        //faceDetector.detectMultiScale(image, faceVectors);

        if(faceVectors.size() > faces) 
        {
            faces = faceVectors.size();
        }
    
        for(Rect rect : faceVectors) 
        {
            rettangoli.push_back(Rect(rect.x, rect.y, rect.width, rect.height));
        }
        
        rettangoli = checkOverlapResult(rettangoli);
    }

    //////////////////////////////////////////////////////////////////////////
    ///// CREO IL FILE JSON CON LE EVENTUALI ROI CALCOLATE SULL'IMMAGINE /////
    //////////////////////////////////////////////////////////////////////////
    
    ofstream scrivi_xml;
    scrivi_xml.open(path+"~ROI.json");
    scrivi_xml << "{\""+n_frame+"\":[";
    int cont_t = 0;
    
    // CONVERTO LE SEZIONI INVIDIDUATE IN QUADRATI E LI SOVRASCRIVO ALL'IMMAGINE
    for (Rect rect : rettangoli)
    {
        vector<Point> rook_points;
        rook_points.push_back(Point(rect.x,rect.y));
        rook_points.push_back(Point(rect.x + rect.width, rect.y));
        rook_points.push_back(Point(rect.x + rect.width, rect.y + rect.height));
        rook_points.push_back(Point(rect.x, rect.y + rect.height));

        vector<vector<Point>> matPt;
        matPt.push_back(rook_points);

        pts.push_back(matPt);
        
        if(cont_t == rettangoli.size()-1)
            scrivi_xml << "{\"x\":"+to_string(rect.x)+",\"y\":"+to_string(rect.y)+",\"w\":"+to_string(rect.width)+",\"h\":"+to_string(rect.height)+"}";
        else
            scrivi_xml << "{\"x\":"+to_string(rect.x)+",\"y\":"+to_string(rect.y)+",\"w\":"+to_string(rect.width)+",\"h\":"+to_string(rect.height)+"},";
        cont_t++;
        
    }
    scrivi_xml << "]}";

    //TODO completare.
    /* SALVO L'IMMAGINE CON LE MASCHERE UTILE SOLO AI FINI DI DEBUGGING
    vector<Point> matPt2;
    matPt2.push_back(Point(0,0));
    matPt2.push_back(Point(w,0));
    matPt2.push_back(Point(w,h));
    matPt2.push_back(Point(0,h));
    
    vector<vector<Point>> pts2;
    pts2.push_back(matPt2);
    //fillPoly(image,pts2,Scalar(255,255,255),0);
    
    //fillPoly(image,pts,Scalar(0,0,0),0);
    //imwrite(fileY+"_scramb."+file_format, image);*/
    
    cout<<"Ultimate scrambling frame: "<<n_frame<<endl;
    cout<<"***** FACCE TROVATE: "<<faces<<" *****"<<endl;

    return 0;
}

bool overlaps(Rect r1, Rect r2) 
{
    return r2.x < r1.x + r1.width && r2.x + r2.width > r1.x && r2.y < r1.y + r1.height && r2.y + r2.height > r1.y;
}

bool mycontains(Rect r1, Rect r2)
{
    return r1.width > 0 && r1.height > 0 && r2.width > 0 && r2.height > 0
    && r2.x >= r1.x && r2.x + r2.width <= r1.x + r1.width
    && r2.y >= r1.y && r2.y + r2.height <= r1.y + r1.height;
}

Rect myunion(Rect r1, Rect r2)
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

vector<Rect> checkOverlapResult(vector<Rect> rects) 
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
