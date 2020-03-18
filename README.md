# Sheet Music Catalogue
Sheet Music Catalogue is a relational database with a browser-based front-end that you can use to store the details of books of sheet music and their contents. It was coded in Ruby, and uses Sinatra to run in a browser.

## Using the App
To install, download this repository and run the file __app.rb__ using Ruby. Then open the app in a browser window.

## Functionality
With this app, you can:
- Add Books to your collection, storing their Name and Edition
- Add Pieces to your collection, storing their Name, Composer, Suite, Movement, Opus and Number
- Add Pieces to Books in your collection
- View the contents of each Book in your collection
- View which Books a specific Piece in your collection may be found in

### Guide
Use the navigation bar at the top of the page to navigate this app.

## Home
Home contains an explanation of how to use the app.

## Full Catalogue
This page allows you to view you collection by Book, with the Book's contents below.

## All Pieces in Catalogue
This page allows you to view your collection by Piece, with the Books the Piece appears in below.

## Books

# Add New Book
This form allows you to add a new Book. Type in the Book's Name and Edition, and press the Submit button. You will be redirected to the Full Catalogue page.

# Edit Book
Below a Book's details on the Full Catalogue is an Edit Book button. Click this to open a form which you can use to edit the details of a Book. Click Update Book and you will be redirected to the Full Catalogue page, with the Book's details updated.

# Delete Book
Below the Edit Book button is the Delete Book button. Click this button to delete the Book from your collection. Any Pieces which were in this Book will now no longer have this Book in their list of Books they appear in.

## Pieces
