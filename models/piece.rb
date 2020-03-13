require('pg')

require_relative('../db/sql_runner.rb')

require_relative('piece.rb')
require_relative('piece_location.rb')

class Piece

  attr_reader :id
  attr_accessor :name, :suite, :movement, :catalogue_name, :opus, :number, :composer

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @suite = options['suite']
    @movement = options['movement'].to_i
    @catalogue_name = options['catalogue_name']
    @opus = options['opus'].to_i
    @number = options['number'].to_i
    @composer = options['composer']
  end

  def save()
    sql = "INSERT INTO pieces
          (name,
            suite,
            movement,
            catalogue_name,
            opus,
            number,
            composer)
          VALUES
          ($1, $2, $3, $4, $5, $6, $7)
          RETURNING id"
    values = [@name,
              @suite,
              @movement,
              @catalogue_name,
              @opus,
              @number,
              @composer]
    piece_hash = SqlRunner.run(sql, values).first()
    @id = piece_hash['id'].to_i
  end

  def update()
    sql = "UPDATE pieces SET
            (name, suite, movement, catalogue_name, opus, number, composer)
            =
            ($1, $2, $3, $4, $5, $6, $7)
            WHERE id = $8"
    values = [@name, @suite, @movement, @catalogue_name, @opus, @number, @composer, @id]
    SqlRunner.run(sql, values)
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

end
