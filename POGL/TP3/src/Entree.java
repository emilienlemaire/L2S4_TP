public class Entree extends Noeud {

    private Circuit circuit;

    public Entree(Circuit c) {
        circuit = c;
    }

    @Override
    public int valeur() {
        return circuit.litEntree();
    }

    @Override
    public String toString() {
        return "x";
    }
}
