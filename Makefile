all: template.pdf

template.pdf:
	pdflatex -shell-escape template && bibtex template && pdflatex -shell-escape template && pdflatex -shell-escape template && rm -f *.aux *.blg *.out *.bbl *.log *.toc && evince template.pdf

clean:
	rm -f template.pdf
