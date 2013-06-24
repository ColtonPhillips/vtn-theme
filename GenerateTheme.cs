using System;
using System.IO;
using System.Globalization;
public class GenerateTheme {

    public static string Title(string s) {
        TextInfo textInfo = new CultureInfo("en-US",false).TextInfo;
        return textInfo.ToTitleCase(s);
    }

    static void Main (string[] args) {
        
        var verbs = File.ReadAllLines("verbs.txt");
        var nouns = File.ReadAllLines("nouns.txt");

        Random random = new Random();
        for (int i = 0; i < 100; i++) {
            string verb = verbs[random.Next(verbs.Length)];
            string noun = nouns[random.Next(nouns.Length)];
            Console.Write(Title(verb) + " the " + Title(noun));
            Console.WriteLine();            
        }
    }

}
