package transformation;

public class Transforme {

    public Transforme() {
    }

    public String transforme(String aTransformer){
        return aTransformer.toLowerCase();
    }

    public String transforme(Integer aTransformer) {
        return aTransformer.toString() + "00";
    }

    public String transforme(String aTransformer, String aConcatener) {
//        return aTransformer.toUpperCase() + aConcatener.toUpperCase();
        return transforme(aTransformer) + transforme(aConcatener);
    }
}
