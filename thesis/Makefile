all: thesis.pdf

thesis.pdf:
	latexmk -pdf thesis.tex

clean:
	latexmk -C;
	rm -f thesis.pdf

clean-pdfs:
	rm -f *.pdf

