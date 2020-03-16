require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/piece.rb')
also_reload('../models/*')

get '/catalogue/pieces' do # PIECE
  @pieces = Piece.all()
  erb(:piece_index2)
end

get '/catalogue/new-piece' do # PIECE
  erb(:piece_new)
end

get '/catalogue/:id/edit-piece' do # PIECE
  @piece = Piece.find(params['id'])
  erb(:piece_edit)
end

post '/catalogue/create-piece' do # PIECE
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

post '/catalogue/:id/update-piece' do # PIECE
  Piece.new(params).update()
  redirect to '/catalogue/pieces'
end

post '/catalogue/:id/delete-piece' do # PIECE
  piece = Piece.find(params['id'])
  piece.delete()
  redirect to '/catalogue/pieces'
end
