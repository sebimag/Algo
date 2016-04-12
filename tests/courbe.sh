#!/bin/bash
rm -f courbe.txt
for i in `seq 1 50`;
do
    ./random_input.pl $i 100 > req.txt
    (time ./words < req.txt > /dev/null) 2> courbe1.txt
    echo $i
    cat courbe1.txt | grep  "real" | cut -d "m" -f 2 | cut -d "s" -f 1 >> courbe.txt
done
rm -f courbe1.txt

