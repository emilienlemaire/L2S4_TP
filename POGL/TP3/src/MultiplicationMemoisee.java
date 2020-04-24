public class MultiplicationMemoisee extends Multiplication {
    private Integer mem;

    public MultiplicationMemoisee(Noeud n1, Noeud n2) {
        super(n1, n2);
    }

    @Override
    public int valeur() {
        if (mem == null)
            mem = super.valeur();

        return mem;
    }
}
