namespace geometry
{
    public class MatOfRect : geometry.Mat 
    {
        private static int _channels = 4;

        public MatOfRect() 
        {
            base();
        }


        public geometry.Rectangle[] toArray() 
        {
            int num = (int) total();
            geometry.Rectangle[] a = new geometry.Rectangle[num];
            if(num == 0)
                return a;
            int buff[] = new int[num * _channels];
            get(0, 0, buff); //TODO: check ret val! (da eliminare(?))
            for(int i=0; i<num; i++)
                a[i] = new geometry.Rectangle.withBounds(buff[i*_channels], buff[i*_channels+1], buff[i*_channels+2], buff[i*_channels+3]);
            return a;
        }
    }
}
