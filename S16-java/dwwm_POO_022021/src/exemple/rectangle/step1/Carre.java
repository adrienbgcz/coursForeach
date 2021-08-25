package exemple.rectangle.step1;

import java.util.Objects;

public class Carre {


    // constante

    // propriétés / attributs

    private Integer longueur;

    private Integer largeur;

    // constructeurs
    public Carre(Integer cote) {
        this.longueur = cote;
        this.largeur = cote;
    }

    //méthode
    public Integer getSurface() {
        return this.largeur * this.longueur;
    }

    public String afficheSurface() {
        return "la surface est de " + this.getSurface();
    }

    // toString
    @Override
    public String toString() {
        return "exemple.rectangle.Carre{" +
                "longueur=" + longueur +
                ", largeur=" + largeur +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Carre carre = (Carre) o;
        return Objects.equals(longueur, carre.longueur) &&
                Objects.equals(largeur, carre.largeur);
    }

    @Override
    public int hashCode() {
        return Objects.hash(longueur, largeur);
    }

    // accesseur -> getter et setter
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
