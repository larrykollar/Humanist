# The Humanist Publishing System

The TL;DR: a *humanist publishing system* means:

* normal humans can use, maintain, and even update it,
  with a minimum of training.
* it has only one or two mandatory tools,
  and allows the humans to select how they interact with it.
  Most components are replaceable.
* it is not only standards-based,
  but focuses on **common**, **well-known** standards.
  For example, use a specific Markdown variant rather than XML;
  formatting scripts shun XSLT in favor of CSS3;
  scripts should (as far as possible) use languages specified by POSIX
  (`sh`, `awk`, `sed`).

Many SSG-based systems (Jekyll, Docusaurus, others)
already have many of these features,
although they may have deep dependencies on
Ruby (Jekyll) or Python (Docusaurus), or other trendy scripting languages.
Further, none of the SSG-based systems
are intended to produce mostly PDF instead of HTML.
Some companies
want or need PDF-centric documentation deliverables.
Maybe you work for one,
and have not been able to convince the "right" people
that documentation can:

* be a marketing tool.
* help potential customers feel comfortable
  with choosing your product because they know how it works.

But while you're fighting that fight,
you can still set up a docs-as-code workflow
and produce PDFs until you can at last push your content online.

This is where the Humanist Publishing System comes in.
It is based on a handful of scripts and [Pandoc],
the only mandatory "extra" tool in the suite.
See the [documentation] for more information.


[Pandoc]: https://pandoc.org
[documentation]: docs/README.md
