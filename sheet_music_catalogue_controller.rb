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
  @books = Book.all()
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

get '/catalogue/new-piece-location' do
  @all_pieces = Piece.all()
  @all_books = Book.all()
  erb(:new_piece_location)
end

get '/catalogue/:id/edit-piece' do
  @piece = Piece.find(params['id'])
  erb(:edit_piece)
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
  if params['movement'].to_i < 1
    params['movement'] = -1
  end
  if params['opus'].to_i < 1
    params['opus'] = -1
  end
  if params['number'].to_i < 1
    params['number'] = -1
  end
  @piece = Piece.new(params)
  @piece.save()
  redirect to '/catalogue/pieces'
end

post '/catalogue/create-piece-location' do
  @piece_location = PieceLocation.new(params)
  @piece_location.save()
  redirect to '/catalogue'
end

post '/catalogue/:id' do
  Book.new(params).update()
  redirect to '/catalogue'
end

post '/catalogue/:id/update-piece' do
  Piece.new(params).update()
  redirect to '/catalogue/pieces'
end

post '/catalogue/:book_id/:piece_id/delete-piece-location' do
  relationship = PieceLocation.find(params['book_id'], params['piece_id'])
  relationship.delete()
  redirect to '/catalogue'
end

post '/catalogue/:id/delete-piece' do
  piece = Piece.find(params['id'])
  piece.delete()
  redirect to '/catalogue/pieces'
end

post '/catalogue/:id/delete-book' do
  book = Book.find(params['id'])
  book.delete()
  redirect to '/catalogue'
end
