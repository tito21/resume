
all: style.css source.md
	pandoc -s source.md --css style.css -o CV.html  

text: source.md
	pandoc source.md -o CV.md

pdf: style.css source.md
	pandoc source.md --pdf-engine wkhtmltopdf --css style.css -o CV.pdf
