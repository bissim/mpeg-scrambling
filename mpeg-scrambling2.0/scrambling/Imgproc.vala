using geometry;
using Gee;

namespace imgproc
{ 
    public class Imgproc : Object
    {
        public static void fillPoly(geometry.Mat img, Gee.List<geometry.MatOfPoint> pts, geometry.Scalar color)
        {
            Gee.List<geometry.Mat> pts_tmplm = new Gee.ArrayList<geometry.Mat>(/*(pts != null) ? pts.size : 0*/);
            geometry.Mat pts_mat = imgproc.Converters.vector_vector_Point_to_Mat(pts, pts_tmplm);
            fillPoly_1(img.nativeObj, pts_mat.nativeObj, color.val[0], color.val[1], color.val[2], color.val[3]);
            return;
        }

        private static extern void fillPoly_1(long img_nativeObj, long pts_mat_nativeObj, double color_val0, double color_val1, double color_val2, double color_val3);
    }
}
