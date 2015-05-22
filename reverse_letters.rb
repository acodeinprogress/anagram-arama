def reverse_letters(word)
    reversed_word = ''
    length = word.length - 1
    length.downto(0).each do |index|
        reversed_word = reversed_word + word[index]
    end
    return reversed_word
end
