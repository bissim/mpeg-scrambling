using OpenCV;
using Gee;
using geometry;
using GLib;
using imgcodecs;
using classifier;

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
			classifier.CascadeClassifier faceDetector = new classifier.CascadeClassifier();
			geometry.MatOfRect faceDetections = new geometry.MatOfRect();
			
			/* for(int i=0; i<templateList.listFiles().length; i++) //metodo listFiles() inesistente
			{*/
				geometry.Mat image = imgcodecs.Imgcodecs.imread(this.image.get_path());
				faceDetector.load(""/*templateList.listFiles()[i].get_path()*/);
				faceDetector.detectMultiScale(image, faceDetections);
				
				foreach(geometry.Rectangle rect in faceDetections.toArray()) 
				{
					rects.add(new geometry.Rectangle.withBounds(rect.x, rect.y, rect.width, rect.height));
				}
			//}
			return rects;
		}
	}
}
