require('pg')
require_relative('../db/sql_runner.rb')

require_relative('book.rb')
require_relative('piece_location.rb')

class Book

  attr_reader :id
  attr_accessor :name, :edition

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

  def update()
    sql = "UPDATE books SET (name, edition) = ($1, $2)
            WHERE id = $3"
    values = [@name, @edition, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM books WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def all_pieces()
    sql = "SELECT * FROM books
            INNER JOIN piece_locations ON books.id = piece_locations.book_id
            INNER JOIN pieces ON piece_locations.piece_id = pieces.id
            WHERE books.id = $1"
    values = [@id]
    pieces = SqlRunner.run(sql, values)
    return pieces.map { |piece| Piece.new(piece)}
  end

  def self.find(id)
    sql = "SELECT * FROM books
            WHERE books.id = $1"
    values = [id]
    found_book = SqlRunner.run(sql, values).first()
    return Book.new(found_book)
  end

  def self.all()
    sql = "SELECT * FROM books"
    books = SqlRunner.run(sql)
    return books.map { |book| Book.new(book)}
  end

  def self.delete_all()
    sql = "DELETE FROM books"
    SqlRunner.run(sql)
  end

end
