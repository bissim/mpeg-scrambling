namespace geometry
{
    public class Mat : Object
    {
        public long nativeObj;

        public Mat()
        {
            nativeObj = n_Mat();
        }

        public Mat.addr(long addr)
        {
            /* if (addr == 0)
                throw new java.lang.UnsupportedOperationException("Native object address is NULL");*/
            nativeObj = addr;
        }

        public long total()
        {
            long retVal = n_total(nativeObj);
            return retVal;
        }

        public int get(int row, int col, int[] data) 
        {
            return nGetI(nativeObj, row, col, data.length, data);
        }

         // C++: Mat::Mat()
        private static extern long n_Mat();

        // C++: size_t Mat::total()
        private static extern long n_total(long nativeObj);

        private static extern int nGetI(long self, int row, int col, int count, int[] vals);
    }
}