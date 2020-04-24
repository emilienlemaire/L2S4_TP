abstract class Noeud {
    abstract public int valeur();
    public static int operations = 0;

    public static int getOperations() { return operations; }

    public String toString() {
        return String.valueOf(this.valeur());
    }
}
