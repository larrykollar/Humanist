# Setting up a book

The Humanist Publishing System
makes it easy to achieve a consistent book format.
The Pandoc template
controls the overall structure,
while your CSS3 file controls formatting.

Your book can take two forms:

* A monolithic Markdown file.
  This is often a good way to work when the content
  has been generated or converted,
  and updates happen when the source content
  has changed and the book is regenerated.

* A "book" file,
  whose format is defined in [Book file format],
  specifying the order and hierarchy of topics
  defined in [Topic format].
  This is a flexible way to maintain a book,
  especially when stored in a source control system
  like GitHub or BitBucket.

Throughout this chapter,
refer to files in the `test` and `pandoc_scripts`
directories for examples.


Book file format: [bookfile.md]  
Topic format: [topic.md]
