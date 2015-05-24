class Word < ActiveRecord::Base
    before_create :add_letters

    def add_letters
        characters = self.text.chars
        alphabetized_characters = characters.sort
        self.letters = alphabetized_characters.join
    end

    def self.find_anagram(word)
        alphabetized_string = word.chars.sort.join
        @anagrams = Word.where("letters=?", alphabetized_string)
    end
end
