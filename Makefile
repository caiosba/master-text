all: template.pdf

template.pdf:
	pdflatex template && bibtex template && pdflatex template && pdflatex template && rm -f *.aux *.blg *.out *.bbl *.log *.toc

clean:
	rm -f template.pdf
