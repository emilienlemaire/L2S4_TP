public class Constante extends Noeud {
    private int c;

    public Constante(int c) { this.c = c; }
    @Override
    public int valeur() {
        return c;
    }

    @Override
    public String toString() {
        return "" + c;
    }
}
