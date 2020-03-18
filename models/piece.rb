require('pg')
require('pry-byebug')

require_relative('../db/sql_runner.rb')

require_relative('piece.rb')
require_relative('piece_location.rb')

class Piece

  attr_reader :id
  attr_accessor :name, :suite, :movement, :catalogue_name, :opus, :work_number, :composer

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @suite = options['suite']
    @movement = options['movement'].to_i
    @catalogue_name = options['catalogue_name']
    @opus = options['opus'].to_i
    @work_number = options['work_number'].to_i
    @composer = options['composer']
  end

  def save()
    make_valid_numbers()
    sql = "INSERT INTO pieces
          (name,
            suite,
            movement,
            catalogue_name,
            opus,
            work_number,
            composer)
          VALUES
          ($1, $2, $3, $4, $5, $6, $7)
          RETURNING id"
    values = [@name,
              @suite,
              @movement,
              @catalogue_name,
              @opus,
              @work_number,
              @composer]
    piece_hash = SqlRunner.run(sql, values).first()
    @id = piece_hash['id'].to_i
  end

  def update()
    make_valid_numbers()
    sql = "UPDATE pieces SET
            (name, suite, movement, catalogue_name, opus, work_number, composer)
            =
            ($1, $2, $3, $4, $5, $6, $7)
            WHERE id = $8"
    values = [@name, @suite, @movement, @catalogue_name, @opus, @work_number, @composer, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM pieces WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def filled_fields()
    return filled_field = {
      'suite' => (@suite != '') ? true : false,
      'movement' => (@movement != 0) ? true : false,
      'catalogue_name' => (@catalogue_name != '') ? true : false,
      'opus' => (@opus != 0) ? true : false,
      'work_number' => (@work_number != 0) ? true : false,
    }
  end

  def self.find(id)
    sql = "SELECT * FROM pieces
            WHERE pieces.id = $1"
    values = [id]
    found_piece = SqlRunner.run(sql, values).first()
    return Piece.new(found_piece)
  end

  def self.all()
    sql = "SELECT * FROM pieces"
    pieces = SqlRunner.run(sql)
    return pieces.map { |piece| Piece.new(piece)}
  end

  def self.delete_all()
    sql = "DELETE FROM pieces"
    SqlRunner.run(sql)
  end

  def all_books()
    sql = "SELECT * FROM pieces
            INNER JOIN piece_locations ON pieces.id = piece_locations.piece_id
            INNER JOIN books ON books.id = piece_locations.book_id
            WHERE pieces.id = $1"
    values = [@id]
    books = SqlRunner.run(sql, values)
    return books.map { |book| Book.new(book) }
  end

  def make_valid_numbers()
    if @movement < 1
      @opus = 0
    end

    if @opus < 1
      @opus = 0
    end

    if @movement < 1
      @movement = 0
    end

  end

end
