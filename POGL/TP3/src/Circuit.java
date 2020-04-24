import java.util.ArrayList;

public class Circuit {

    /**
     * Valeur de la variable dont dépend le calcul
     */
    private int entree;

    /**
     * Dernier noeud, calculant le résultat
     */
    protected Noeud sortie;

    /**
     * Ensemble des noeuds
     */
    private ArrayList<Noeud> noeuds;

    /**
     * Constructeur.
     * N'initialise pas l'entrée : la méthode calcule s'en chargera avant
     * chaque calcul. La sortie n'est pas initialisée non plus pour éviter
     * un problème de circularité.
     */
    public Circuit() {
        this.noeuds = new ArrayList<Noeud>();
    }

    /**
     * Ajout d'un noeud à la liste
     * @param n Noeud à ajouter
     */
    private void ajouteNoeud(Noeud n) {
        noeuds.add(n);
    }


    // Création de noeuds avec ajout direct
    /**
     * Création d'un noeud de valeur constante
     * @param n Valeur calculée par le noeud
     */
    public Noeud creeConstante(int n) {
        Noeud c = new Constante(n);
        this.ajouteNoeud(c);
        return c;
    }

    public Noeud creeEntree() {
        Noeud c = new Entree(this);
        this.ajouteNoeud(c);
        return c;
    }

    public Noeud creeAddition(Noeud n1, Noeud n2) {
        Noeud c = new Addition(n1, n2);
        this.ajouteNoeud(c);
        return c;
    }

    public Noeud creeMultiplication(Noeud n1, Noeud n2) {
        Noeud c = new Multiplication(n1, n2);
        this.ajouteNoeud(c);
        return c;
    }

    public Noeud creeMultiplicationMemoisee(Noeud n1, Noeud n2) {
        Noeud c = new MultiplicationMemoisee(n1, n2);
        this.ajouteNoeud(c);
        return c;
    }

    /**
     * Donne la valeur de l'entrée, dont auront besoin certains noeuds
     */
    public int litEntree() {
        return this.entree;
    }

    /**
     * Initialise la variable d'entrée et calcule le résultat
     * @param e Valeur affectée à la variable d'entrée
     * @return Valeur calculée par le circuit
     */
    public int calcule(int e) {
        this.entree = e;
        return this.sortie.valeur();
    }

    /**
     * Construction d'un ensemble de noeuds utilisant la technique
     * d'exponentiation rapide
     * @param c Circuit auquel rattacher les noeuds créés
     * @param n Puissance calculée
     * @return Noeud principal
     */
    public static Noeud expRapide(Circuit c, int n) {
        if (n == 0) {
            // x^0 = 1
            return (c.creeConstante(1));
        } else if (n % 2 == 0) {
            // Si n pair, x^n = (x^{n/2})^2
            Noeud e = expRapide(c, n/2);
            return (c.creeMultiplicationMemoisee(e, e));
        } else {
            // Si n impair, x^n = x*((x^{n/2})^2)
            Noeud e = expRapide(c, n/2);
            return (c.creeMultiplicationMemoisee(c.creeEntree(),
                    c.creeMultiplicationMemoisee(e, e)));
        }
    }
    /**
     * Construction d'un circuit utilisant la technique d'exponentiation rapide 
     * @param n Puissance calculée
     * @return Circuit calculant la n-ème puissance de sa variable d'entrée
     */
    public static Circuit expRapide(int n) {
        // On crée d'abord un circuit vide...
        Circuit c = new Circuit();
        // puis on y ajoute des noeuds, et on connecte le dernier à la sortie.
        c.sortie = expRapide(c, n);
        return c;
    }

    public int nbNoeudsMult() {
        return Multiplication.nbMult;
    }

    public int nbOpEffectuees() {
        return Noeud.getOperations();
    }

    public void affiche() {
        System.out.println(noeuds.get(noeuds.size() - 1));
    }
}