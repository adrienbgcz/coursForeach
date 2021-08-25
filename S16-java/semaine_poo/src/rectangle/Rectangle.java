package rectangle;

import java.util.Objects;

public class Rectangle extends Forme {

    // constructeurs
    public Rectangle(Integer longueur, Integer largeur) {
        super(longueur, largeur);
    }

    public Rectangle(Integer longueur) {
        super(longueur, 8);
    }

}
