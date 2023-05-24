
BROWSER=brave-browser

html: style.css source.md
	pandoc -s source.md --css style.css -o CV.html

text: source.md
	pandoc source.md -o tmp.md -t markdown_strict
	cat name.txt tmp.md > CV.md
	rm tmp.md

pdf: style.css source.md
	$(BROWSER) --headless --disable-gpu --print-to-pdf=CV.pdf file:///CV.html

docx: source.md
	pandoc source.md -o CV.docx

all: html text pdf docx

