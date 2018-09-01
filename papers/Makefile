SDBG=succinct-dbg
VODBG=variable-order-dbg
CDBG=colored-dbg
TEMP=temp

all: $(SDBG).pdf $(VODBG).pdf $(CDBG).pdf

$(SDBG).pdf:
	pushd $(SDBG); \
	latexmk -pdf wabi12camera.tex -outdir=../$(TEMP)/$(SDBG); \
	cp ../$(TEMP)/$(SDBG)/wabi12camera.pdf ../$@; \
	popd

$(VODBG).pdf:
	pushd $(VODBG); \
	latexmk -pdf varord-dbg.tex -outdir=../$(TEMP)/$(VODBG); \
	cp ../$(TEMP)/$(VODBG)/varord-dbg.pdf ../$@; \
	popd

$(CDBG).pdf:
	pushd $(CDBG); \
	latexmk -pdf document.tex -outdir=../$(TEMP)/$(CDBG); \
	cp ../$(TEMP)/$(CDBG)/document.pdf ../$@; \
	popd

clean:
	rm -rf $(TEMP)

