require_relative 'reverse_letters'

def find_anagram(word)
    if word.length == 3
        anagrams = []
        new_word = word
        anagrams.push(new_word)
        new_word, anagrams = move_words(new_word, anagrams)
        reversed_word = reverse_letters(new_word)
        anagrams.push(reversed_word)
        new_word, anagrams = move_words(reversed_word, anagrams)
    end
    return anagrams
end

def move_words(word, array)
    word = word[1] + word[2] + word[0]
    array.push(word)
    word = word[1] + word[2] + word[0]
    array.push(word)
    return word, array
end
