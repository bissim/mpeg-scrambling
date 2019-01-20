using OpenCV;
using Gee;
using geometry;
using GLib;

namespace com.facedetect.strategies
{
	public class OpenCVSmileDetector : FaceDetectorInterface<geometry.Rectangle> 
	{
		//Attenzione File è un'interfaccia
		private GLib.File image;
		private GLib.File templateList;

		public OpenCVSmileDetector(GLib.File image, GLib.File templateList)
		{
			this.image = image;
			this.templateList = templateList;
		}

		public Gee.List<geometry.Rectangle> detectFaces() 
		{
			Gee.List<geometry.Rectangle> rects = new Gee.ArrayList<geometry.Rectangle>();
			OpenCV.HaarClassifierCascade faceDetector = new OpenCV.HaarClassifierCascade();
			OpenCV.Matrix faceDetections = new OpenCV.Matrix(); //non esiste costruttore vuoto
			
			for(int i=0; i<templateList.listFiles().length; i++) //metodo listFiles() inesistente
			{
				OpenCV.Matrix image = Imgcodecs.imread(this.image.get_path());
				faceDetector.load(templateList.listFiles()[i].get_path()); //numero parametri del metodo load diverso
				faceDetector.detectMultiScale(image, faceDetections);      //metodo con firma diversa
				
				for (geometry.Rectangle rect in faceDetections.toArray()) 
				{
					rects.add(new geometry.Rectangle(rect.x, rect.y, rect.width, rect.height));
				}
			}
			return rects;
		}
	}
}
