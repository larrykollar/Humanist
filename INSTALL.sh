#!/bin/sh

# make sure we're in the right directory before continuing
if [ `basename $PWD` != "Humanist" ]; then
  echo "Run this script from the Humanist directory."
  exit 1
fi

# if XDG_DATA_HOME does not exist,
# default Pandoc install dir is $HOME/.local/share/pandoc
pandoc_scripts=$HOME/.local/share/pandoc
if [ ! -z ${XDG_DATA_HOME+x} ]; then
  pandoc_scripts=$XDG_DATA_HOME/pandoc;
fi
echo Pandoc scripts will be copied to ${pandoc_scripts}.

# copy default.html and vars.lua
mkdir -p ${pandoc_scripts}/filters ${pandoc_scripts}/templates
cp pandoc_scripts/default.html ${pandoc_scripts}/templates
cp pandoc_scripts/vars.lua ${pandoc_scripts}/filters

# copy scripts to ~/bin
mkdir -p $HOME/bin
cp scripts/humanist scripts/stitch $HOME/bin
chmod +x $HOME/bin/humanist $HOME/bin/stitch

# make sure $PATH includes ~/bin
echo $PATH | grep -q "$HOME/bin:" || (
  printf "# $HOME/bin added to PATH by Humanist install: " >> $HOME/.profile
  date >>$HOME/.profile
  echo "export PATH=${HOME}/bin:${PATH}" >> $HOME/.profile
  export PATH=${HOME}/bin:${PATH} # so we can use it right away
)

# check for presence of Pandoc and PDF formatters
# print links for each if needed
which -s pandoc || (
  echo "Pandoc is required for the Humanist Publishing System."
  echo "See <https://pandoc.org/installing.html> for installion info."
)
which -s weasyprint || (
  echo "weasyprint is the default PDF formatter <weasyprint.org>."
  echo "You can use a different formatter; see the Pandoc docs"
  echo "<https://pandoc.org/MANUAL.html#option--pdf-engine> for details."
  echo "Ignore this message if you chose a different formatter."
)
