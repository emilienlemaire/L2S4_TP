public class Multiplication extends NoeudBinaire {
    public static int nbMult = 0;

    public Multiplication(Noeud n1, Noeud n2) {
        super(n1, n2, "*");
        nbMult++;
    }

    @Override
    public int valeur() {
        operations++;
        return this.valeurSource1() * this.valeurSource2();
    }
}
