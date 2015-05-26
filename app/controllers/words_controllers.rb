get '/words' do
    @words = Word.all.order(:text)
    erb :"/words/index"
end

get '/words/new' do
    @word = Word.new
    erb :"/words/new"
end

get '/words/:id/edit' do
    @word = Word.find(params[:id])
    erb :"/words/edit"
end

put '/words/:id' do
    text = params[:text]
    @word = Word.find(params[:id])
    @word.text = text
    @word.save
    erb :"/words/show"
end

get '/words/:id' do
    @word = Word.find(params[:id])
    erb :"/words/show"
end

post '/words' do
    @word = Word.create(text: params[:text])
    redirect "/words/#{@word.id}"
end

