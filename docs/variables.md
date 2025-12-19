# Variables

Define variables in the YAML metadata file.
Any key-value pair can be used as a variable in topics,
as long as the key contains no spaces.

To use a variable,
put it between percent (%) symbols:

    The %ProdTitle% provides...
    See %links.installation% for instructions.

You can use YAML lists to separate
links, images, and text variables if you wish.
The following is an example:

```yaml
# Variables
vars:
  ProdName: Widget 2000 HyperWidget
  ProdNameShort: HyperWidget

# Images
imgs:
  logo: "![Oje Media](Graphics/oje_icon.png){width=1.25in}"
```

You can put plain text, Markdown, or HTML in variables.
