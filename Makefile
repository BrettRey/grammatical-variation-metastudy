# Makefile for grammatical-variation-metastudy

MAIN = main
LATEX = xelatex
BIBER = biber

.PHONY: all pdf clean

all: pdf

pdf: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex refs.bib local-preamble.tex
	$(LATEX) $(MAIN)
	$(BIBER) $(MAIN)
	$(LATEX) $(MAIN)
	$(LATEX) $(MAIN)

clean:
	rm -f $(MAIN).aux $(MAIN).bbl $(MAIN).bcf $(MAIN).blg \
	      $(MAIN).log $(MAIN).out $(MAIN).run.xml $(MAIN).pdf
