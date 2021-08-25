import java.util.Scanner;

public class MainAlgo {

    public static void main(String[] args) {


//        String[] toto = {" ", "*", " ", "*", " ", "*", " ", "*", " ", "*", " ", "*"};
//        String[] tata = {"*", " ", "*", " ", "*", " ", "*", " ", "*", " ", "*", " "};
//
//        String totos = "", tatas = "";
//
//        for(int i = 0; i < toto.length ; i++) {
//            totos += toto[i];
//            tatas += tata[i];
//        }
//
//        totos.charAt(0);

        boolean quitter = false;
        Scanner scanner = new Scanner( System.in );

        do {

            afficheMenu();

            String elementMenu = scanner.nextLine();

            switch (elementMenu) {
                case "1": {
                    exercice1(scanner);
                    break;
                }
                case "0": {
                    quitter = true;
                    System.out.println("Au revoir");
                    break;
                }
                default: {
                    System.out.println("votre saisie ne correspond pas au menu");
                    break;
                }
            }
        }
        while (!quitter);





//         const monTableau = [0, 0, 0, 0, 0, 0, 0];
//        console.log(monTableau);

    }

    private static void exercice1(Scanner scan) {
        //Ecrire un algorithme qui déclare et remplisse un tableau de 7 valeurs numériques en les mettant toutes à zéro.
        // a l'initialisation
        String prenom = scan.nextLine();
        System.out.println("Quel est votre prenom ?");
        System.out.println("J'initialise ton tableau, "+ prenom);
        int[] monTableau = {0, 0, 0, 0, 0, 0, 0};
        for(int i = 0; i < monTableau.length ; i++) {
            System.out.println(monTableau[i]);
        }
        int[] monTableau2 = new int[7];
        for(int i = 0; i < monTableau2.length ; i++) {
            monTableau2[i] = 0;
        }
    }

    private static void afficheMenu() {
        System.out.println("\n\nBonjour, Veuillez choisir un nombre:");
        System.out.println("1 - exercice 1: init tableau zéro");
    }
}
