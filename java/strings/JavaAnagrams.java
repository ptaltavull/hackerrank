import java.util.Scanner;

public class JavaAnagrams {

    static boolean isAnagram(String a, String b) {
        // Complete the function
        a = a.toLowerCase();
        b = b.toLowerCase();
        
        if(a.length() != b.length()) return false;
        
        char[] charArrA = a.toCharArray();
        char[] charArrB = b.toCharArray();
        
         java.util.Arrays.sort(charArrA);
         java.util.Arrays.sort(charArrB);
        
        if( java.util.Arrays.equals(charArrA, charArrB)) return true;
        
        return false;
    }

    public static void main(String[] args) {
    
        Scanner scan = new Scanner(System.in);
        String a = scan.next();
        String b = scan.next();
        scan.close();
        boolean ret = isAnagram(a, b);
        System.out.println( (ret) ? "Anagrams" : "Not Anagrams" );
    }
}