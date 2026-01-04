# PDF engine notes

Open-source PDF engines can be finicky,
requiring the OS and certain packages to be fairly recent.
Depending on which engine you choose,
there may be some extra setup and usage steps.

## Weasyprint {.section}

Pandoc uses Weasyprint as the default PDF engine.
As of December 2025, you can install Weasyprint v67.0
on a current POSIX system
with Python 3.10 or newer, and Pango 1.44 or newer.
Install Weasyprint in a Python virtual environment (*venv*),
to avoid clashing with other modules:

```sh
python3 -m venv venv
source venv/bin/activate
pip install weasyprint
```

After installation, type `weasyprint --info`
to verify the software was installed properly.

You can exit the virtual environment using `deactivate`,
and then re-enter it later using `source venv/bin/activate`.

## Vivliostyle {.section}

[Vivliostyle] is not directly supported by Pandoc,
but you can either:

* generate HTML from Pandoc and create the PDF with
  `vivliostyle build book.html -o book.pdf`

* generate PDF directly from the Markdown file,
  bypassing Pandoc.
  The command becomes `vivliostyle build book.md -o book.pdf`.
  However, bypassing Pandoc means variables are not processed.

To install Vivliostyle, you need a recent version of `node.js`
installed on your system.

Once you have installed it,
`vivliostyle init` creates the configuration file for your document.
You need to modify this file to contain
either the Markdown or HTML file that you intend to input.


Vivliostyle: [https://github.com/vivliostyle/vivliostyle-cli]
