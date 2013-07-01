word_table = function (filename)
    local file = io.open(filename, 'r');
    local words = {}
    local count = 0
    for line in file:lines() do
        table.insert (words, line)
        count = count + 1
    end
    return words, count
end

function title(str)
    result = ''
    for word in string.gfind(str, "%S+") do
        local first = string.sub(word,1,1)
        result = (result .. string.upper(first) ..
            string.lower(string.sub(word,2)))
    end
    return result
end

verbs, vCount = word_table("verbs.txt")
nouns, nCount = word_table("nouns.txt")

math.randomseed(os.time())
for i = 0 ,100, 1 do
    vI = math.random(0, vCount) 
    nI = math.random(0, nCount) 
    print(title(verbs[vI]) .. " the " .. title(nouns[nI]))
end
