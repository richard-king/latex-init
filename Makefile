# Modified from: https://gist.github.com/yy/808914

TEX = pdflatex -interaction nonstopmode
BIB = bibtex
GS = gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite

PAPER = paper
BIBFILE = paper.bib
BUNDLE = paper.pdf

all: $(PAPER).pdf
	$(GS) -sOutputFile=$(BUNDLE) $(PAPER).pdf

view: $(BUNDLE)
	evince $(BUNDLE) &

spell::
	ispell *.tex

clean::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.xml *-blx.bib

clear::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.xml *-blx.bib *.pdf
	clear

$(PAPER).pdf: $(PAPER).tex $(PAPER).bbl
	$(TEX) $(PAPER)
	$(TEX) $(PAPER)

$(PAPER).bbl: $(PAPER).tex $(BIBFILE)
	$(TEX) $(PAPER)
	$(BIB) $(PAPER)
