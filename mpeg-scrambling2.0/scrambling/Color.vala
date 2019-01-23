namespace geometry 
{ 
    public class Color : Object
    {
        public int value;

        public Color(int r, int g, int b) 
        {
            Colorf(r, g, b, 255);
        }

        public void Colorf(int r, int g, int b, int a) 
        {
            value = ((a & 0xFF) << 24) |
                    ((r & 0xFF) << 16) |
                    ((g & 0xFF) << 8)  |
                    ((b & 0xFF) << 0);
            testColorValueRange(r,g,b,a);
        }

        private static void testColorValueRange(int r, int g, int b, int a) 
        {
            bool rangeError = false;
            string badComponentString = "";
    
            if ( a < 0 || a > 255) {
                rangeError = true;
                badComponentString = badComponentString.concat(" Alpha");
            }
            if ( r < 0 || r > 255) {
                rangeError = true;
                badComponentString = badComponentString.concat(" Red");
            }
            if ( g < 0 || g > 255) {
                rangeError = true;
                badComponentString = badComponentString.concat(" Green");
            }
            if ( b < 0 || b > 255) {
                rangeError = true;
                badComponentString = badComponentString.concat(" Blue");
            }
            if ( rangeError == true ) {
                stderr.printf("Color parameter outside of expected range:".concat(badComponentString));
            }
        }

        public int getRGB()
        {
            return value;
        }    
    }
}