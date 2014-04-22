#!/bin/bash
file="presentation.tex"
xelatex -halt-on-error "$file" > logs/xelatex.1.log 2> logs/xelatex.1.err \
&& xelatex -halt-on-error "$file" > logs/xelatex.2.log 2> logs/xelatex.2.err \
&& open "$(basename "$file" .tex)".pdf

code="$?"
if [ "$code" -ne "0" ]; then
    terminal-notifier -message "LaTeX build of $file failed with $code" -activate "com.apple.Terminal"
fi
