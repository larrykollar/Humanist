# Book metadata format

Pandoc uses a YAML file,
that can be standalone or embedded in the Markdown,
to define book metadata.
The following is an example of book metadata:

```yaml
---
# head block info
title: Maintenance and Troubleshooting Guide
author: T. Eckwrit
css: widgetbook.css
institution: Widgets, LLC
date: December 2025
version: "Draft 1.1"
document-css: false
toc-title: Table of Contents
lang: en-US

# Cover page
include-before: |
  <div class="maintitle">
    <p class="title-product">%vars.ProdName%</p>
  </div>
  <p style="text-align: center;">%imgs.coverimg%</p>
  <p class="title-subtitle">%vars.ProdSub%</p>
  <p class="title-subtitle">%vars.BookType%</p>

# Publication History
pub-history: |
  <p><b class="date">December 2025</b>: First draft.</p>

# Links
links:
  login: <a href="#login">Logging into the HyperWidget</a>

# Citations
cites:
  install: HyperWidget Installation Guide

# Images
imgs:
  coverimg: <img src="../../Graphics/hyperwidget_iso.png" class="img-landscape" alt="Hyperwidget isometric view." />
  warning: <img src="../../../common/warning.svg" class="img-symbol" alt="WARNING:" />

# Variables
vars:
  ProdName: Widget 2000 HyperWidget
  ProdNameShort: HyperWidget
  ProdSub: Intelligent Widget
  BookType: Maintenance and Troubleshooting Guide
---
```

Let's look at this, section by section.

## The HEAD block {.section}

The beginning section mostly defines what appears
in the HTML output file's `<head>` block.
The two exceptions:

* `document-css: false` --- this suppresses the CSS
  that Pandoc would otherwise include.
  This implies that `widgetbook.css`
  contains all the necessary rules to format the book.

* `toc-title: Table of Contents` --- defines the title
  for the table of contents.
  The template substitutes `$toc-title$` with this value.

## Front matter {.section}

The value of the `include-before` key
is the first content in the HTML `<body>`.
In this example, it is only the title page;
you could add a copyright statement here as well.

The title page is optionally followed
by a publication history, specified by the `pub-history` block.
The default heading is "Publication History,"
the value of `pubhist-title` overrides it.

The template outputs the table of contents next.
The default heading is "Table of Contents,"
the value of `toc-title` overrides it.

## Variables {.section}

The rest of the YAML file defines links,
citations, images, and variables.
This is not strictly necessary,
but does help to keep things organized
and allows (for example) a link destination
and an image to use the same name.

In the Markdown content,
insert the key name between `%` symbols.
Examples:

* `%cite.install%` \<-- replaced with "Hyperwidget Installation Guide"
* `%version%` \<-- replaced with "Draft 1.1"
  (you can use any key in the YAML file)

**Important**: keep your variable key definitions
consistent across your documentation suite.
This helps you reuse topics that might otherwise
have to be copy/pasted and adjusted.
