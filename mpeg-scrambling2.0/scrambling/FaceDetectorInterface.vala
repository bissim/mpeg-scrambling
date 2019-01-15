namespace com.facedetect
{

    public interface FaceDetectorInterface<R> 
    {
        /**
        * Questo metodo dovrà contenere le logiche per il riconoscimento delle facce
        * all'interno di una foto. Restituisce una lista di Facce di tipo anonimo.
        * L'anoniminità del tipo consente di avere liste di Rettangoli, ROI ecc.
        * @return List<R> Lista di Facce riconosciute
        */
        public abstract List<R> detectFaces();
    }

}
