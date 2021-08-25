package compte;

public abstract class Compte {

    private Double solde;

    private String nonTitulaire;

    private Integer numeroCompte;

    public Compte(String nonTitulaire, Integer numeroCompte) {
        this.solde = 0.0;
        this.nonTitulaire = nonTitulaire;
        this.numeroCompte = numeroCompte;
    }

    public void deposer(Double depot) {
        this.solde += depot;
    }

    public void retirer(Double retrait) {
        this.solde -= retrait;
    }

    public abstract Double calculInteret() ;

    @Override
    public String toString() {
        return "Compte{" +
                "solde=" + solde +
                ", nonTitulaire='" + nonTitulaire + '\'' +
                ", numeroCompte=" + numeroCompte +
                '}';
    }

    public Double getSolde() {
        return solde;
    }

    public void setSolde(Double solde) {
        this.solde = solde;
    }

    public String getNonTitulaire() {
        return nonTitulaire;
    }

    public void setNonTitulaire(String nonTitulaire) {
        this.nonTitulaire = nonTitulaire;
    }

    public Integer getNumeroCompte() {
        return numeroCompte;
    }

    public void setNumeroCompte(Integer numeroCompte) {
        this.numeroCompte = numeroCompte;
    }
}
