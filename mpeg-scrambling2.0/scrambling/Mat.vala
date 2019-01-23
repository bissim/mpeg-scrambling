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
            /* *if (addr == 0)
                throw new Error("Native object address is NULL");*/
            nativeObj = addr;
        }

        public Mat.multi(int rows, int cols, int type)
        {
            nativeObj = n_Mat2(rows, cols, type);
            return;
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

        public int put(int row, int col, int[] data)
        {
            int t = type();
            if (depth(t) == 4) 
            {
                return nPutI(nativeObj, row, col, data.length, data);
            }
            return -1;
            //throw Error("Mat data type is not compatible: ".concat(t.to_string()));
        }

        public int type()
        {
            int retVal = n_type(nativeObj);
            return retVal;
        }

        public static int depth(int type) 
        {
            return type & ((1 << 3) - 1);
        }
    

        public static int channels(int type) 
        {
            return (type >> 3) + 1;
        }

        public void create(int rows, int cols, int type)
        {
            n_create(nativeObj, rows, cols, type);
            return;
        }

        public bool empty()
        {
            bool retVal = n_empty(nativeObj);
            return retVal;
        }

         // C++: Mat::Mat()
        private static extern long n_Mat();

        // C++: Mat::Mat(int rows, int cols, int type)
        private static extern long n_Mat2(int rows, int cols, int type);

        // C++: size_t Mat::total()
        private static extern long n_total(long nativeObj);

        private static extern int nGetI(long self, int row, int col, int count, int[] vals);

        private static extern int nPutI(long self, int row, int col, int count, int[] data);

        // C++: int Mat::type()
        private static extern int n_type(long nativeObj);

        // C++: void Mat::create(int rows, int cols, int type)
        private static extern void n_create(long nativeObj, int rows, int cols, int type);

        // C++: bool Mat::empty()
        private static extern bool n_empty(long nativeObj);
    }
}