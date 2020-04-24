import POGLTP4.Arrete;
import POGLTP4.Graphe;
import POGLTP4.Sommet;

public class Main {
    public static void main(String[] args) {
        Graphe graphe = new Graphe();
        Sommet s0 = new Sommet("s0", graphe);
        Sommet s1 = new Sommet("s1", graphe);
        Sommet s2 = new Sommet("s2", graphe);
        Sommet s3 = new Sommet("s3", graphe);
        Sommet s4 = new Sommet("s4", graphe);

        Arrete a0 = new Arrete(s0, s1, 1, graphe);
        Arrete a1 = new Arrete(s0, s2, 1, graphe);
        Arrete a2 = new Arrete(s1, s4, 1, graphe);
        Arrete a3 = new Arrete(s2, s3, 1, graphe);


        graphe.afficher();

    }
}
