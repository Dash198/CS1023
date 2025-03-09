class Person{
    private String name="John";

    private void display(){
        System.out.println("Name: " + name);
    }

    public void accessPrivateMethod(){
        display();
    }
}

public class Fields {
    public static void main(String[] args){
        Person john = new Person();
        john.accessPrivateMethod();
    }
}