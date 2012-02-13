OUTPUT=Personal-Statement.pdf Research-Proposal.pdf

LATEX=pdflatex 
RM=/bin/rm -f
MD=pandoc
MDFLAGS=--smart --normalize --template=Tufte-Article.template -t Latex

%.tex: %.md
	@${MD} ${MDFLAGS} -o $@ $<

%.pdf: %.tex
	@${LATEX} $(basename $< .tex)

all: $(OUTPUT) Makefile

Research-Proposal.tex: Research-Proposal.md Research-Proposal.bib
	@${MD} ${MDFLAGS} --natbib --bibliography Research-Proposal.bib Research-Proposal.md -o Research-Proposal.tex

Research-Proposal.pdf: Research-Proposal.tex Research-Proposal.bib
	@${LATEX} Research-Proposal
	bibtex Research-Proposal
	@${LATEX} Research-Proposal
	@${LATEX} Research-Proposal

tidy:
	@${RM} $(wildcard *.aux) $(wildcard *.log) $(wildcard *.out) $(wildcard *.tex) $(wildcard *.bbl) $(wildcard *.blg)

clean: tidy
	@${RM} $(wildcard *.pdf)

check:
	aspell -c $(wildcard *.md)
	languagetool $(wildcard *.md) | $(PAGER)
	diction --beginner --suggest $(wildcard *.md) | $(PAGER)
	style -p $(wildcard *.md) | $(PAGER)
	wc $(wildcard *.md)

