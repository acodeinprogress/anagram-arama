require 'spec_helper'

describe 'Our Anagrams App' do
  include SpecHelper
 it 'responds with a redirect on a post to /' do
    post("/", { word: 'cat' })
    expect(last_response.redirect?).to be(true)
  end
  
  it 'does not include combinations which are not words following a get request to /anagrams/:word' do
    get("/anagrams/cat")
    expect(last_response.body).not_to include("CTA", "ATC", "TCA", "TAC")
  end  
  
  it 'does include anagrams which are words following a get request to /anagrams/:word' do
    get("/anagrams/cat")
    expect(last_response.body).to include("ACT")
  end
  
  it 'valid_input throws an exception when input is more than 3 characters' do
    expect { valid_input("test") }.to raise_error
  end
  
  it 'valid_input throws an exception when input does not have distinct letters' do
    expect { valid_input("too") }.to raise_error
  end 
    
  it 'has letters of a word in alphabetical order' do
    word = Word.find_by_text("cat")
    expect(word.letters == "act").to be(true)
  end  
  
  it 'adds letters before a new word is created' do
    word = Word.create(text: "heroku")
    expect(word.reload.letters == "ehkoru").to be(true)
  end  
end
