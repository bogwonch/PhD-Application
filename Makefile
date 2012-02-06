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

check:
	aspell -c $(wildcard *.md)
	languagetool $(wildcard *.md) | $(PAGER)
	diction --beginner --suggest $(wildcard *.md) | $(PAGER)
	style -n -p $(wildcard *.md) | $(PAGER)
	wc $(wildcard *.md)

