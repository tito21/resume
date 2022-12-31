
html: style.css source.md
	pandoc -s source.md --css style.css -o CV.html  

text: source.md
	pandoc source.md -o tmp.md -t markdown_strict
	cat name.txt tmp.md > CV.md
	rm tmp.md

pdf: style.css source.md
	pandoc source.md --pdf-engine wkhtmltopdf --css style.css -o CV.pdf

all: html text pdf

