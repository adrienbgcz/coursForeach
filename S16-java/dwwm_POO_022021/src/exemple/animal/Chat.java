package exemple.animal;

public class Chat extends Animal implements Comparable {

    public Chat(Integer nombrePattes, String nom) {
        super(nombrePattes, nom);
    }

    @Override
    public String getCri() {
        return "miaou";
    }

    @Override
    public String getDeplacement() {
        return "je saute";
    }

    @Override
    public int compareTo(Object o) {
        return 0;
    }
}
