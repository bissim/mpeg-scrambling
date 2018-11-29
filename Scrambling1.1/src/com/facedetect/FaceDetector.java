package com.facedetect;

import java.awt.Rectangle;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by alfonso on 06/04/2017.
 */
public class FaceDetector {
    private List<FaceDetectorInterface<Rectangle>> strategies;

    /**
     * Costruttore della classe FaceDetector.
     * All'interno del costruttore viene inizializzata la lista delle strategie
     */
    public FaceDetector() {
        strategies = new ArrayList<>();
    }

    /**
     * Questo metodo dello strategy consente l'aggiunta delle strategie
     * che saranno poi eseguite quando verrà richiamanto il metodo applyStrategies.
     * @param strategy, Strategia di tipo FaceDetectorInterface che sarà eseguita per la ricerca di volti
     */
    public void addStrategy(FaceDetectorInterface strategy) {
        strategies.add(strategy);
    }

    /**
     * Questo metodo esegue tutti gli algoritmi per la ricerca volti che sono state aggiunti
     * tramite il metodo addStrategy. Al termine della ricerca viene richiamato il metodo
     * checkOverlapResult
     *
     * @return List<Rectangle> lista di volti all'interno della foto
     */
    public List<Rectangle> applyStrategies() {
        List<Rectangle> rects = new ArrayList<>();
        for(FaceDetectorInterface<Rectangle> strategy : strategies) {
            rects.addAll(strategy.detectFaces());
        }

        return checkOverlapResult(rects);
    }

    /**
     * Questo metodo verifica la presenza di risultati duplicati (più strategie trovano la stessa faccia)
     * o di risultati che si intersecano fra loro (facce vicine fra loro). Nel primo caso viene eliminato
     * un risultato, nel secondo caso viene creato un nuovo rettangolo che sia l'unione dei due.
     * @param rects lista dei volti trovati dalle strategie con duplicati
     * @return List<Rectangle> lista dei volti senza duplicati
     */
    private List<Rectangle> checkOverlapResult(List<Rectangle> rects) {
        boolean overlap = true;
        while(overlap) {
            overlap=false;
            try {
                for (int i = 0; i < rects.size(); i++) {
                    for (int j = 0; j < rects.size(); j++) {
                        if (i == j) continue;
                        if (rects.get(i).contains(rects.get(j))) {
                            rects.remove(j);
                            overlap = true;
                            j--;
                            if (i == rects.size()) i--;
                        }

                    }
                }
                for (int i = 0; i < rects.size(); i++) {
                    for (int j = 0; j < rects.size(); j++) {
                        if (i == j) continue;
                        if (overlaps(rects.get(i), rects.get(j))) {
                            System.out.println("overlap");
                            java.awt.Rectangle r = rects.get(i).union(rects.get(j));
                            rects.remove(i);
                            rects.add(i, r);
                            rects.remove(j);
                            overlap = true;
                            j--;

                        }

                    }
                }
            } catch (Exception e) {
            }
        }
        return rects;
    }

    /**
     * Questo metodo controlla se due rettangoli si intersecano fra loro
     * @param r1 Primo rettangolo
     * @param r2 Secondo rettangolo
     * @return true se r1 interseca r2, false altrimenti
     */
    private static boolean overlaps (Rectangle r1, Rectangle r2) {
        return r2.x < r1.x + r1.width && r2.x + r2.width > r1.x && r2.y < r1.y + r1.height && r2.y + r2.height > r1.y;
    }




}
