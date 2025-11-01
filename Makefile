

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	BROWSER=chromium-browser
endif
ifeq ($(UNAME_S),Darwin)
	BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
endif
# BROWSER=start chrome # Should work on windows but for me is not working

BIB=references.bib
CSL=IEEE_cv.csl

html: style.css source.md
	pandoc -s source.md --css style.css --embed-resources --standalone \
		--citeproc \
		--bibliography=$(BIB) \
		--csl=$(CSL) \
		-o CV.html

text: source.md
	pandoc source.md -t markdown_strict-raw_html \
		--citeproc \
		--bibliography=$(BIB) \
		--csl=$(CSL) \
		-o tmp.md
	cat name.txt tmp.md > CV.md
	rm tmp.md

pdf: html
	$(BROWSER) --headless --no-pdf-header-footer --print-to-pdf="CV.pdf" "CV.html"

docx: source.md
	pandoc source.md \
		--citeproc \
		--bibliography=$(BIB) \
		--csl=$(CSL) \
		-o CV.docx

all: html text pdf docx

