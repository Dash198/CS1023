import java.util.Scanner;
class sum{
    public static void main(String[] args){
        Scanner sc = new Scanner(System.in);
        int a,b;
        System.out.print("Enter no. 1: ");
        a = sc.nextInt();
        System.out.print("Enter no. 2: ");
        b = sc.nextInt();
        int c = a+b;
        System.out.println("Sum: "+c);
        sc.close();
    }
}