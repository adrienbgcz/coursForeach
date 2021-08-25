package exemple.animal;

public abstract class Animal {

    private Integer nombrePattes;

    private String nom;

    public abstract String getCri();

    public String getDeplacement() {
        return "je marche";
    }

    public Animal(Integer nombrePattes, String nom) {
        this.nombrePattes = nombrePattes;
        this.nom = nom;
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
}
