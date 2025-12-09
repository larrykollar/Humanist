# Best practices

If source control is available,
break your documentation into topics.
This allows reuse and facilitates
reviews by viewing a few short files
rather than spacing through one large file.

Use Unix (LF) line endings for all files,
rather than Windows (CR+LF) when possible.

Start sentences and phrases on a new line.
This flows well with a source control system
when updating topics.

Use [reference links] for links and images
(some systems refer to these as "keys").
You can create a key file,
specifying all the links and images in the book,
then append it to the generated book
at publishing time.
This allows you to change images or links in one place.

Use HTML where Markdown is insufficient.
Use variables, discussed in [Book metadata format],
to facilitate reuse.

Avoid using large tables,
especially if your readers
use phones or other small screens
to read your documentation.


Book metadata format: [bookmeta.md]  
Reference links: [https://pandoc.org/MANUAL.html#reference-links]
