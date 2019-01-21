using OpenCV;
using geometry;

namespace imgcodecs
{ 
    public class Imgcodecs : Object
    {
        public static geometry.Mat imread(string filename)
        {
            geometry.Mat retVal = new geometry.Mat.addr(imread_1(filename));
            return retVal;
        }

        private static extern long imread_1(string filename);
    }
}
