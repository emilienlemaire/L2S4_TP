package POGLTP4;
import java.util.ArrayList;


public class Graphe
{
	private int distances;
	private ArrayList<Sommet> sommets = new ArrayList<>();
	private ArrayList<Arrete> arretes = new ArrayList<>();

	public Graphe(){
		super();
	}

	
	public void afficher() {
		for (Sommet sommet :
				sommets) {
			System.out.print(sommet.getNom() + ":");
			sommet.printArretes();
		}
	}

	
	public int getDistance(Sommet s1, Sommet s2) {
		return s1.getDistance(s2);
	}

	
	public Chemin chemin(Sommet s1, Sommet s2) {
		// TODO implement me
		return null;
	}

	
	public void addSommet(Sommet s) {
		sommets.add(s);
	}

	
	public void addArrete(Arrete a) {
		arretes.add(a);
	}

	
	public Sommet getSommet(int I) {
		// TODO implement me
		return null;
	}

	
	public void printDistances(Sommet s1, Sommet s2) {
		// TODO implement me
	}

}

