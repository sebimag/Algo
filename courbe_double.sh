#!/bin/bash

rm coube.txt
rm optimisation/courbeopt.txt
for i in `seq 1 50`;
do
    ./random_input.pl $i 100 > req.txt
    (time ./words < req.txt > /dev/null) 2> courbe1.txt
    (time ./optimisation/wordso < req.txt > /dev/null) 2> courbe2.txt
    echo $i
    cat courbe1.txt | grep  "real" | cut -d "m" -f 2 | cut -d "s" -f 1 >> courbe.txt
    cat courbe2.txt | grep  "real" | cut -d "m" -f 2 | cut -d "s" -f 1 >> optimisation/courbeopt.txt
done
rm courbe1.txt
rm courbe2.txt