#!/bin/bash

rm -f courbe.txt
rm -f courbeopt.txt
for i in `seq 1 50`;
do
    ./tests/random_input.pl $i 100 > tests/req.txt
    (time ./words < tests/req.txt > /dev/null) 2> tests/courbe_tmp1.txt
    (time ./optimisation/wordso < tests/req.txt > /dev/null) 2> tests/courbe_tmp2.txt
    echo $((50 - $i))
    cat tests/courbe_tmp1.txt | grep  "real" | cut -d "s" -f 1 >> tests/courbe.txt
    cat tests/courbe_tmp2.txt | grep  "real" | cut -d "s" -f 1 >> tests/courbeopt.txt
done
echo "fini!"
rm -f tests/courbe_tmp1.txt
rm -f tests/courbe_tmp2.txt
