SDBG=succinct-dbg
VODBG=variable-order-dbg
CDBG=colored-dbg
TEMP=temp

all: $(SDBG).pdf $(VODBG).pdf $(CDBG).pdf

$(SDBG).pdf:
	cd $(SDBG); \
	latexmk -pdf wabi12camera.tex -outdir=../$(TEMP)/$(SDBG); \
	cp ../$(TEMP)/$(SDBG)/wabi12camera.pdf ../$@; \

$(VODBG).pdf:
	cd $(VODBG); \
	latexmk -pdf varord-dbg.tex -outdir=../$(TEMP)/$(VODBG); \
	cp ../$(TEMP)/$(VODBG)/varord-dbg.pdf ../$@; \

$(CDBG).pdf:
	cd $(CDBG); \
	latexmk -pdf document.tex -outdir=../$(TEMP)/$(CDBG); \
	cp ../$(TEMP)/$(CDBG)/document.pdf ../$@; \

clean:
	rm -rf $(TEMP)

clean-pdfs:
	rm -f $(SDBG).pdf $(VODBG).pdf $(CDBG).pdf

