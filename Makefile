main.pdf: main.dvi
	dvipdfmx -p a4 -f font.map main.dvi

main.dvi: tmp.tex
	platex tmp.tex
	pbibtex tmp.aux
	# mendex tmp
	platex tmp.tex
	platex tmp.tex
	platex tmp.tex
	mv tmp.dvi main.dvi

tmp.tex: main.tex
	sed -e 's/。/. /g' -e 's/、/, /g' -i *.tex
	sleep 1
	cp main.tex tmp.tex

clean:
	rm -f *.aux *.log *.dvi *.bbl *.blg *.ilg *.idx *.toc *.ind tmp.*
