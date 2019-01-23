namespace geometry 
{ 
    public class MatOfPoint : Mat
    {
        private static int _depth = 4;
        private static int _channels = 2;

        public MatOfPoint() 
        {
            base();
        }
        
        public void alloc(int elemNumber)
        {
            if(elemNumber>0)
                base.create(elemNumber, 1, makeType(_depth, _channels));
        }

        public static int makeType(int depth, int channels) 
        {
            if (channels <= 0 || channels >= 512) {
                stderr.printf("Channels count should be 1..%d",(512 - 1));
            }
            if (depth < 0 || depth >= (1 << 3)) {
                stderr.printf("Data type depth should be 0..%d",((1 << 3) - 1));
            }
            return (depth & ((1 << 3) - 1)) + ((channels - 1) << 3);
        }

        public void fromArray(geometry.Point a[])
        {
            if(a==null || a.length==0)
                return;
            int num = a.length;
            alloc(num);
            int buff[] = new int[num * _channels];
            for(int i=0; i<num; i++) {
                geometry.Point p = a[i];
                buff[_channels*i+0] = (int) p.x;
                buff[_channels*i+1] = (int) p.y;
            }
            put(0, 0, buff); //TODO: check ret val!
        }
    }
}
