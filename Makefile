all: template.pdf

template.pdf:
	pdflatex template.tex && pdflatex template && rm -f *.aux *.blg *.out *.bbl *.log *.toc

clean:
	rm -f template.pdf
