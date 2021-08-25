package exemple.animal;

public class Poule extends Animal implements IAttaquant{

    public Poule(Integer nombrePattes, String nom) {
        super(nombrePattes, nom);
    }

    @Override
    public String getCri() {
        return "cot cot";
    }

    @Override
    public int getAttaque() {
        return 2;
    }

    @Override
    public int getDefense() {
        return 3;
    }
}
