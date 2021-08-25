package exemple.personne.entity;

import java.util.Objects;

//nom de la classe -> permet d'utiliser un nouveau type 'Personne'
public class Personne {

    /* PROPRIETE */

    private Integer id;

    private String nom;

    private String prenom;

    /* CONSTRUCTEUR */

    public Personne(Integer id, String nom, String prenom) {
        this.id = id;
        this.nom = nom;
        this.prenom = prenom;
    }

    public Personne() {
    }

    public Personne(String nom, String prenom) {
        this.nom = nom;
        this.prenom = prenom;
    }

    /* REDEFINITION DE METHODE PRESENTE DANS LA SUPERCLASS OBJECT */

    // Affichage d'une instance de personne
    @Override
    public String toString() {
        return "Personne{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                '}';
    }

    // Egalité entre 2 instance de personne
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Personne personne = (Personne) o;
        return id.equals(personne.id);
    }

    // calcul du hash d'une personne. doit être coherent avec le equals
    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public String getNomComplet() {
        return this.prenom + " " + this.nom;
    }

    // ACCESSEURS

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

}
