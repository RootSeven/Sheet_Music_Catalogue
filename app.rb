require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/book_controller.rb')
require_relative('controllers/piece_controller.rb')
require_relative('controllers/piece_location_controller.rb')

get '/' do
  erb(:homepage)
end
