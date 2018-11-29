package com.facedetect.strategies;

import java.awt.Rectangle;
import org.opencv.core.Mat;
import org.opencv.core.MatOfRect;
import org.opencv.core.Rect;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.objdetect.CascadeClassifier;
import com.facedetect.FaceDetectorInterface;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by alfonso on 06/04/2017.
 */
public class OpenCVFaceDetector implements FaceDetectorInterface<Rectangle> {

    private File image, templateList;

    /**
     * Costruttore della classe che implementa la ricerca delle facce
     * con la libreria OpenCV
     * @param image Immagine su cui ricercare volti
     * @param templateList cartella che contiene i template XML su cui effettuare la ricerca
     */
    public OpenCVFaceDetector(File image, File templateList){
        this.image = image;
        this.templateList = templateList;
    }

    @Override
    /**
     * Questo metodo esegue la ricerca di volti con la libreria OpenCV.
     */
    public List<Rectangle> detectFaces() {
        List<Rectangle> rects = new ArrayList<>();
        CascadeClassifier faceDetector = new CascadeClassifier();
        MatOfRect faceDetections = new MatOfRect();
        for(int i=0; i<templateList.listFiles().length; i++) {
            Mat image = Imgcodecs.imread(this.image.getAbsolutePath());
            /**
             * viene caricato il template con cui viene effettuata la ricerca
             * (OpenCV ne fornisce diversi per ricerca volti)
             */
            faceDetector.load(templateList.listFiles()[i].getAbsolutePath());
            /**
             * viene effettuata la ricerca dei volti all'interno della foto
             */
            faceDetector.detectMultiScale(image, faceDetections);
            for (Rect rect : faceDetections.toArray()) {
                rects.add(new Rectangle(rect.x, rect.y, rect.width, rect.height));
            }
        }
        return rects;
    }
}
