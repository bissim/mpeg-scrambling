using OpenCV;
using geometry;
using GLib;
using Gee;
using imgcodecs;
using classifier;
using Gdk;
using imgproc;

public int run(string[] args) //throws Error 
    {
        if(args.length != 4)
        {
            stderr.printf("Passaggio dei parametri non corretto!");
            return -1;
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
	
		string fileY = path.concat("~Y.txt");
		string fileU = path.concat("~U.txt");
		string fileV = path.concat("~V.txt");
			
		stdout.printf("Scrambling...  frame: %s",n_frame);
		stdout.printf("Apro il file %s",fileY);
		stdout.printf("Apro il file %s",fileU);
		stdout.printf("Apro il file %s",fileV);
		
		Gdk.Pixbuf biY;                 
		Gdk.Pixbuf bi;                  
		GLib.Scanner input;
        int i,j, block, block_i, block_j, count;
        int [,] matrix;
		
		////////////////////////////////////////////////////////////////////////////////
		///////////// CREO L'IMMAGINE A PARTIRE DAL FILE TXT PROVENIENTE DA C //////////
		///////////// //////////////CONTENENTE IL FRAME Y //////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
		
        biY = new Gdk.Pixbuf.from_file_at_size(fileY.concat(".").concat(file_format), w, h); //controllare!!!
        GLib.File inputFileY = GLib.File.new_for_path(fileY);     
        FileIOStream ioFileY = inputFileY.create_readwrite(FileCreateFlags.PRIVATE);
        FileInputStream @isY = ioFileY.input_stream as FileInputStream;
        DataInputStream disY = new DataInputStream(@isY);

        i = 0;
        j = 0;
        matrix = new int[h,w];
        block = 0;
        block_i = 0;
        block_j = 0;
        count = 0;
        string line;
        while((line = disY.read_line()) != null) 
        {
            string st[] = line.split(",",0);   //controllare se prende una  riga. 
        	int k = 0;
            while (k < st.length)
            {
        		int a = int.parse(st[k]);
        		matrix[i+block_i , j+block_j] = a;
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
        		int a = matrix[i,j];
                if(a <= 255 && a >= 0)
                {
            		rgb = (new geometry.Color(a,a,a)).getRGB();   //controlla!!
                }
                else
                {
            		rgb = (new geometry.Color(0,0,0)).getRGB();  //controlla!!
            	}
        	
                (biY.get_pixels())[j*i] = (uint8) rgb;   //controllare!!!!
        	}
        }
	      
        /////////////////////////////////////////////////////////
        // SALVO L'IMMAGINE A PARTIRE DALLA MATRICE COSTRUTITA //
        /////////////////////////////////////////////////////////
        
        biY.save(fileY.concat(".").concat(file_format),"bmp");
        
        
		////////////////////////////////////////////////////////////////////////////////
		///////////// CREO L'IMMAGINE A PARTIRE DAL FILE TXT PROVENIENTE DA C //////////
		//////////////////////////CONTENENTE IL FRAME U ////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
        
        bi = new Gdk.Pixbuf.from_file_at_size(fileU.concat(".").concat(file_format), w/2, h/2);
        //  input = new GLib.Scanner(ScannerConfig());
        //  input.input_file(GLib.File.new_for_path(fileU));

        GLib.File inputFileU = GLib.File.new_for_path(fileU);     
        FileIOStream ioFileU = inputFileU.create_readwrite(FileCreateFlags.PRIVATE);
        FileInputStream @isU = ioFileU.input_stream as FileInputStream;
        DataInputStream disU = new DataInputStream(@isU);

        i = 0;
        j = 0;
        matrix = new int[h/2,w/2];
        block = 0;
        block_i = 0;
        block_j = 0;
        count = 0;
        
        while((line = disU.read_line()) != null) 
        {
            string st[] = line.split(",",0);   //controllare se prende una  riga. 
        	int k = 0;
            while (k < st.length)
            {
        		int a = int.parse(st[k]);
        		matrix[i+block_i , j+block_j] = a;
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
                if(block_j >= w/2) 
                {
        			block_j = 0;
        			block_i += 8;
        		}
        		
                if(block_i >= h/2) 
                {
        			block_i = 0;
        			break;
        		}	
        	}
        }
        
        for(i = 0;i < h/2;i++) 
        {
            for(j = 0;j < w/2;j++) 
            {
        		int a = matrix[i,j];
        		rgb = (new geometry.Color(a,a,a)).getRGB();
                (bi.get_pixels())[j*i] = (uint8) rgb;
        	}
        }
	       
		/////////////////////////////////////////////////////////
		// SALVO L'IMMAGINE A PARTIRE DALLA MATRICE COSTRUTITA //
		/////////////////////////////////////////////////////////
        
        bi.save(fileU.concat(".").concat(file_format),"bmp");
        
       
        ////////////////////////////////////////////////////////////////////////////////
		///////////// CREO L'IMMAGINE A PARTIRE DAL FILE TXT PROVENIENTE DA C //////////
		///////////// CONTENENTE IL FRAME V ////////////////////////////////////////////
		////////////////////////////////////////////////////////////////////////////////
        
        
        bi = new Gdk.Pixbuf.from_file_at_size(fileV.concat(".").concat(file_format), w/2, h/2);
        //  input = new GLib.Scanner(ScannerConfig());
        //  input.input_file(GLib.File.new_for_path(fileV));

        GLib.File inputFileV = GLib.File.new_for_path(fileV);     
        FileIOStream ioFileV = inputFileV.create_readwrite(FileCreateFlags.PRIVATE);
        FileInputStream @isV = ioFileV.input_stream as FileInputStream;
        DataInputStream disV = new DataInputStream(@isV);

        i = 0;
        j = 0;
        matrix = new int[h/2,w/2];
        block = 0;
        block_i = 0;
        block_j = 0;
        count = 0;

        while((line = disV.read_line()) != null) 
        {
            string st[] = line.split(",",0);   //controllare se prende una  riga.  
        	int k = 0;
            while (k < st.length)
            {
        		int a = int.parse(st[k]);
        		matrix[i+block_i , j+block_j] = a;
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
                if(block_j >= w/2) 
                {
        			block_j = 0;
        			block_i += 8;
        		}
        		
                if(block_i >= h/2) 
                {
        			block_i = 0;
        			break;
        		}	
        	}
        }
        
        for(i = 0;i < h/2;i++) 
        {
            for(j = 0;j < w/2;j++) 
            {
        		int a = matrix[i,j];
                if(a <= 255 && a >= 0)
                {
            		rgb = (new geometry.Color(a,a,a)).getRGB();
                }
                else
                {
            		rgb = (new geometry.Color(0,0,0)).getRGB();
                }
                
                (bi.get_pixels())[j*i] = (uint8) rgb;
        	}
        }
	       
        // SALVO L'IMMAGINE A PARTIRE DALLA MATRICE COSTRUITA
        
        bi.save(fileV.concat(".").concat(file_format),"bmp");
        
        
		//////////////////////////////////////////////////////////////////////////
		// APPLICO LO SCRAMBLING SULLA LUMINANZA DEL FRAME PER CALCOLARE LE ROI //
		//////////////////////////////////////////////////////////////////////////
           
        Gee.ArrayList<string> strategies = new Gee.ArrayList<string>();
        strategies.add("xml/lbpcascade_frontalface.xml");
        strategies.add("xml/lbpcascade_frontalcatface.xml");
        strategies.add("xml/lbpcascade_frontalface_improved.xml");
        strategies.add("xml/lbpcascade_profileface.xml");
        strategies.add("xml/lbpcascade_silverware.xml");
        strategies.add("xml/haarcascade_eye.xml");
        strategies.add("xml/haarcascade_profileface.xml");
        strategies.add("xml/haarcascade_frontalface_alt.xml");
        
        
        // DEFINISCO LA STRATEGIA DI RICERCA
        geometry.Mat image = imgcodecs.Imgcodecs.imread2(fileY.concat(".").concat(file_format), imgcodecs.Imgcodecs.IMREAD_COLOR);
        
        if(image.empty())    
        {
        	stdout.printf("Immagine non caricata!");
        	return -1;
        }
        
        Gee.List<geometry.MatOfPoint> pts = new Gee.ArrayList<geometry.MatOfPoint>();
        classifier.CascadeClassifier faceDetector;
        Gee.List<geometry.Rectangle> rettangoli = new Gee.ArrayList<geometry.Rectangle>();
        
        int faces = 0;
        foreach(string strategy in strategies) 
        {
        	
        	faceDetector = new classifier.CascadeClassifier.s(strategy);   
        	
	        geometry.MatOfRect faceVectors = new geometry.MatOfRect();
	        faceDetector.detectMultiScale(image, faceVectors);
	
            if(faceVectors.toArray().length > faces) 
            {
	        	faces = faceVectors.toArray().length;
	        }
		
            foreach(geometry.Rectangle rect in faceVectors.toArray()) 
            {
	        	rettangoli.add(new geometry.Rectangle.withBounds(rect.x, rect.y, rect.width, rect.height));
	        }
	        
	        rettangoli = Support.checkOverlapResult(rettangoli);
        }
        
        
		//////////////////////////////////////////////////////////////////////////
		///// CREO IL FILE JSON CON LE EVENTUALI ROI CALCOLATE SULL'IMMAGINE /////
		//////////////////////////////////////////////////////////////////////////
        
        File roifile = File.new_for_path(path.concat("~ROI.json"));
        FileIOStream ios = roifile.create_readwrite(FileCreateFlags.PRIVATE);

        FileOutputStream os = ios.output_stream as FileOutputStream;
        DataOutputStream roiprintable = new DataOutputStream (os);
        roiprintable.put_string("{\"" + n_frame + "\":[");

        int cont_t = 0;

        
        // CONVERTO LE SEZIONI INVIDIDUATE IN QUADRATI E LI SOVRASCRIVO ALL'IMMAGINE
        foreach (geometry.Rectangle rect in rettangoli) 
        {
        	
        	geometry.Point[] rook_points = new geometry.Point[4];
            rook_points[0]  = new geometry.Point(rect.x,rect.y);
            rook_points[1]  = new geometry.Point(rect.x + rect.width, rect.y);
            rook_points[2]  = new geometry.Point(rect.x + rect.width, rect.y + rect.height);
            rook_points[3]  = new geometry.Point(rect.x, rect.y + rect.height);
            
            geometry.MatOfPoint matPt = new geometry.MatOfPoint();
            matPt.fromArray(rook_points);
            
            pts.add(matPt);
            
            if(cont_t == rettangoli.size -1)
                roiprintable.put_string("{\"x\":".concat(rect.x.to_string()).concat(",\"y\":").concat(rect.y.to_string()).concat(",\"w\":").concat(rect.width.to_string()).concat(",\"h\":").concat(rect.height.to_string()).concat("}"));
                
            else
                roiprintable.put_string("{\"x\":".concat(rect.x.to_string()).concat(",\"y\":").concat(rect.y.to_string()).concat(",\"w\":").concat(rect.width.to_string()).concat(",\"h\":").concat(rect.height.to_string()).concat("}"));
            cont_t++;
            
        }
        roiprintable.put_string("]}");
        
        
        // SALVO L'IMMAGINE CON LE MASCHERE UTILE SOLO AI FINI DI DEBUGGING
        geometry.Point[] rook_points2 = new geometry.Point[4];
        rook_points2[0]  = new geometry.Point(0,0);
        rook_points2[1]  = new geometry.Point(w,0);
        rook_points2[2]  = new geometry.Point(w,h);
        rook_points2[3]  = new geometry.Point(0,h);
        geometry.MatOfPoint matPt2 = new geometry.MatOfPoint();
        matPt2.fromArray(rook_points2);
        
        Gee.List<geometry.MatOfPoint> pts2 = new Gee.ArrayList<geometry.MatOfPoint>();
        pts2.add(matPt2);
        imgproc.Imgproc.fillPoly(image,pts2,new geometry.Scalar(255,255,255));
        
        imgproc.Imgproc.fillPoly(image,pts,new geometry.Scalar(0,0,0));
        imgcodecs.Imgcodecs.imwrite(fileY.concat("_scramb.").concat(file_format), image);
        
        
        stdout.printf("Ultimate scrambling frame: %s",n_frame);
        stdout.printf("***** FACCE TROVATE: ".concat(faces.to_string()).concat(" *****"));
        
        return 0;
	}


class Support : Object
{

    /**
     * Questo metodo verifica la presenza di risultati duplicati (più strategie trovano la stessa faccia)
     * o di risultati che si intersecano fra loro (facce vicine fra loro). Nel primo caso viene eliminato
     * un risultato, nel secondo caso viene creato un nuovo rettangolo che sia l'unione dei due.
     * @param rects lista dei volti trovati dalle strategie con duplicati
     * @return List<Rectangle> lista dei volti senza duplicati
     */
    public static Gee.List<geometry.Rectangle> checkOverlapResult(Gee.List<geometry.Rectangle> rects) 
    {
        bool overlap = true;
        while(overlap) 
        {
            overlap=false;
            try 
            {
                for (int i = 0; i < rects.size; i++) 
                {
                    for (int j = 0; j < rects.size; j++) 
                    {
                        if (i == j) continue;
                        if (rects.get(i).contains(rects.get(j))) 
                        {
                            rects.remove_at(j);
                            overlap = true;
                            j--;
                            if (i == rects.size) i--;
                        }

                    }
                }
                for (int i = 0; i < rects.size; i++) 
                {
                    for (int j = 0; j < rects.size; j++) 
                    {
                        if (i == j) continue;
                        if (overlaps(rects.get(i), rects.get(j))) 
                        {
                            geometry.Rectangle r = rects.get(i).union(rects.get(j));
                            rects.remove_at(i);
                            rects.insert(i, r);
                            rects.remove_at(j);
                            overlap = true;
                            j--;

                        }

                    }
                }
            } 
            catch (Error e) 
            {

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
    private static bool overlaps (geometry.Rectangle r1, geometry.Rectangle r2) 
    {
        return r2.x < r1.x + r1.width && r2.x + r2.width > r1.x && r2.y < r1.y + r1.height && r2.y + r2.height > r1.y;
    }

}

