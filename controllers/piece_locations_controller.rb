require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/piece_location.rb')
require_relative('../models/book.rb')
require_relative('../models/piece.rb')
also_reload('../models/*')

get '/catalogue/new-piece-location' do # PIECE LOCATION
  @all_pieces = Piece.all()
  @all_books = Book.all()
  erb(:piece_location_new)
end

post '/catalogue/create-piece-location' do # PIECE LOCATION
  @piece_location = PieceLocation.new(params)
  @piece_location.save()
  redirect to '/catalogue/books'
end

post '/catalogue/:book_id/:piece_id/delete-piece-location' do # PIECE LOCATION
  relationship = PieceLocation.find(params['book_id'], params['piece_id'])
  relationship.delete()
  redirect to '/catalogue/books'
end
