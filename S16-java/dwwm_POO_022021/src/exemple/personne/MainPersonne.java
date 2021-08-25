package exemple.personne;

import exemple.personne.entity.Enfant;
import exemple.personne.entity.Personne;

import java.util.ArrayList;
import java.util.List;

public class MainPersonne {

    public static void main(String[] args) {

        Personne pierre = new Personne(1, "Herlemont", "Pierre");

        /*

        const pierre = {
            id : 1,
            nom: 'Herlemont',
            prenom: 'Pierre',
            age: 25
         }

         */

        Personne adrien = new Personne();
        adrien.setId(2);
        adrien.setNom("Bogacz");
        adrien.setPrenom("Adrien");

        /*

        const adrien = {}
        adrien.id = 2,
        adrien.nom = 'Bogacz',
        adrien.prenom = 'Adrien'
        adrien.civilite = 'Monsieur'


         */

        Personne houda = new Personne("Errachidi", "Houda");

        Personne jumeau = new Personne(1, "Herlemont", "Micheline");;


//        System.out.println(pierre);
//        System.out.println(adrien);
//        System.out.println(houda);
//        System.out.println(jumeau.getNomComplet());

//        System.out.println(pierre.equals(jumeau));


        Enfant edgar = new Enfant(10, "Mozdzierz", "Edgar", Enfant.MARCHE, false);

        System.out.println(edgar);
        System.out.println(edgar instanceof Enfant);
        System.out.println(edgar instanceof Personne);
        System.out.println(edgar.getEtapeMotrice().equals(Enfant.RAMPE));

        List<Personne> personnes = new ArrayList<>();
        personnes.add(pierre);
        personnes.add(adrien);

    }
}
