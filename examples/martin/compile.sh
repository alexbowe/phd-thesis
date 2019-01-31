set -xe
python org2tex.py succinct.org >mysuccinct.tex
# -interaction nonstopmode 
pdflatex  -file-line-error mysuccinct.tex
pdflatex  -file-line-error mysuccinct.tex
bibtex mysuccinct
pdflatex  -file-line-error mysuccinct.tex
