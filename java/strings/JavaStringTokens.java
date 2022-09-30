import java.io.*;
import java.util.*;

public class JavaStringTokens {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String s = scan.nextLine();
        // Write your code here.
        String[] result = 
        Arrays.stream(s.trim().split("[^a-zA-Z]+")).filter(x -> !x.isEmpty()).toArray(String[]::new);
            System.out.println(result.length);
            for (String el : result) {
                System.out.println(el);
            }
        scan.close();
    }
}