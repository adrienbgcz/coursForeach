package compte;

public class CompteJeune extends Compte {

    public CompteJeune(String nonTitulaire, Integer numeroCompte) {
        super(nonTitulaire, numeroCompte);
    }

    @Override
    public Double calculInteret() {
        return null;
    }
}
