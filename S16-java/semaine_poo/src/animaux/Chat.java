package animaux;

public class Chat extends Animal {

    private Integer nombreMoustache;

    public Chat(Integer nombrePattes, String nom, Integer nombreMoustache) {
       super(nombrePattes, nom, "canibale");
       this.nombreMoustache = nombreMoustache;
    }

    public java.lang.String avancer() {
        return "je suis un chat, je marche";
    }

    public java.lang.String parler() {
        return "miaou";
    }

    public Integer getNombreMoustache() {
        return nombreMoustache;
    }

    public void setNombreMoustache(Integer nombreMoustache) {
        this.nombreMoustache = nombreMoustache;
    }
//        @Override
//        public String toString() {
//            return "Chat{" +
//                    "nombrePattes=" + nombrePattes +
//                    ", nom='" + nom + '\'' +
//                    '}';
//        }
}
