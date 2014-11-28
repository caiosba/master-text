all: template.pdf

template.pdf:
	pdflatex template && bibtex template && pdflatex template && pdflatex template && rm -f *.aux *.blg *.out *.bbl *.log *.toc && evince template.pdf

clean:
	rm -f template.pdf
