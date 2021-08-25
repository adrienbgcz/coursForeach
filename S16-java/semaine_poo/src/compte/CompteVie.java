package compte;

public class CompteVie extends Compte {

    private Integer tauxRemuneration;

    public CompteVie( String nomTitulaire, Integer numeroCompte, Integer tauxRemuneration) {
        super(nomTitulaire, numeroCompte);
        this.tauxRemuneration = tauxRemuneration;
    }

    public void retirer(Double retrait) {
        super.retirer(retrait * 1.04);
    }

    public Double calculInteret() {
        return this.getSolde() * this.tauxRemuneration;
    }

    public Integer getTauxRemuneration() {
        return tauxRemuneration;
    }

    public void setTauxRemuneration(Integer tauxRemuneration) {
        this.tauxRemuneration = tauxRemuneration;
    }
}
