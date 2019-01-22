namespace geometry
{ 
    public class Scalar : Object
    {
        public double val[];
        
        public Scalar(double v0, double v1, double v2) 
        {
            val = new double[] { v0, v1, v2, 0 };
        }
    }
}
