package exemple.personne.entity;

public class Enfant extends Personne {

    /*
    final -> la valeur ne pourra pas etre changé. immuable. -> comme le const js
    static -> permettre d'acceder aux données défini comme static sans instancier d'objet (sans le new ...)
     */
    public final static String MARCHE = "marche";
    public final static String QUATTRE_PATTES = "4pattes";
    public final static String RAMPE = "rampe";
    public final static String AUCUNE = "aucune";

    private String etapeMotrice;

    private boolean parole;

    public Enfant(Integer id, String nom, String prenom, String etapeMotrice, boolean parole) {
        super(id, nom, prenom);
        this.etapeMotrice = etapeMotrice;
        this.parole = parole;
    }


    @Override
    public String toString() {
        return "Enfant{" +
                "etapeMotrice='" + etapeMotrice + '\'' +
                ", parole=" + parole +
                "} " + super.toString();
    }

    public String getEtapeMotrice() {
        return etapeMotrice;
    }

    public void setEtapeMotrice(String etapeMotrice) {
        this.etapeMotrice = etapeMotrice;
    }

    public boolean isParole() {
        return parole;
    }

    public void setParole(boolean parole) {
        this.parole = parole;
    }
}
