verbs = IO.readlines "verbs.txt"
verbs.each do |verb|
    verb.delete "\n"
end

nouns = IO.readlines "nouns.txt"
nouns.each do |i|
    i = i.chomp
end

for i in 1..100 do  
    theme =  verbs.sample.capitalize + " the " + nouns.sample.capitalize + "\n"
    print theme
end
