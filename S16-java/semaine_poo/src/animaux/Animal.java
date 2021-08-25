package animaux;

public class Animal<Integer, String> {

    private Integer nombrePattes;

    private String nom;

    private String regimeAlimentaire;

    public Animal(Integer nombrePattes, String nom, String regimeAlimentaire) {
        this.nombrePattes = nombrePattes;
        this.nom = nom;
        this.regimeAlimentaire = regimeAlimentaire;
    }

    public java.lang.String avancer() {
        return "je suis un animal, je fais ce que veux";
    }

    public java.lang.String parler() {
        return "coucou";
    }

    public java.lang.String toString() {
        return "Animal{" +
                "nombrePattes=" + nombrePattes +
                ", nom='" + nom + '\'' +
                '}';
    }

    public Integer getNombrePattes() {
        return nombrePattes;
    }

    public void setNombrePattes(Integer nombrePattes) {
        this.nombrePattes = nombrePattes;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getRegimeAlimentaire() {
        return regimeAlimentaire;
    }

    public void setRegimeAlimentaire(String regimeAlimentaire) {
        this.regimeAlimentaire = regimeAlimentaire;
    }

}
