using OpenCV;
using Gee;
using geometry;
using GLib;
using imgcodecs;
using classifier;

namespace com.facedetect.strategies
{
    public class OpenCVFaceDetector : Object, FaceDetectorInterface<geometry.Rectangle>
    {
        private GLib.File image;
        private GLib.File templateList;

        public OpenCVFaceDetector(GLib.File image, GLib.File templateList)
        {
            this.image = image;
			this.templateList = templateList;
        }
        
        public Gee.List<geometry.Rectangle> detectFaces()
        {
            Gee.List<geometry.Rectangle> rects = new Gee.ArrayList<geometry.Rectangle>();
            classifier.CascadeClassifier faceDetector = new classifier.CascadeClassifier();
            geometry.MatOfRect faceDetections = new geometry.MatOfRect();
            for(int i=0; i<listFiles(templateList,"", new GLib.Cancellable()).size; i++)
            {
                geometry.Mat image = imgcodecs.Imgcodecs.imread(this.image.get_path());
                faceDetector.load(listFiles(templateList,"", new GLib.Cancellable()).get(i));
                faceDetector.detectMultiScale(image, faceDetections);
                foreach(geometry.Rectangle rect in faceDetections.toArray()) 
                {
                    rects.add(new geometry.Rectangle.withBounds(rect.x, rect.y, rect.width, rect.height));
                }
            }
            return rects;
        }

        public Gee.List<string> listFiles (GLib.File file, string space = "", GLib.Cancellable? cancellable = null) throws Error 
        {
			GLib.FileEnumerator enumerator = file.enumerate_children (
				"standard::*",
				FileQueryInfoFlags.NOFOLLOW_SYMLINKS, 
				cancellable);
		
            GLib.FileInfo info = null;
            
            Gee.ArrayList<string> filePaths = new Gee.ArrayList<string>();

            while (cancellable.is_cancelled () == false && ((info = enumerator.next_file (cancellable)) != null)) 
            {
                if (info.get_file_type () != FileType.DIRECTORY) 
                {
                    string path = file.get_path();
                    filePaths.add(path);
                }
			}
		
            if (cancellable.is_cancelled ()) 
            {
				throw new IOError.CANCELLED ("Operation was cancelled");
            }
            
            return filePaths;
        }
    }
}