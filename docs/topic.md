# Topic format

Maintaining sections as separate topics
provides several advantages over monolithic
book files:

* It is often easier to rearrange a book
  when you need to move a single line
  rather than the entire section.

* With some care, a topic can be reused
  in many different books.

  For example, you document a product line
  of widgets that have the same base capabilities,
  and different models have different extensions.
  You can document the base capabilities once,
  and any updates to those topics would affect
  the entire product line without further effort.

While it may seem counter-intuitive at first,
all topics begin with a level 1 heading (`#`).
This allows the topic to appear at different
levels in different books,
because the `stitch` utility adjusts as necessary.

If you find you need to add sub-sections to a topic,
without breaking the content into a separate topic,
you can do so.
Try to limit the depth as much as possible.
You can use Pandoc's `{.class}` construct on headings
to define their roles.
A sub-heading like `## Example {.example}`
could be formatted in the CSS to have a light grey backgound,
for example.

The next section describes the format
for the "book" file.
