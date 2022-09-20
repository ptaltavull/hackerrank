import java.io.*;

class Result {

    /*
     * Complete the 'staircase' function below.
     *
     * The function accepts INTEGER n as parameter.
     */

    public static void staircase(int n) {
        // Write your code here
        for (int i = 1; i <= n; i++) {
            for (int y = 0; y < n - i; y++) {
                System.out.print(" ");
            }
            for (int x = 0; x < i; x++) {
                System.out.print("#");
            }
            System.out.println();
        }
    }

}

public class Staircase {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

        int n = Integer.parseInt(bufferedReader.readLine().trim());

        Result.staircase(n);

        bufferedReader.close();
    }
}
