package animaux;

public class Oiseau extends Animal {

    String couleur;

    public Oiseau(Integer nombrePattes, String couleur, String nom) {
        super(nombrePattes, nom, "frugivore");
        this.couleur = couleur;
    }

    public java.lang.String avancer () {
        return "Je suis un oiseau, je vole";
    }

    public java.lang.String parler () {
        return "cuicui";
    }

//    @Override
//    public String toString() {
//        return "Oiseau{" +
//                "pattes=" + nombrePattes +
//                ", couleur='" + couleur + '\'' +
//                ", nom='" + nom + '\'' +
//                '}';
//    }

    public String getCouleur() {
        return couleur;
    }
    public void setCouleur(String couleur) {
        this.couleur = couleur;
    }

}