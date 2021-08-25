package transformation;

public class MainTransforme {

    public static void main(String[] args){
        Transforme t = new Transforme();
        String transformed = t.transforme("toto", "titi");

        System.out.println(transformed);
    }

}
