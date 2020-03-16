### Sheet Music Catalogue

A relational database which allows the user to keep track of their books of sheet music and the pieces inside of them. A book of sheet music may contain many pieces, and a piece may appear in many books of sheet music.

#### MVP

The app should allow the user to:
x create and edit their books of sheet music.
x create and edit the pieces of music they own.
x associate certain pieces with certain books of sheet music.
x see a list of all the books of sheet music they own, and their contents.
x see the contents of a specific book they own.
x see all of the locations of a specific piece (e.g. a Chopin Nocturne may be found in both a compilation of Chopin Nocturnes and an exam syllabus book, so it would show both of them).

#### Possible Extensions

- The database could be restructured with a Composers table to allow the user to see which pieces they own by a particular composer.
- The Composers table could contain what musical period a composer was from (e.g. the Baroque period, the Classical period, the Romantic period, etc.), and then show the user the composition of their library by style, and the user's "favourite composer" (e.g. the composer who composed the most music in their library).
- Composer information could be displayed on different pages with the composer's picture, their date of birth and death, and their list of compositions.

#### Other Considerations

I realise I could use ISBN as a primary key in the Books table. However, I have opted not to implement this at present, as the likelihood of inputting the number incorrectly is high.
