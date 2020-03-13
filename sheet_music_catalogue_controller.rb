require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')

require_relative('models/book.rb')
require_relative('models/piece_location.rb')
require_relative('models/piece.rb')

also_reload('./models/*')

# GET

get '/' do
  erb(:homepage)
end

get '/index' do
  @books = Book.all()
  erb(:index)
end
