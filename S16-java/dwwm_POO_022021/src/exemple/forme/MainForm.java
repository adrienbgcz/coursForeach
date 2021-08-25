package exemple.forme;

public class MainForm {

    public static void main(String[] args) {

        Rectangle rectangle = new Rectangle(10, 5, new Point(1, 2));

        Carre carre = new Carre(10);

        Forme[] formes = new Forme[2];
        formes[0] = rectangle;
        formes[1] = carre;

        for(int i = 0; i<formes.length; i++) {
            System.out.println(formes[i].getAire());

        }

    }

    static void affichelongueur(Forme r){
        System.out.println(r.getLongueur());
    };

}
