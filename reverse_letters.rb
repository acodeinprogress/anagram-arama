def reverse_letters(word)
    anagrams = []
    (-1..0).each do |index|
        anagrams.push(word[index])
    end
    return anagrams
end
