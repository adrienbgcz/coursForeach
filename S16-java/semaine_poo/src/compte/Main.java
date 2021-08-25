package compte;

public class Main {

    public static void main(String[] args) {

        CompteCourant courant = new CompteCourant("Ronan", 12345, 6789);
        afficheCompte(courant);


        courant.deposer(100.0);
        afficheCompte(courant);

        courant.deposer(122.0);
        afficheCompte(courant);


        for (int i = 0; i < 4; i++) {
            courant.retirer(courant.getSolde() * 0.5);
            afficheCompte(courant);
        }

        courant.deposer(1224.50);
        afficheCompte(courant);

        CompteVie vie = new CompteVie( "Ronan", 12345,14);
        afficheCompte(vie);

        transfert(428.00,courant,vie);

//        transfert(206.00, vie, courant);

        vie.retirer(0.5 * vie.getSolde());
        afficheCompte(vie);

        transfert(0.2 * courant.getSolde(),courant,vie);

        transfert(0.14 * courant.getSolde(),courant,vie);

        System.out.println(vie.calculInteret().toString());
//        afficheCompte(vie);
//        afficheCompte(courant);
    }


    public static void afficheCompte (Compte compte){
            compte.calculInteret();
            System.out.println(compte.getClass() + " " + compte.getNumeroCompte().toString() + " " + compte.getSolde().toString());
    }

    public static void transfert (Double somme, Compte compteOrigine, Compte compteDestination) {
        compteOrigine.retirer(somme);
        afficheCompte(compteOrigine);

        compteDestination.deposer(somme);
        afficheCompte(compteDestination);
    }





}
