package com.facedetect.strategies;

import org.opencv.core.Mat;
import org.opencv.core.MatOfRect;
import org.opencv.core.Rect;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.objdetect.CascadeClassifier;
import com.facedetect.FaceDetectorInterface;

import java.awt.*;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by alfonso on 06/04/2017.
 */
public class OpenCVSmileDetector implements FaceDetectorInterface<Rectangle> {

    private File image, templateList;

    public OpenCVSmileDetector(File image, File templateList){
        this.image = image;
        this.templateList = templateList;
    }

    @Override
    public List<Rectangle> detectFaces() {
        List<Rectangle> rects = new ArrayList<>();
        CascadeClassifier faceDetector = new CascadeClassifier();
        MatOfRect faceDetections = new MatOfRect();
        for(int i=0; i<templateList.listFiles().length; i++) {
            Mat image = Imgcodecs.imread(this.image.getAbsolutePath());
            faceDetector.load(templateList.listFiles()[i].getAbsolutePath());
            faceDetector.detectMultiScale(image, faceDetections);
            for (Rect rect : faceDetections.toArray()) {
                rects.add(new Rectangle(rect.x, rect.y, rect.width, rect.height));
            }
        }
        return rects;
    }
}
