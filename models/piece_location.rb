require('pg')

require_relative('../db/sql_runner.rb')

require_relative('piece.rb')
require_relative('book.rb')

class PieceLocation

  attr_reader :id
  attr_accessor :book_id, :piece_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @book_id = options['book_id'].to_i
    @piece_id = options['piece_id'].to_i
  end

  def save()
    if PieceLocation.find(@book_id, @piece_id).nil?
      sql = "INSERT INTO piece_locations
              (book_id, piece_id)
              VALUES
              ($1, $2)
              RETURNING id"
      values = [@book_id, @piece_id]
      piece_location_hash = SqlRunner.run(sql, values).first()
      @id = piece_location_hash['id'].to_i
    end
  end

  def update()
    sql = "UPDATE piece_locations SET (book_id, piece_id) = ($1, $2)
          WHERE id = $3"
    values = [@book_id, @piece_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM piece_locations WHERE piece_locations.id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(bk_id, pc_id)
    sql = "SELECT * FROM piece_locations
            WHERE (piece_locations.book_id, piece_locations.piece_id)
            = ($1, $2)"
    values = [bk_id, pc_id]
    found_relationship = SqlRunner.run(sql, values).first()
    return found_relationship.nil? != true ? PieceLocation.new(found_relationship) : nil
  end

  def self.all()
    sql = "SELECT * FROM piece_locations"
    piece_location_array = SqlRunner.run(sql)
    return piece_location_array.map { |piece_location| PieceLocation.new(piece_locations)}
  end

  def self.delete_all()
    sql = "DELETE FROM piece_locations"
    SqlRunner.run(sql)
  end

end
