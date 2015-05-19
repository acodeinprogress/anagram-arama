def reverse_letters(word)
    if word.length == 2
        anagrams = []
        (-1..0).each do |index|
            anagrams.push(word[index])
        end
        return anagrams
    end

    if word.length == 3
        anagrams = []
        new_word = ''
        original_word = word
        while new_word != original_word
            new_word = word
            anagrams.push(new_word)
            new_word = word[0] + word[2] + word[1]
            anagrams.push(new_word)
            word = word[1] + word[2] + word[0]
        end
    end
end

puts reverse_letters("dog")
