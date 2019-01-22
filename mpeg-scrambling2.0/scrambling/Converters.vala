using Gee;
using geometry;

namespace imgproc
{ 
    public class Converters : Object
    {
        public static geometry.Mat vector_vector_Point_to_Mat(Gee.List<geometry.MatOfPoint> pts, Gee.List<geometry.Mat> mats) 
        {
            geometry.Mat res;
            int lCount = (pts != null) ? pts.size : 0;

            if (lCount > 0) 
            {
                foreach(geometry.MatOfPoint vpt in pts)
                    mats.add(vpt);
                res = vector_Mat_to_Mat(mats);
            }
            else 
            {
                res = new geometry.Mat();
            }

            return res;
        }

        public static Mat vector_Mat_to_Mat(Gee.List<geometry.Mat> mats) 
        {
            geometry.Mat res;
            int count = (mats != null) ? mats.size : 0;

            if (count > 0) 
            {
                res = new geometry.Mat.multi(count, 1, 12);
                int[] buff = new int[count * 2];

                for (int i = 0; i < count; i++) 
                {
                    long addr = mats.get(i).nativeObj;
                    buff[i * 2] = (int) (addr >> 32);
                    buff[i * 2 + 1] = (int) (addr & 0xffffffff);
                }

                res.put(0, 0, buff);
            } 
            else 
            {
                res = new geometry.Mat();
            }

            return res;
        }
    }
}
