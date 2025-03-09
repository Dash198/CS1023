class Animal{
    String name;

    public Animal(String name){
        this.name = name;
    }

    void makeSound(){
        System.out.println("Some sound...");
    }
}

class Dog extends Animal{
    String breed;

    public Dog(String name, String breed){
        super(name);
        this.breed=breed;
        System.out.println("Dog name: "+this.name+"\nDog Breed: "+this.breed);
    }
    void bark(){
        System.out.println("Woof woof");
    }
}

class Pup extends Dog{
    int age;
    Pup(int age){
        super("hello","world");
        this.age = age;
    }
}

public class inherit {
    public static void main(String[] args){
        Dog d = new Dog("Puggy", "Pug");
        d.makeSound();
        d.bark();
    }
}