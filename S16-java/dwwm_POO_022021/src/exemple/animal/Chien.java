package exemple.animal;

public class Chien extends Animal implements IAttaquant {

    public Chien(Integer nombrePattes, String nom) {
        super(nombrePattes, nom);
    }

    @Override
    public String getCri() {
        return "wouf";
    }

    @Override
    public String getDeplacement() {
        return "je cours";
    }

    @Override
    public int getAttaque() {
        return 4;
    }

    @Override
    public int getDefense() {
        return 2;
    }
}
