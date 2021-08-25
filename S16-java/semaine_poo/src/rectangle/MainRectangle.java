package rectangle;

public class MainRectangle {

    public static void main (String[] args) {

        Rectangle roger = new Rectangle(5);

        Rectangle martine = new Rectangle(6, 7);

        Rectangle michel =  new Rectangle(6, 7);

        Carre brigitte = new Carre(3);

        System.out.println(martine.afficheSurface());

        martine.setLargeur(9);

        System.out.println(martine.afficheSurface());

        System.out.println(brigitte.afficheSurface());

        System.out.println("roger: " + roger);
        System.out.println("martine: " + martine);
        System.out.println("michel: " + michel);

        System.out.println("brigitte: " + brigitte);


//        List<rectangle.Rectangle> gens = new ArrayList<>();

//        gens.add(roger);
//        gens.add(martine);
//        gens.add(michel);

//        System.out.println(gens.contains(michel));
//
//        System.out.println(gens.indexOf(michel));
//
//        System.out.println(gens.get(1));

//        System.out.println(roger.afficheSurface());

//        rectangle.Rectangle michel = martine;

//        System.out.println(martine.equals(michel));
    }
}
