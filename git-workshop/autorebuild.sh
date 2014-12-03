#!/bin/bash

# use this script to automatically rebuild the presentation while editing it

# for verbose mode, use this
#set -x

# you can put multiple files here
F="git-workshop"

while sleep 0.2; do
	# pdflatex if .tex file is newer than .pdf file
	for target in $F; do
		do=0
		if test -e $target.pdf; then
			for f in *.tex; do
				if test $f -nt $target.pdf; then
					do=1;
				fi
			done
		else
			do=1
		fi
		if test "x$do" == "x1"; then
			echo "== doing $target"
			pdflatex -interaction nonstopmode $target.tex
		fi
	done
done
