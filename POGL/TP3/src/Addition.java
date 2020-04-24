public class Addition extends NoeudBinaire {

    public Addition(Noeud n1, Noeud n2) {
        super(n1, n2, "+");
    }

    @Override
    public int valeur() {
        operations++;
        return this.valeurSource1() + this.valeurSource2();
    }
}
