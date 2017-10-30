import java.util.Scanner;

public class Test {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.print("Type in your message: ");
        String message = in.nextLine();
        System.out.println("Your message is \"" + message + "\"");
    }
}
