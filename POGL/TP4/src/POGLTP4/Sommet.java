package POGLTP4;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Sommet
{
	
	private String nom;
	
	private HashMap<Sommet, Integer> distances = new HashMap<>();
	public Graphe graphe;
	public ArrayList<Arrete> arretes = new ArrayList<>();
	public ArrayList<Chemin> chemins;

	public Sommet(String nom, Graphe graphe){
		this.nom = nom;
		this.graphe = graphe;
		graphe.addSommet(this);
	}
	
	public int getDistance(Sommet s) {
		if (this.distances.containsKey(s)) return this.distances.get(s);
		return 0;
	}
	
	public Chemin routage(Sommet s) {
		// TODO implement me
		return null;
	}
	
	public String getNom() {
		return nom;
	}

	public void addArrete(Arrete a) {
		arretes.add(a);
	}
	
	public Arrete getArretes() {
		// TODO implement me
		return null;
	}
	
	public HashMap<Sommet, Integer> getDistances() {
		return distances;
	}

	public void printArretes() {
		for (Arrete arrete :
				arretes) {
			System.out.print(" " + arrete.getPoids() + "->" + arrete.secondSommet(this).getNom());
		}
		System.out.println(";");
	}

	public void calculateDistances(Sommet destination, Arrete arrete) {
		if (!this.distances.containsKey(destination)) {
			addDistance(destination, arrete.getPoids());
			destination.addDistance(this, arrete.getPoids());
		} else {
			int distance = this.distances.get(destination);
			if (distance > arrete.getPoids()) {
				updateDistance(destination, arrete.getPoids());
				destination.updateDistance(this, arrete.getPoids());
			}
		}

		HashMap<Sommet, Integer> distancesDestination = destination.getDistances();

		for (Map.Entry<Sommet, Integer> distance :
				this.distances.entrySet()) {
			Sommet sommet = distance.getKey();
			if (sommet != destination) {
				int newLength = distance.getValue() + arrete.getPoids();
				if (distancesDestination.containsKey(sommet)) {
					if (distancesDestination.get(sommet) > newLength){
						destination.updateDistance(sommet, newLength);
						sommet.updateDistance(destination, newLength);
					}
				} else {
					destination.addDistance(sommet, newLength);
					sommet.addDistance(destination, newLength);
				}
			}
		}

		for (Map.Entry<Sommet, Integer> distance :
				distancesDestination.entrySet()) {
			Sommet sommet = distance.getKey();
			if (sommet != this) {
				int newLength = distance.getValue() + arrete.getPoids();
				if (this.distances.containsKey(sommet)) {
					if (this.distances.get(sommet) > newLength){
						updateDistance(sommet, newLength);
						sommet.addDistance(this, newLength);
					}
				} else {
					addDistance(sommet, newLength);
					sommet.addDistance(this, newLength);
				}
			}
		}
	}

	private void addDistance(Sommet sommet, int newLength) {
		this.distances.put(sommet, newLength);
	}

	private void updateDistance(Sommet sommet, int newLength) {
		this.distances.replace(sommet, this.distances.get(sommet), newLength);
	}
}

