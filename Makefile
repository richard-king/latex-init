# Modified from: https://gist.github.com/yy/808914

TEX = pdflatex -interaction nonstopmode
BIB = bibtex

INPUT = paper
BIBFILE = paper.bib
OUTPUT = paper.pdf

all: $(INPUT).pdf

view: $(OUTPUT)
	evince $(OUTPUT) &

spell::
	ispell *.tex

clean::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.xml *-blx.bib

clear::
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.xml *-blx.bib *.pdf
	clear

$(INPUT).pdf: $(INPUT).tex $(INPUT).bbl
	$(TEX) $(INPUT)
	$(TEX) $(INPUT)

$(INPUT).bbl: $(INPUT).tex $(BIBFILE)
	$(TEX) $(INPUT)
	$(BIB) $(INPUT)
