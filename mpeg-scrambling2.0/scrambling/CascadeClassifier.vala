using geometry;

namespace classifier 
{ 
    public class CascadeClassifier : Object
    {

        protected long nativeObj;
    
        public CascadeClassifier()
        {
            nativeObj = CascadeClassifier_1();
            return;
        }

        public CascadeClassifier.s(string filename)
        {
            nativeObj = CascadeClassifier_0(filename);
            return;
        }

        public bool load(string filename)
        {
            bool retVal = load_0(nativeObj, filename);
            return retVal;
        }

        public void detectMultiScale(geometry.Mat image, geometry.MatOfRect objects)
        {
            geometry.Mat objects_mat = objects;
            detectMultiScale_1(nativeObj, image.nativeObj, objects_mat.nativeObj);
            return;
        }

        // C++:   CascadeClassifier(String filename)
        private static extern long CascadeClassifier_0(string filename);

        // C++:   CascadeClassifier()
        private static extern long CascadeClassifier_1();

        // C++:  bool load(String filename)
        private static extern bool load_0(long nativeObj, string filename);

        private static extern void detectMultiScale_1(long nativeObj, long image_nativeObj, long objects_mat_nativeObj);

    }
}
