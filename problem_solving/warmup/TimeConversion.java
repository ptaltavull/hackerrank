import java.io.*;

class Result {

    /*
     * Complete the 'timeConversion' function below.
     *
     * The function is expected to return a STRING.
     * The function accepts STRING s as parameter.
     */

    public static String timeConversion(String s) {
        // Write your code here
        if (s.substring(8).equals("PM")) {
            if (s.substring(0, 2).equals("12"))
                return s.substring(0, 8);

            return Integer.toString(Integer.parseInt(s.substring(0, 2)) + 12) + s.substring(2, 8);
        } else {
            if (s.substring(0, 2).equals("12"))
                return Integer.toString(Integer.parseInt(s.substring(0, 2)) - 12) + "0" + s.substring(2, 8);

            return s.substring(0, 8);
        }
    }

}

public class TimeConversion {
    public static void main(String[] args) throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

        String s = bufferedReader.readLine();

        String result = Result.timeConversion(s);

        bufferedWriter.write(result);
        bufferedWriter.newLine();

        bufferedReader.close();
        bufferedWriter.close();
    }
}
