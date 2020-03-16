require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/pieces_controller.rb')
require_relative('controllers/piece_locations_controller.rb')
require_relative('controllers/books_controller.rb')

get '/' do
  erb(:homepage)
end
