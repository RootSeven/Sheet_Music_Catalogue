require('pry-byebug')

require_relative('../models/book.rb')
require_relative('../models/piece.rb')
require_relative('../models/piece_location.rb')

PieceLocation.delete_all
Piece.delete_all
Book.delete_all

# Pieces

piece1 = Piece.new({
  'name' => 'Doctor Gradus ad Parnassum',
  'suite' => 'Children\'s Corner',
  'movement' => 1,
  'catalogue_name' => 'L.',
  'opus' => 113,
  'number' => -1,
  'composer' => 'Debussy, Claude',
  })

piece2 = Piece.new({
  'name' => 'Jimbo\'s Lullaby',
  'suite' => 'Children\'s Corner',
  'movement' => 2,
  'catalogue_name' => 'L.',
  'opus' => 113,
  'number' => -1,
  'composer' => 'Debussy, Claude',
  })

piece3 = Piece.new({
  'name' => 'Adriana',
  'suite' => 'Valses venezolanos',
  'movement' => 7,
  'catalogue_name' => '',
  'opus' => -1,
  'number' => -1,
  'composer' => 'Astor, Miguel',
  })

piece1.save()
piece2.save()
piece3.save()

# Books

book1 = Book.new({
  'name' => 'ABRSM Grade 8 Piano Exam Pieces 2017 & 2018',
  'edition' => 'ABRSM'
  })

book2 = Book.new({
  'name' => 'Children\'s Corner: Little Suite for Piano',
  'edition' => 'Urtext'
  })

book1.save()
book2.save()

# Piece Locations

piece_location1 = PieceLocation.new({
  'book_id' => book1.id,
  'piece_id' => piece1.id,
  })

piece_location2 = PieceLocation.new({
  'book_id' => book2.id,
  'piece_id' => piece1.id,
  })

piece_location3 = PieceLocation.new({
  'book_id' => book2.id,
  'piece_id' => piece2.id,
  })

piece_location4 = PieceLocation.new({
  'book_id' => book1.id,
  'piece_id' => piece3.id
  })

piece_location1.save()
piece_location2.save()
piece_location3.save()
piece_location4.save()

binding.pry
nil
