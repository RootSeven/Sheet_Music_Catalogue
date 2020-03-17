DROP TABLE IF EXISTS piece_locations;
DROP TABLE IF EXISTS pieces;
DROP TABLE IF EXISTS books;

CREATE TABLE pieces (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  suite VARCHAR(255),
  movement INT,
  catalogue_name VARCHAR(255),
  opus INT,
  work_number INT,
  composer VARCHAR(255)
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  edition VARCHAR(255)
);

CREATE TABLE piece_locations (
  id SERIAL PRIMARY KEY,
  book_id INT REFERENCES books(id) ON DELETE CASCADE,
  piece_id INT REFERENCES pieces(id) ON DELETE CASCADE
);
