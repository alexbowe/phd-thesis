TEMP=temp

all: thesis.pdf

thesis.pdf:
	latexmk -pdf thesis.tex -outdir=$(TEMP)/; \
	mv $(TEMP)/thesis.pdf ./

clean:
	rm -rf $(TEMP)

clean-pdfs:
	rm -f *.pdf

