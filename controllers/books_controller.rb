require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/book.rb')
also_reload('../models/*')

get '/catalogue/books' do # BOOK
  @books = Book.all()
  erb(:all_index)
end

get '/catalogue/new-book' do # BOOK
  erb(:book_new)
end

get '/catalogue/:id/edit-book' do # BOOK
  @book = Book.find(params['id'])
  erb(:book_edit)
end

post '/catalogue/create-book' do # BOOK
  @book = Book.new(params)
  @book.save()
  redirect to '/catalogue/books'
end

post '/catalogue/:id/update-book' do # BOOK
  Book.new(params).update()
  redirect to '/catalogue/books'
end

post '/catalogue/:id/delete-book' do # BOOK
  book = Book.find(params['id'])
  book.delete()
  redirect to '/catalogue/books'
end
