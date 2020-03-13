require('pg')

require_relative('../db/sql_runner.rb')

require_relative('book.rb')
require_relative('piece_location.rb')

class Book

  attr_reader :id, :name, :edition

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @edition = options['edition']
  end

  def save()
    sql = "INSERT INTO books
            (name, edition)
            VALUES
            ($1, $2)
            RETURNING id"
    values = [@name, @edition]
    book_hash = SqlRunner.run(sql, values).first()
    @id = book_hash['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM books"
    books = SqlRunner.run(sql)
    book_objects = books.map { |book| Book.new(book)}
    return book_objects
  end

  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

end
