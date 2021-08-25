package exemple.forme;

public class Rectangle extends Forme{

    @Override
    public int getAire() {
        return 0;
    }

    public Rectangle(int longueur, int largeur, Point position) {

        super(longueur, largeur, position);
    }
}
