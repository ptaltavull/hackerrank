package java.strings;

public class JavaSubstringComparisons {
    public static String getSmallestAndLargest(String s, int k) {
        String currStr = s.substring(0, k);
        String smallest = currStr;
        String largest = currStr;

        for (int i = 0; i <= s.length() - k; i++) {
            currStr = s.substring(i, i + k);
            if (currStr.compareTo(largest) > 0)
                largest = currStr;
            if (currStr.compareTo(smallest) < 0)
                smallest = currStr;
        }

        return smallest + "\n" + largest;
    }

}
