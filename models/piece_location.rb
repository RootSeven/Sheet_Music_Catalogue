require('pg')

require_relative('../db/sql_runner.rb')

require_relative('piece.rb')
require_relative('book.rb')

class PieceLocation

  attr_reader :id, :book_id, :piece_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @book_id = options['book_id'].to_i
    @piece_id = options['piece_id'].to_i
  end

  def save()
    sql = "INSERT INTO piece_locations
            (book_id, piece_id)
            VALUES
            ($1, $2)
            RETURNING id"
    values = [@book_id, @piece_id]
    piece_location_hash = SqlRunner.run(sql, values).first()
    @id = piece_location_hash['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM piece_locations"
    SqlRunner.run(sql)
  end

end
