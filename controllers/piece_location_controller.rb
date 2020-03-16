require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/book.rb')
require_relative('../models/piece.rb')
require_relative('../models/piece_location.rb')

get '/catalogue/new-piece-location' do
  @all_pieces = Piece.all()
  @all_books = Book.all()
  erb(:piece_location_new)
end

post '/catalogue/create-piece-location' do
  @piece_location = PieceLocation.new(params)
  @piece_location.save()
  redirect to '/catalogue'
end

post '/catalogue/:book_id/:piece_id/delete-piece-location' do
  relationship = PieceLocation.find(params['book_id'], params['piece_id'])
  relationship.delete()
  redirect to '/catalogue'
end
