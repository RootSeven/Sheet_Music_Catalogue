require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/book.rb')
also_reload('../models/*')

get '/catalogue' do
  @books = Book.all()
  erb(:all_index)
end

get '/catalogue/new-book' do
  erb(:book_new)
end

get '/catalogue/:id/edit-book' do
  @book = Book.find(params['id'])
  erb(:book_edit)
end

post '/catalogue' do
  @book = Book.new(params)
  @book.save()
  redirect to '/catalogue'
end

post '/catalogue/:id' do
  Book.new(params).update()
  redirect to '/catalogue'
end

post '/catalogue/:id/delete-book' do
  book = Book.find(params['id'])
  book.delete()
  redirect to '/catalogue'
end
