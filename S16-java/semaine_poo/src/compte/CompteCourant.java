package compte;

public class CompteCourant extends Compte {

    private Integer numeroCarte;

    public CompteCourant(String nomTitulaire, Integer numeroCompte, Integer numeroCarte) {
        super(nomTitulaire, numeroCompte);
        this.numeroCarte = numeroCarte;
    }

    public Double calculInteret() {
        return 0.0;
    }

    public Integer getNumeroCarte() {
        return numeroCarte;
    }

    public void setNumeroCarte(Integer numeroCarte) {
        this.numeroCarte = numeroCarte;
    }
}
