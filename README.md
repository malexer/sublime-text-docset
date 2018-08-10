# How to generate the Sublime Text 3 docset

## Step 1: download html docs

    $ wget -k -r -p -np "https://www.sublimetext.com/docs/3/index.html"

## Step 2: create icon

Download favicon:

    $ wget "https://www.sublimetext.com/favicon.ico"

Convert to png:

    $ convert favicon.ico -resize 32x32 favicon.png

## Step 3: build docset

    $ dashing create
