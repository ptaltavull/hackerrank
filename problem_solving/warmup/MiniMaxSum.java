import java.io.*;
import java.util.*;

class Result {

    /*
     * Complete the 'miniMaxSum' function below.
     *
     * The function accepts INTEGER_ARRAY arr as parameter.
     */

    public static void miniMaxSum(List<Integer> arr) {
        // Write your code here
        int min[] = new int[4];
        int max[] = new int[4];
        for (int i = 0; i < min.length; i++) {
            Collections.sort(arr);
            min[i] = arr.get(i);
            Collections.reverse(arr);
            max[i] = arr.get(i);
        }

        long res = 0;
        for (int i : min) {
            res = (long) res + i;
        }
        System.out.print(res + " ");

        res = 0;
        for (int i : max) {
            res = (long) res + i;
        }
        System.out.println(res);
    }

}

public class MiniMaxSum {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

        String[] arrTemp = bufferedReader.readLine().replaceAll("\\s+$", "").split(" ");

        List<Integer> arr = new ArrayList<>();

        for (int i = 0; i < 5; i++) {
            int arrItem = Integer.parseInt(arrTemp[i]);
            arr.add(arrItem);
        }

        Result.miniMaxSum(arr);

        bufferedReader.close();
    }
}
