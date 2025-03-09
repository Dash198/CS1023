import java.util.Scanner;
class hello{
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		String s = new String();
		s = sc.nextLine();
		System.out.println("Hello "+s);
		sc.close();
	}
}
