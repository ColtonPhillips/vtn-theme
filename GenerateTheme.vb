Module VerbTheNounTheme
    Sub Main
        Dim verbsString As String = IO.File.ReadAllText("verbs.txt")
        Dim nounsString As String = IO.File.ReadAllText("nouns.txt")

        Dim verbs() As String = Split(verbsString, Environment.NewLine)
        Dim nouns() As String = Split(nounsString, Environment.NewLine)
        
        Randomize()
        For i = 0 to 100
            'randomvalue      = CInt(Int((upperbound - lowerbound + 1)    * Rnd() + lowerbound))
            Dim vI As Integer = CInt(Int((verbs.GetUpperBound(0) - 0 + 1) * Rnd() + 0 ))
            Dim nI As Integer = CInt(Int((nouns.GetUpperBound(0) - 0 + 1) * Rnd() + 0 ))
            Console.WriteLine("{0} the {1}", StrConv(verbs(vI), VbStrConv.ProperCase), StrConv(nouns(vI), VbStrConv.ProperCase))
        Next

    End Sub
End Module
