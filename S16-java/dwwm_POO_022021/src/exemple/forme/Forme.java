package exemple.forme;

/*
abstract indique que toute classe qui etendra forme devra implémenter toute les méthode définie comme abstraite
 */
public abstract class Forme {

    private int longueur;

    private int largeur;

    private Point position;

    public Forme(int longueur) {
        this.longueur = longueur;
    }

    public Forme(int cote, int cote1) {

    }


    public abstract int getAire();

    public Forme(int longueur, int largeur, Point position) {
        this.longueur = longueur;
        this.largeur = largeur;
        this.position = position;
    }

    public int getLongueur() {
        return longueur;
    }

    public void setLongueur(int longueur) {
        this.longueur = longueur;
    }

    public int getLargeur() {
        return largeur;
    }

    public void setLargeur(int largeur) {
        this.largeur = largeur;
    }
}
