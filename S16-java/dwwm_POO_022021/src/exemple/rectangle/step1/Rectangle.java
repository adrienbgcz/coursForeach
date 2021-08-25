package exemple.rectangle.step1;

import java.util.Objects;

public class Rectangle {

    // constante

    // propriétés / attributs

    private Integer longueur;

    private Integer largeur;

    // constructeurs
    public Rectangle(Integer longueur, Integer largeur) {
        this.longueur = longueur;
        this.largeur = largeur;
    }

    public Rectangle(Integer longueur) {
        this.longueur = longueur;
        this.largeur = 8;
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
        return "exemple.rectangle.Rectangle{" +
                "longueur=" + longueur +
                ", largeur=" + largeur +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Rectangle rectangle = (Rectangle) o;
        return Objects.equals(longueur, rectangle.longueur) &&
                Objects.equals(largeur, rectangle.largeur);
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
