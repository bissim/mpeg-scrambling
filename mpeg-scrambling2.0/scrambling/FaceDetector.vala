using OpenCV; 
using Gee;
using geometry; 

namespace com.facedetect
{
    public class FaceDetector
    {
        private Gee.List<FaceDetectorInterface<geometry.Rectangle>> strategies;

        public FaceDetector()
        {
            strategies = new Gee.ArrayList<FaceDetectorInterface<geometry.Rectangle>>();
        }

        public void addStrategy(FaceDetectorInterface strategy)
        {
            strategies.add(strategy);
        }

        public Gee.List<geometry.Rectangle> applyStrategies()
        {
            Gee.List<geometry.Rectangle> rects = new Gee.ArrayList<geometry.Rectangle>();
            foreach (FaceDetectorInterface<geometry.Rectangle> strategy in strategies)
            {
                rects.add_all(strategy.detectFaces());
            }
            return checkOverlapResult(rects);
        }

        private Gee.List <geometry.Rectangle> checkOverlapResult(Gee.List<geometry.Rectangle>rects)
        {
            bool overlap = true; 
            while(overlap)
            {
                overlap = false;
                try
                {
                    for (int i = 0; i < rects.size; i++) {
                        for (int j = 0; j < rects.size; j++) {
                            if (i == j) continue;
                            if (rects.get(i).contains(rects.get(j))) {
                                rects.remove_at(j);
                                overlap = true;
                                j--;
                                if (i == rects.size) i--;
                            }

                        }
                    }

                    for (int i = 0; i < rects.size; i++) {
                        for (int j = 0; j < rects.size; j++) {
                            if (i == j) continue;
                            if (overlaps(rects.get(i), rects.get(j))) {
                                stdout.printf("overlap");
                                geometry.Rectangle r = rects.get(i).union(rects.get(j));
                                rects.remove_at(i);
                                rects.insert(i, r);
                                rects.remove_at(j);
                                overlap = true;
                                j--;

                            }
                        }
                    }

                }
                catch (Error e)
                {

                }  
            }
            return rects;
        }
    }
    private static bool overlaps (geometry.Rectangle r1, geometry.Rectangle r2) {
        return r2.x < r1.x + r1.width && r2.x + r2.width > r1.x && r2.y < r1.y + r1.height && r2.y + r2.height > r1.y;
    }
}