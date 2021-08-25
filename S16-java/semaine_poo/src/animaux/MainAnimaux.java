package animaux;

public class MainAnimaux {

    public static void main(String[] args) {

        Oiseau oiseauTic = new Oiseau (2,"Rose","Tic");
        Chat chatGarfield = new Chat (4, "Garfield", 8);
        Chien chienPaf = new Chien (4, "Paf");
        Serpent serpentVipere = new Serpent (0,"Vipére");

        Animal qqch = new Animal(3, "toto", "omnivore");

        System.out.println(oiseauTic.avancer() + " " + oiseauTic.parler());
        System.out.println(chatGarfield.avancer() + " " + chatGarfield.parler());
        System.out.println(chienPaf.avancer() + " " + chienPaf.parler());
        System.out.println(serpentVipere.avancer() + " " + serpentVipere.parler());
        System.out.println(qqch.avancer() + " " + qqch.parler());

    }
}
