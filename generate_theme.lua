function title (s)
  return s:gsub("^%l", string.upper)
end
 
verbs = {}
for verb in io.lines("verbs.txt") do
  verbs[#verbs + 1] = verb
end
 
nouns = {}
for noun in io.lines("nouns.txt") do
  nouns[#nouns + 1] = noun
end
 
math.randomseed(os.time())
for i = 1, 100 do
    local v = math.random(#verbs)
    local n = math.random(#nouns)
    print(title(verbs[v]) .. " the " .. title(nouns[n]))
end
