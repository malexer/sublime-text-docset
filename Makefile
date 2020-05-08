all: clean download fix build

download:
	-wget \
		--convert-links \
		--recursive \
		--adjust-extension \
		--page-requisites \
		--no-parent \
		--no-clobber \
		"https://www.sublimetext.com/docs/index.html"
	# When /docs/ stops 3XXing to /docs/3/index.html, this and the first two
	#  lines in 'fix' can be removed
	-wget \
		--convert-links \
		--output-document=./www.sublimetext.com/docs/index.html \
		"https://www.sublimetext.com/docs/index.html"

fix:
	rm -r ./www.sublimetext.com/docs/3
	sed -i '' -e 's/\(href="\)https:\/\/www.sublimetext.com\/docs\//\1/g' ./www.sublimetext.com/docs/index.html
	find ./www.sublimetext.com -iname '*.html' \
		| xargs -n1 sed -i '' -e '/<header>/,/<\/header>/d'

build:
	dashing build

clean:
	-rm -r www.sublimetext.com

clean-more:
	-rm -r www.sublimetext.com sublime-text.docset
