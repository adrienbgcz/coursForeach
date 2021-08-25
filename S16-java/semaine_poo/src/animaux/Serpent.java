package animaux;

public class Serpent extends Animal {



    public Serpent(Integer nombrePattes, String nom) {
        super(nombrePattes, nom, "carnivore");
    }

    public java.lang.String avancer() {
        return "je suis un serpent, je rampe";
    }

    public java.lang.String toString() {
        return "Serpent{" +
                "nombrePatte=" + super.getNombrePattes() +
                ", nom='" + super.getNom() + '\'' +
                '}';
    }

}
