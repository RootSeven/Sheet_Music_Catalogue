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

get '/catalogue' do
  @books = Book.all() # Returns an array of objects
  erb(:index_all)
end

get '/catalogue/pieces' do
  @pieces = Piece.all()
  erb(:index_pieces)
end

get '/catalogue/new-piece' do
  erb(:new_piece)
end

get '/catalogue/new-book' do
  erb(:new_book)
end

get '/catalogue/new-piece' do
  erb(:new_piece)
end

get '/catalogue/new-piece-location' do
  erb(:new_piece_location)
end

get '/catalogue/:id/edit-book' do
  @book = Book.find(params['id'])
  erb(:edit_book)
end

# POST

post '/catalogue' do
  @book = Book.new(params)
  @book.save()
  erb(:create_book)
end

post '/catalogue/create_piece' do
  @piece = Piece.new(params)
  @piece.save()
  redirect to '/catalogue/pieces'
end

post '/catalogue/:id' do
  Book.new(params).update()
  redirect to '/catalogue'
end

post '/catalogue/:id/delete-book' do
  book = Book.find(params[:id])
  book.delete()
  redirect to '/catalogue'
end
