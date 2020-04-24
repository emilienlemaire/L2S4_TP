public abstract class NoeudBinaire extends Noeud {
    private Noeud source1;
    private Noeud source2;
    private String operator;

    public int valeurSource1() {
        return source1.valeur();
    }

    public int valeurSource2() {
        return source2.valeur();
    }

    public NoeudBinaire(Noeud n1, Noeud n2, String operator) {
        this.source1 = n1;
        this.source2 = n2;
        this.operator = operator;
    }

    @Override
    public String toString() {
        return "(" + this.source1 + " " + this.operator + " " + this.source2 + ")";
    }
}
