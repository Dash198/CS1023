abstract class Shape{
    abstract void draw();
}

class Circle extends Shape{
    @Override
    void draw(){
        System.out.println("Drawing a circle..");
    }
}

class Rectangle extends Shape{
    @Override
    void draw(){
        System.out.println("Drawing a rectangle...");
    }
}

public class Abstraction {
    public static void main(String[] args){
        Shape myShape = new Circle();
        Shape myOtherShape = new Rectangle();
    }
}
