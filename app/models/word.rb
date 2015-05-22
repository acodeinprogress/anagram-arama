class Word
    def self.reverse_letters(word)
        reversed_word = ''
        length = word.length - 1
        length.downto(0).each do |index|
            reversed_word = reversed_word + word[index]
        end
        return reversed_word
    end

    def self.move_words(word, array)
        word = word[1] + word[2] + word[0]
        array.push(word)
        word = word[1] + word[2] + word[0]
        array.push(word)
        return word, array
    end

    def self.find_anagram(word)
        if word.length == 3
            anagrams = []
            new_word = word
            anagrams.push(new_word)
            new_word, anagrams = self.move_words(new_word, anagrams)
            reversed_word = self.reverse_letters(new_word)
            anagrams.push(reversed_word)
            new_word, anagrams = self.move_words(reversed_word, anagrams)
        end
        return anagrams
    end

end
