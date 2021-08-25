package animaux;

public class Chien extends Animal {

    public Chien(Integer nombrePattes, String nom) {
        super(nombrePattes, nom, "carnivore");
    }

    public java.lang.String avancer() {
        return "Je suis un chien et je cours";
    }

    public java.lang.String parler() {
        return "whouaf !";
    }

    public String grogner() {
        return "Grrrrrrrrr !!!!";
    }

//    @Override
//    public String toString() {
//        return "Chien{" +
//                "nombrePatte=" + nombrePattes +
//                ", nom='" + nom + '\'' +
//                '}';
//    }

}
