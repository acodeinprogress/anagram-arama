require 'sinatra' 

def three_letters?(word)
    if params[:word].length > 3 || params[:word].length < 2
        false
    else
        true
    end
end

def distinct_letters?(input)
    letter_array = input.chars
    unique_letters = input.split("").uniq
    if unique_letters.length < letter_array.length
        false
    else
        true
    end
end

def valid_input?(input)
    if three_letters?(input) && distinct_letters?(input)
        true
    else
        false
    end
end

get '/' do
    erb :index
end

get '/anagrams/:word' do
    @word = params[:word]
    @anagrams = Word.find_anagram(@word)
    erb :show
end

post '/' do
    @word = params[:word]
    if valid_input?(@word)
        redirect "/anagrams/#{@word}"
    else
        @error = 'Wrong input. Please enter a 2-3 letter word'
        erb :index
    end
end
