import java.io.FileNotFoundException;
import java.util.Scanner;
import java.io.File;
import java.util.ArrayList;
import java.util.Random;

public class GenerateTheme {

    public static ArrayList<String> getArrayListFromFile(File f) 
        throws FileNotFoundException {
            Scanner s;
            ArrayList<String> list = new ArrayList<String>();
            s = new Scanner(f);
            while (s.hasNext()) {
                list.add(s.next());
            }
            s.close();
            return list;
    }

    // TODO Make generic
    public static String choose(ArrayList<String> list) {
        Random randomGenerator = new Random();
        int index = randomGenerator.nextInt(list.size());
        return list.get(index); 
    }

    public static String title(String s) {
        return s.substring(0, 1).toUpperCase() + s.substring(1);
    }

    public static void main (String[] args) {

        try {
            ArrayList<String> verbs = getArrayListFromFile(new File("verbs.txt"));
            ArrayList<String> nouns = getArrayListFromFile(new File("nouns.txt"));

            for (int i = 0; i < 100; i++) {
                System.out.println(title(choose(verbs)) + " the " + title(choose(nouns)));
            }

        } catch (FileNotFoundException e) {
            System.err.println("File not found exception: " + e.getMessage());   
        }
    }
}

