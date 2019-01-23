using geometry;

namespace imgcodecs
{ 
    public class Imgcodecs : Object
    {
        public const int IMREAD_COLOR = 1;

        public static geometry.Mat imread(string filename)
        {
            geometry.Mat retVal = new geometry.Mat.addr(imread_1(filename));
            return retVal;
        }

        public static geometry.Mat imread2(string filename, int flags)
        {
            geometry.Mat retVal = new geometry.Mat.addr(imread_0(filename, flags));
            return retVal;
        }

        public static bool imwrite(string filename, geometry.Mat img)
        {
            bool retVal = imwrite_1(filename, img.nativeObj);
            return retVal;
        }

        // C++:  Mat imread(String filename, int flags = IMREAD_COLOR)
        private static extern long imread_0(string filename, int flags);

        private static extern long imread_1(string filename);

        private static extern bool imwrite_1(string filename, long img_nativeObj);
    }
}
