import org.opencv.core.Core;
import org.opencv.core.Mat;
import org.opencv.core.MatOfPoint;
import org.opencv.core.MatOfRect;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.core.Size;
import org.opencv.imgcodecs.Imgcodecs;
import org.opencv.imgproc.Imgproc;
import org.opencv.objdetect.CascadeClassifier;

import com.facedetect.FaceDetector;
import com.facedetect.strategies.OpenCVFaceDetector;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.StringTokenizer;

using OpenCV;
using geometry;
using GLib;
using Gee;
using imgcodecs;
using classifier;

public class Scrambling : Object 
{

    public static int main(string[] args) throws Error 
    {
        if(args.length != 4)
        {
			throw new Error("Passaggio dei parametri non corretto!");
		}
		
		int w = 0;
		int h = 0;
		string path = "";
		string file_format = "bmp";
		int rgb;
		
		w = int.parse(args[0]);           
		h = int.parse(args[1]);           
		path = args[2]; 
		
		string n_frame = args[3];
	
		string fileY = path+"~Y.txt";
		string fileU = path+"~U.txt";
		string fileV = path+"~V.txt";
			
		stdout.printf("Scrambling...  frame: %s",n_frame);
		stdout.printf("Apro il file %s",fileY);
		stdout.printf("Apro il file %s",fileU);
		stdout.printf("Apro il file %s",fileV);
		
		BufferedImage biY;                 //controlla!!!
		BufferedImage bi;                  //controlla!!!
		Scanner input;
        int i,j, block, block_i, block_j, count;
        int [][] matrix;
		
		////////////////////////////////////////////////////////////////////////////////
		///////////// CREO L'IMMAGINE A PARTIRE DAL FILE TXT PROVENIENTE DA C //////////
		///////////// //////////////CONTENENTE IL FRAME Y //////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
		
		biY = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB); //controlla!!!
		input = new Scanner(new File(fileY));     //controlla!!!
        i = 0;
        j = 0;
        matrix = new int[h][w];
        block = 0;
        block_i = 0;
        block_j = 0;
        count = 0;
        
        while(input.hasNextLine()) 
        {
            string st[] = string.split(input.nextLine(),0);
        	int k = 0;
            while (k < st.length)
            {
        		int a = int.parse(st[k]);
        		matrix[i+block_i][j+block_j] = a;
                j++;
                k++;
            }
        	
        	i++;
        	j = 0;
        	
        
            if(i == 8) 
            {
        		i = 0;
        		j = 0;
        		block_j += 8;
                if(block_j >= w) 
                {
        			block_j = 0;
        			block_i += 8;
        		}
        		
                if(block_i >= h) 
                {
        			block_i = 0;
        			break;
                }	
                
        	}
        }
        
        for(i = 0;i < h;i++) 
        {
            for(j = 0;j < w;j++) 
            {
        		int a = matrix[i][j];
                if(a <= 255 && a >= 0)
                {
            		rgb = new geometry.Color(a,a,a).getRGB();
                }
                else
                {
            		rgb = new geometry.Color(0,0,0).getRGB();
            	}
        		
            	biY.setRGB(j,i,rgb);
        	}
        }
	      
        /////////////////////////////////////////////////////////
        // SALVO L'IMMAGINE A PARTIRE DALLA MATRICE COSTRUTITA //
        /////////////////////////////////////////////////////////
        
        File outputfileY = new File(fileY+"."+file_format);
        ImageIO.write(biY, file_format, outputfileY);
        
        
		////////////////////////////////////////////////////////////////////////////////
		///////////// CREO L'IMMAGINE A PARTIRE DAL FILE TXT PROVENIENTE DA C //////////
		///////////// CONTENENTE IL FRAME U ////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
        
        bi = new BufferedImage(w/2, h/2, BufferedImage.TYPE_INT_RGB);
		input = new Scanner(new File(fileU));
        i = 0;
        j = 0;
        matrix = new int[h/2][w/2];
        block = 0;
        block_i = 0;
        block_j = 0;
        count = 0;
        
        while(input.hasNextLine()) {
        	StringTokenizer st = new StringTokenizer(input.nextLine(),",");
        	
        	while (st.hasMoreTokens()){
        		int a = Integer.parseInt(st.nextToken());
        		matrix[i+block_i][j+block_j] = a;
        		j++;
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
        
        for(i = 0;i < h/2;i++) {
        	for(j = 0;j < w/2;j++) {
        		int a = matrix[i][j];
        		rgb = new Color(a,a,a).getRGB();
            	bi.setRGB(j,i,rgb);
        	}
        }
	       
		/////////////////////////////////////////////////////////
		// SALVO L'IMMAGINE A PARTIRE DALLA MATRICE COSTRUTITA //
		/////////////////////////////////////////////////////////
        
        File outputfileU = new File(fileU+"."+file_format);
        ImageIO.write(bi, file_format, outputfileU);
        
       
        ////////////////////////////////////////////////////////////////////////////////
		///////////// CREO L'IMMAGINE A PARTIRE DAL FILE TXT PROVENIENTE DA C //////////
		///////////// CONTENENTE IL FRAME V ////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
        
        
        bi = new BufferedImage(w/2, h/2, BufferedImage.TYPE_INT_RGB);
		input = new Scanner(new File(fileV));
        i = 0;
        j = 0;
        matrix = new int[h/2][w/2];
        block = 0;
        block_i = 0;
        block_j = 0;
        count = 0;
        
        while(input.hasNextLine()) {
        	StringTokenizer st = new StringTokenizer(input.nextLine(),",");
        	
        	while (st.hasMoreTokens()){
        		int a = Integer.parseInt(st.nextToken());
        		matrix[i+block_i][j+block_j] = a;
        		j++;
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
        
        for(i = 0;i < h/2;i++) {
        	for(j = 0;j < w/2;j++) {
        		int a = matrix[i][j];
        		if(a <= 255 && a >= 0){
            		rgb = new Color(a,a,a).getRGB();
            	}else{
            		rgb = new Color(0,0,0).getRGB();
            	}
        		
            	bi.setRGB(j,i,rgb);
        	}
        }
	       
        // SALVO L'IMMAGINE A PARTIRE DALLA MATRICE COSTRUITA
        File outputfileV = new File(fileV+"."+file_format);
        ImageIO.write(bi, file_format, outputfileV);
        
        
        
		//////////////////////////////////////////////////////////////////////////
		// APPLICO LO SCRAMBLING SULLA LUMINANZA DEL FRAME PER CALCOLARE LE ROI //
		//////////////////////////////////////////////////////////////////////////
           
        ArrayList<String> strategies = new ArrayList<String>();
        strategies.add("xml/lbpcascade_frontalface.xml");
        strategies.add("xml/lbpcascade_frontalcatface.xml");
        strategies.add("xml/lbpcascade_frontalface_improved.xml");
        strategies.add("xml/lbpcascade_profileface.xml");
        strategies.add("xml/lbpcascade_silverware.xml");
        strategies.add("xml/haarcascade_eye.xml");
        strategies.add("xml/haarcascade_profileface.xml");
        strategies.add("xml/haarcascade_frontalface_alt.xml");
        
        
        // DEFINISCO LA STRATEGIA DI RICERCA
        Mat image = Imgcodecs.imread(outputfileY.getAbsolutePath(), Imgcodecs.IMREAD_COLOR);
        
        if(image.empty()) {
        	System.out.println("Immagine non caricata!");
        	return;
        }
        
        List<MatOfPoint> pts = new ArrayList<MatOfPoint>();
        CascadeClassifier faceDetector;
        List<Rectangle> rettangoli = new ArrayList<Rectangle>();
        
        int faces = 0;
        for(String strategy : strategies) {
        	
        	faceDetector = new CascadeClassifier(strategy);
        	
	        MatOfRect faceVectors = new MatOfRect();
	        faceDetector.detectMultiScale(image, faceVectors);
	
	        if(faceVectors.toArray().length > faces) {
	        	faces = faceVectors.toArray().length;
	        }
		
	        for(Rect rect : faceVectors.toArray()) {
	        	rettangoli.add(new Rectangle(rect.x, rect.y, rect.width, rect.height));
	        }
	        
	        rettangoli = Support.checkOverlapResult(rettangoli);
        }
        
        
		//////////////////////////////////////////////////////////////////////////
		///// CREO IL FILE JSON CON LE EVENTUALI ROI CALCOLATE SULL'IMMAGINE /////
		//////////////////////////////////////////////////////////////////////////
        
        FileOutputStream xml_roi = new FileOutputStream(path+"~ROI.json");
        PrintStream scrivi_xml = new PrintStream(xml_roi);
        scrivi_xml.print("{\""+n_frame+"\":[");
        int cont_t = 0;
        
        // CONVERTO LE SEZIONI INVIDIDUATE IN QUADRATI E LI SOVRASCRIVO ALL'IMMAGINE
        for (Rectangle rect : rettangoli) {
        	
        	Point[] rook_points = new Point[4];
            rook_points[0]  = new Point(rect.x,rect.y);
            rook_points[1]  = new Point(rect.x + rect.width, rect.y);
            rook_points[2]  = new Point(rect.x + rect.width, rect.y + rect.height);
            rook_points[3]  = new Point(rect.x, rect.y + rect.height);
            
            MatOfPoint matPt = new MatOfPoint();
            matPt.fromArray(rook_points);
            
            pts.add(matPt);
            
            if(cont_t == rettangoli.size()-1)
            	scrivi_xml.print("{\"x\":"+rect.getX()+",\"y\":"+rect.getY()+",\"w\":"+rect.getWidth()+",\"h\":"+rect.getHeight()+"}");
            else
            	scrivi_xml.print("{\"x\":"+rect.getX()+",\"y\":"+rect.getY()+",\"w\":"+rect.getWidth()+",\"h\":"+rect.getHeight()+"},");
            cont_t++;
            
        }
        scrivi_xml.print("]}");
        
        
        // SALVO L'IMMAGINE CON LE MASCHERE UTILE SOLO AI FINI DI DEBUGGING
        Point[] rook_points2 = new Point[4];
        rook_points2[0]  = new Point(0,0);
        rook_points2[1]  = new Point(w,0);
        rook_points2[2]  = new Point(w,h);
        rook_points2[3]  = new Point(0,h);
        MatOfPoint matPt2 = new MatOfPoint();
        matPt2.fromArray(rook_points2);
        
        List<MatOfPoint> pts2 = new ArrayList<MatOfPoint>();
        pts2.add(matPt2);
        Imgproc.fillPoly(image,pts2,new Scalar(255,255,255));
        
        Imgproc.fillPoly(image,pts,new Scalar(0,0,0));
        Imgcodecs.imwrite(fileY+"_scramb."+file_format, image);
        
        
        System.out.println("Ultimate scrambling frame: "+n_frame);
        System.out.println("***** FACCE TROVATE: "+faces+" *****");
        
        return;
	}

}


class Support{

/**
 * Questo metodo verifica la presenza di risultati duplicati (più strategie trovano la stessa faccia)
 * o di risultati che si intersecano fra loro (facce vicine fra loro). Nel primo caso viene eliminato
 * un risultato, nel secondo caso viene creato un nuovo rettangolo che sia l'unione dei due.
 * @param rects lista dei volti trovati dalle strategie con duplicati
 * @return List<Rectangle> lista dei volti senza duplicati
 */
static public List<Rectangle> checkOverlapResult(List<Rectangle> rects) {
    boolean overlap = true;
    while(overlap) {
        overlap=false;
        try {
            for (int i = 0; i < rects.size(); i++) {
                for (int j = 0; j < rects.size(); j++) {
                    if (i == j) continue;
                    if (rects.get(i).contains(rects.get(j))) {
                        rects.remove(j);
                        overlap = true;
                        j--;
                        if (i == rects.size()) i--;
                    }

                }
            }
            for (int i = 0; i < rects.size(); i++) {
                for (int j = 0; j < rects.size(); j++) {
                    if (i == j) continue;
                    if (overlaps(rects.get(i), rects.get(j))) {
                        java.awt.Rectangle r = rects.get(i).union(rects.get(j));
                        rects.remove(i);
                        rects.add(i, r);
                        rects.remove(j);
                        overlap = true;
                        j--;

                    }

                }
            }
        } catch (Exception e) {
        }
    }
    return rects;
}

/**
 * Questo metodo controlla se due rettangoli si intersecano fra loro
 * @param r1 Primo rettangolo
 * @param r2 Secondo rettangolo
 * @return true se r1 interseca r2, false altrimenti
 */
private static boolean overlaps (Rectangle r1, Rectangle r2) {
    return r2.x < r1.x + r1.width && r2.x + r2.width > r1.x && r2.y < r1.y + r1.height && r2.y + r2.height > r1.y;
}

}

