# Sheet Music Catalogue

Repository link: https://github.com/RootSeven/Sheet_Music_Catalogue

Sheet Music Catalogue is a relational database with a browser-based front-end that you can use to store the details of books of sheet music and their contents. It was coded in Ruby, and uses Sinatra to run in a browser. The database was created using PostgreSQL, and the views were created using HTML and CSS.

## Using the App
To use this app, you must create a database called sheet_music_catalogue and run the SQL file. On Mac, you may do this by navigating to the Sheet_Music_Catalogue folder and using the commands:

__createdb sheet_music_catalogue__
__psql -d sheet_music_catalogue -f db/sheet_music_catalogue.sql__

To install, download this repository and run the file __app.rb__ using Ruby. Then open the app in a browser window.

## Functionality
With this app, you can:
- Add Books to your collection, storing their Name and Edition
- Add Pieces to your collection, storing their Name, Composer, Suite, Movement, Opus and Number
- Add Pieces to Books in your collection
- View the contents of each Book in your collection
- View which Books a specific Piece in your collection may be found in

## Guide
Use the navigation bar at the top of the page to navigate this app.

## Home
Found on the Navigation Bar at the top of the page. Home contains an explanation of how to use the app.

## Full Catalogue
Found on the Navigation Bar at the top of the page. This page allows you to view you collection by Book, with the Book's contents below.

## All Pieces in Catalogue
Found on the Navigation Bar at the top of the page. This page allows you to view your collection by Piece, with the Books the Piece appears in below.

## Books

### Add New Book
Found on the Navigation Bar at the top of the page. This form allows you to add a new Book. Type in the Book's Name and Edition, and press the Submit button. You will be redirected to the Full Catalogue page.

### Edit Book
Below a Book's details on the Full Catalogue is an Edit Book button. Click this to open a form which you can use to edit the details of a Book. Click Update Book and you will be redirected to the Full Catalogue page, with the Book's details updated.

### Delete Book
Below the Edit Book button is the Delete Book button. Click this button to delete the Book from your collection. Any Pieces which were in this Book will now no longer have this Book in their list of Books they appear in.

## Pieces

### Create New Piece
Found on the Navigation Bar at the top of the page. This form allows you to add a new Piece, including the details for:
- Piece Name
- Composer
- Suite
- Movement
- Catalogue Prefix (e.g. Op., BWV etc.)
- Opus
- and Number.

Suite, Movement, Catalogue Prefix, Opus and Number may be left blank if these do not have any values. Click the Create New Piece button. You will be redirected to the All Pieces in Catalogue page.

### Edit Piece
Below a Piece's details in the All Pieces in Catalogue page is an Edit Piece button. Click this to edit the details of the piece.

### Delete Piece
Below the Edit Piece button is the Delete Piece button. Click this to delete a piece from your collection.

## Relating Pieces with Books
Found on the Navigation Bar at the top of the page. The piece will no longer be found in any Books it was in on the Full Catalogue page.

### Add Piece to Book
Found on the Navigation Bar at the top of the page. Choose the Book and Piece you want to relate, and click Add Piece to Book. The Piece will now be listed in the Book's contents on the Full Catalogue page, and the Book will now be listed as one of the Piece's locations on the All Pieces in Catalogue page.
