open(my $VERBS, "<", "verbs.txt") 
    or die "cannot open < verbs.txt: $!";
open(my $NOUNS, "<", "nouns.txt") 
    or die "cannot open < nouns.txt: $!";

@verbs = <$VERBS>; chomp @verbs;
@nouns = <$NOUNS>; chomp @nouns;

for ($count = 1; $count < 100; $count++) {
    $verb = ucfirst $verbs[int rand $#verbs];
    $noun = ucfirst $nouns[int rand $#nouns];
    print "$verb the $noun\n";
}

