using OpenCV;
using Gee;
using geometry;
using GLib;

namespace com.facedetect.strategies
{
	public class OpenCVSmileDetector : Object, FaceDetectorInterface<geometry.Rectangle> 
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
			//OpenCV.HaarClassifierCascade faceDetector = new OpenCV.HaarClassifierCascade(); no costruttore vuoto
			geometry.MatOfRect faceDetections = new geometry.MatOfRect();
			
			/* for(int i=0; i<templateList.listFiles().length; i++) //metodo listFiles() inesistente
			{*/
				geometry.Mat image; // = Imgcodecs.imread(this.image.get_path());
				//faceDetector.load(templateList.listFiles()[i].get_path()); //numero parametri del metodo load diverso
				//faceDetector.detectMultiScale(image, faceDetections);      //metodo con firma diversa
				
				foreach(geometry.Rectangle rect in faceDetections.toArray()) 
				{
					rects.add(new geometry.Rectangle.withBounds(rect.x, rect.y, rect.width, rect.height));
				}
			//}
			return rects;
		}
	}
}
