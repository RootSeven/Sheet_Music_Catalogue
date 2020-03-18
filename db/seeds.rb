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
  'work_number' => 0,
  'composer' => 'Claude Debussy',
  })

piece2 = Piece.new({
  'name' => 'Jimbo\'s Lullaby',
  'suite' => 'Children\'s Corner',
  'movement' => 2,
  'catalogue_name' => 'L.',
  'opus' => 113,
  'work_number' => 0,
  'composer' => 'Claude Debussy',
  })

piece3 = Piece.new({
  'name' => 'Adriana',
  'suite' => 'Valses venezolanos',
  'movement' => 7,
  'catalogue_name' => '',
  'opus' => 0,
  'work_number' => 0,
  'composer' => 'Miguel Astor',
  })

piece4 = Piece.new({
  'name' => 'Je te veux',
  'suite' => '',
  'movement' => 0,
  'catalogue_name' => '',
  'opus' => 0,
  'work_number' => 0,
  'composer' => 'Erik Satie',
  })

piece5 = Piece.new({
  'name' => 'Gigue',
  'suite' => 'French Suite No.5 in G',
  'movement' => 7,
  'catalogue_name' => 'BWV',
  'opus' => 816,
  'work_number' => 0,
  'composer' => 'Johann Sebastian Bach',
  })

piece1.save()
piece2.save()
piece3.save()
piece4.save()
piece5.save()

# Books

book1 = Book.new({
  'name' => 'ABRSM Grade 8 Piano Exam Pieces 2017 & 2018',
  'edition' => 'ABRSM'
  })

book2 = Book.new({
  'name' => 'Children\'s Corner: Little Suite for Piano',
  'edition' => 'Urtext'
  })

book3 = Book.new({
  'name' => 'Je te veux: valse chantee pour chant & piano',
  'edition' => 'Salabert Editions'
  })

book1.save()
book2.save()
book3.save()

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

piece_location5 = PieceLocation.new({
  'book_id' => book3.id,
  'piece_id' => piece4.id
  })

piece_location6 = PieceLocation.new({
  'book_id' => book1.id,
  'piece_id' => piece5.id
  })

piece_location1.save()
piece_location2.save()
piece_location3.save()
piece_location4.save()
piece_location5.save()
piece_location6.save()
