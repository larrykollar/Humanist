# Introduction

What do we mean by a *humanist publishing system*?
In short, the human users are in charge.
A humanist publishing system means:

* normal humans can use, maintain, and even update it,
  with a minimum of training.
* it has only one or two mandatory tools,
  and allows the humans to select how they interact with it.
  Most components are interchangeable or replacable.
* it is not only standards-based, but focuses on **common** standards.
  For example, use a specific Markdown variant rather than XML;
  formatting scripts shun XSLT in favor of CSS3;
  scripts should (as far as possible) use languages specified by POSIX
  (`sh`, `awk`).

Docs-as-code workflows work well with both humanist
and more complex publishing systems.
Many SSG (Static Site Generator)-based systems (Jekyll, Docusaurus, others)
have humanist features,
although they also have deep dependencies on
Ruby (Jekyll) or Python (Docusaurus), or other trendy scripting languages.
Further, none of the SSG-based systems
are intended to produce mostly PDF instead of HTML.
Some companies
want or need PDF-centric documentation deliverables.
Maybe you work for one,
and have not been able to convince the "right" people that documentation:

* can also be a marketing tool.
* can help potential customers feel comfortable
  with choosing your product because they understand how it works.

But while you're fighting that fight,
you can still set up a docs-as-code workflow
and produce PDFs until you can at last push your content online.

This is where the %vars.ProdName% comes in.
It is based on a handful of scripts, [Pandoc],
and a CSS-based PDF engine.
The one non-POSIX script is a Pandoc filter,
written in Lua,
and you can replace it with an `awk`-based filter if you prefer.
