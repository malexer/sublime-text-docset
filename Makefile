source_link := https://www.sublimetext.com/docs/index.html
local_path := ./www.sublimetext.com/
local_index := $(local_path)docs/index.html
built_path := ./sublime-text.docset/

all: clean download fix build

download:
	-wget \
		--convert-links \
		--recursive \
		--page-requisites \
		--no-parent \
		--no-clobber \
		"$(source_link)"
	# When /docs/ stops 3XXing to /docs/3/index.html, this and several
	#  lines in 'fix' can be removed
	-wget \
		--convert-links \
		--output-document=$(local_index) \
		"$(source_link)"

fix:
	-rm -r $(local_path)docs/3
	$(shell for f in $$(ls $(local_path)*.css\?*); do mv "$$f" "$${f%\?*}"; done )
	sed -i '' -e 's/\(href="\)https:\/\/www.sublimetext.com\/docs\//\1/g' $(local_index)
	sed -i '' -e 's/\(href="\)https:\/\/www.sublimetext.com\/\(.*\.css\)/\1..\/\2/g' $(local_index)
	find $(local_path) -iname '*.html' \
		| xargs -n1 sed -i '' -e '/<header>/,/<\/header>/d'

fix-css:
	echo $(shell for f in $$(ls $(local_path)*.css\?*); do echo "$$f : $${f%\?*}"; done )
	echo $(shell for f in $$(ls $(local_path)*.css\?*); do mv "$$f" "$${f%\?*}"; done )

build:
	dashing build

clean:
	-rm -r $(local_path)

clean-more:
	-rm -r $(local_path) $(built_path)
