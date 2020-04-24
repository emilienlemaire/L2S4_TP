public class Main {
    public static void main(String[] args) {
        Circuit c = new Circuit();
        Noeud n1 = c.creeMultiplication(c.creeConstante(2), c.creeEntree());
        c.sortie = n1;
        System.out.println("Ceci doit afficher 2 : " + c.calcule(1));
        System.out.println("Ceci doit afficher 12 : " + c.calcule(6));
        Noeud n2 = c.creeMultiplication(n1, c.creeAddition(c.creeConstante(1), n1));
        c.sortie = n2;
        System.out.println("Ceci doit afficher 6 : " + c.calcule(1));
        System.out.println("Ceci doit afficher 156 : " + c.calcule(6));
        System.out.println("Ceci doit afficher 2 : " + c.nbNoeudsMult());
        System.out.println("Ceci doit afficher 10 : " + c.nbOpEffectuees());
        Circuit p20 = Circuit.expRapide(20);
        System.out.println("Ceci doit afficher 7 : " + p20.nbNoeudsMult());
        System.out.println("Ceci doit afficher 1048576 : " + p20.calcule(2));
        System.out.println("Ceci doit afficher 51 : " + p20.nbOpEffectuees());
        /* Circuit p20m = expRapideMemoisee(20);
         System.out.println("Ceci doit afficher 7 : " + p20m.nbNoeudsMult());
         System.out.println("Ceci doit afficher 1048576 : " + p20m.calcule(2));
         System.out.println("Ceci doit afficher 7 : " + p20m.nbOpEffectuees());*/
         System.out.print("Ceci doit afficher ((2 * x) * (1 + (2 * x))) : ");
         c.affiche();
    }
}
