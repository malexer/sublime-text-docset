# Overview

Instruction how to build Dash docset for Sublime Text 3 official documentation.

# Requirements

* [dashing](https://github.com/technosophos/dashing#readme)
* [imagemagick](https://www.imagemagick.org)

# How to generate the docset

## Step 1: prepare html docs

Download html documentation from Sublime Text website:

    $ wget -k -r -p -np "https://www.sublimetext.com/docs/3/index.html"

Remove website header (not needed for docs):

    $ find ./www.sublimetext.com -iname '*.html' | xargs -n1 sed -i '' -e '/<header>/,/<\/header>/d'

Fix title in one page:

    $ sed -i '' -e 's/<title>Distraction Free Mode/<title>Tab Completion/' ./www.sublimetext.com/docs/3/tab_completion.html

## Step 2: create icon

Download favicon:

    $ wget "https://www.sublimetext.com/favicon.ico"

Convert to png:

    $ convert favicon.ico -resize 32x32 favicon.png
    $ mv favicon-1.png favicon.png
    $ rm -f favicon-0.png favicon-2.png

## Step 3: build docset

    $ dashing build
