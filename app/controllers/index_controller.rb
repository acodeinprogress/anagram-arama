require 'sinatra' 

def valid_input?(input)
    if input.length < 2
        raise Exception.new("Word must be more than 2 characters.")
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
    begin
        valid_input?(@word)
        redirect "/anagrams/#{@word}"
    rescue Exception => error
        @error = error.message
        erb :index
    end
end
