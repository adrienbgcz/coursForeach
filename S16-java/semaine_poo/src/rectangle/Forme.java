package rectangle;

import java.util.Objects;

public class Forme {

    private Integer longueur;

    private Integer largeur;

    public Forme(Integer longueur, Integer largeur) {
        this.longueur = longueur;
        this.largeur = largeur;
    }

    public Integer getSurface() {
        return this.largeur * this.longueur;
    }

    public String afficheSurface() {
        return "la surface est de " + this.getSurface();
    }


    @Override
    public String toString() {
        return "Forme{" +
                "longueur=" + longueur +
                ", largeur=" + largeur +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Forme forme = (Forme) o;
        return Objects.equals(longueur, forme.longueur) &&
                Objects.equals(largeur, forme.largeur);
    }

    @Override
    public int hashCode() {
        return Objects.hash(longueur, largeur);
    }

    public Integer getLongueur() {
        return longueur;
    }

    public void setLongueur(Integer longueur) {
        this.longueur = longueur;
    }

    public Integer getLargeur() {
        return largeur;
    }

    public void setLargeur(Integer largeur) {
        this.largeur = largeur;
    }
}
