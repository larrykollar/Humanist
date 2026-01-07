# Gitignore tips

If using Git or GitHub,
put the following rules in your `.gitignore` file
to avoid cluttering your repository
with output files:

```
*.html
*.pdf
xxx.md
```

Replace `xxx.md` with the name of
the intermediate monolithic Markdown file
created by *stitch*.
Add (or delete) any other intermediate or test files
before your next commit.

If you are using the %vars.ProdName% under MacOS,
add `.DS_Store` to the list.

<!-- more to come, I expect -->
