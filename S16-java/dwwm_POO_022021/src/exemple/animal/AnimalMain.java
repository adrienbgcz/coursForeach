package exemple.animal;

public class AnimalMain {

    public static void main(String[] args) {

        Chat felix = new Chat(4, "Félix");

        Chien bobby = new Chien(4, "Bobby");

        Poule codac = new Poule(2, "Codac");


        IAttaquant attaquant = new Chien(3, "Tor");

        combat(bobby, bobby);
        combat(codac, bobby);
        combat(attaquant, codac);

    }

    public static int combat(IAttaquant num1, IAttaquant num2){
        return num1.getAttaque() - num2.getDefense();
    }



}
