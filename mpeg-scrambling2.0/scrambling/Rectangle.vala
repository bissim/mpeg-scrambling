using GLib;

namespace geometry
{
    /**
     * This class is a partial port of java.awt.Rectangle class.
     */
    public class Rectangle: Object
    {
        public int x {get; set; default = 0;}
        public int y {get; set; default = 0;}
        public int width {get; set; default = 0;}
        public int height {get; set; default = 0;}

        public Rectangle()
        {
            this(0, 0, 0, 0);
        }

        public Rectangle.withBounds(int x, int y, int width, int height)
        {
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
        }

        public Rectangle.withRectangle(Rectangle r)
        {
            this(r.x, r.y, r.width, r.height);
        }

        public bool contains(int X, int Y, int W, int H)
        {
            int w = this.width;
            int h = this.height;
            // check whether one of dimensions is negative
            if ((w | h | W | H) < 0)
            {
                return false;
            }

            int x = this.x;
            int y = this.y;
            if (X < x || Y < y)
            {
                return false;
            }

            w += x;
            W += X;
            if (W <= X) {
                // X+W overflowed or W was zero, return false if...
                // either original w or W was zero or
                // x+w did not overflow or
                // the overflowed x+w is smaller than the overflowed X+W
                if (w >= x || W > w) return false;
            } else {
                // X+W did not overflow and W was not zero, return false if...
                // original w was zero or
                // x+w did not overflow and x+w is smaller than X+W
                if (w >= x && W > w) return false;
            }
            h += y;
            H += Y;
            if (H <= Y) {
                if (h >= y || H > h) return false;
            } else {
                if (h >= y && H > h) return false;
            }

            return true;
        }

        public Rectangle union(Rectangle rectangle)
        {
            long tx2 = this.width;
            long ty2 = this.height;
            if ((tx2 | ty2) < 0) {
                // This rectangle has negative dimensions...
                // If r has non-negative dimensions then it is the answer.
                // If r is non-existant (has a negative dimension), then both
                // are non-existant and we can return any non-existant rectangle
                // as an answer.  Thus, returning r meets that criterion.
                // Either way, r is our answer.
                return new Rectangle.withRectangle(r);
            }

            long rx2 = r.width;
            long ry2 = r.height;
            if ((rx2 | ry2) < 0) {
                return new Rectangle.withRectangle(this);
            }

            int tx1 = this.x;
            int ty1 = this.y;
            tx2 += tx1;
            ty2 += ty1;
            int rx1 = r.x;
            int ry1 = r.y;
            rx2 += rx1;
            ry2 += ry1;
            if (tx1 > rx1) tx1 = rx1;
            if (ty1 > ry1) ty1 = ry1;
            if (tx2 < rx2) tx2 = rx2;
            if (ty2 < ry2) ty2 = ry2;
            tx2 -= tx1;
            ty2 -= ty1;
            // tx2,ty2 will never underflow since both original rectangles
            // were already proven to be non-empty
            // they might overflow, though...
            if (tx2 > int.MAX) tx2 = int.MAX;
            if (ty2 > int.MAX) ty2 = int.MAX;
            return new Rectangle(tx1, ty1, (int) tx2, (int) ty2);
        }
    }
}

return;
