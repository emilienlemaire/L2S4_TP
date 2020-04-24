package POGLTP4;
import java.util.ArrayList;

public class Arrete
{
	private int poids;
	private Graphe graphe;
	private Sommet[] sommets;
	private ArrayList<Chemin> chemins;

	public Arrete(Sommet s1, Sommet s2, int poids ,Graphe graphe){
		sommets = new Sommet[]{s1, s2};
		this.poids = poids;
		this.graphe = graphe;

		graphe.addArrete(this);
		s1.addArrete(this);
		s2.addArrete(this);

		s1.calculateDistances(s2, this);
	}

	public int getPoids() {
		return poids;
	}

	public ArrayList<Sommet> getSommets() {
		// TODO implement me
		return null;
	}

	public Sommet secondSommet(Sommet sommet) {
		if (sommets[0] == sommet) return sommets[1];
		return sommets[0];
	}
}

