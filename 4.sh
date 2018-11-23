#!/bin/bash

echo '\documentclass {article}' > out.tex
echo '\author {S. Medelyan}' >> out.tex
echo '\title {IPs report}' >> out.tex
echo '\begin {document}' >> out.tex
echo '\maketitle' >> out.tex
echo '\begin {tabular} {|c|c|c|}' >> out.tex
echo '\hline' >> out.tex
echo 'ip & first time & last time \\' >> out.tex

cat messages | awk -f 4.awk

echo '\hline' >> out.tex
echo '\end {tabular}' >> out.tex
echo '\end {document}' >> out.tex
