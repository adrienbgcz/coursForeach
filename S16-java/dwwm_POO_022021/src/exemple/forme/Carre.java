package exemple.forme;

public class Carre extends Forme {

    public Carre(int cote) {
        super(cote, cote);
    }

    @Override
    public int getAire() {
        return 1;
    }
}
