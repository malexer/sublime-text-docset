*Note: further development and support have moved to:* https://github.com/SublimeText/sublime-text-docset

# Sublime Text Docset

[Dash][]/[Zeal][] docset for [Sublime Text][st]’s official [documentation][st-docs].

## Building

### Requirements

* `make`
* [`dashing`][dashing]
* `sed` (with `-E` support), `find`, `wget`

### Steps

1.
    ``` sh
    make
    ```

## Installation

### Dash locally-built docset

1. Open Dash.
1. <kbd>Cmd</kbd>+<kbd>,</kbd>
1. Open the "Docsets" tab.
1. Click the <kbd>+</kbd>.
1. Choose "Add Local Docset".
1. Select the `sublime-text.docset` in this folder.
1. Optionally change the keyword.

### Zeal locally-built docset

1. Find your docset folder ("Docset storage" in your Preferences)
1. Copy or symlink `sublime-text.docset` to that folder.

[Dash]: https://kapeli.com/dash
[Zeal]: https://zealdocs.org
[st]: https://www.sublimetext.com/
[st-docs]: https://www.sublimetext.com/docs/index.html
[dashing]: https://github.com/technosophos/dashing#readme
