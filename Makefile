OUTPUT=Personal-Statement.pdf

LATEX=pdflatex
RM=/bin/rm -f
MD=pandoc
MDFLAGS=--smart --normalize --template=Tufte-Article.template -t Latex

%.tex: %.md
	@${MD} ${MDFLAGS} -o $@ $<

%.pdf: %.tex
	@${LATEX} $(basename $< .tex)

all: $(OUTPUT) Makefile

tidy:
	@${RM} $(wildcard *.aux) $(wildcard *.log) $(wildcard *.out) $(wildcard *.tex)

clean: tidy
	@${RM} $(wildcard *.pdf)
