#!/bin/bash

rm -f courbe_optimisée.txt
for i in `seq 1 50`;
do
    ./tests/random_input.pl $i 100 > tests/req.txt   #nb_lettre  nb_mots
    (time ./optimisation/wordso < tests/req.txt > /dev/null) 2> tests/courbe_tmp1.txt
    echo $((50 - $i))
    cat tests/courbe_tmp1.txt | grep  "real" | cut -d "s" -f 1 >> tests/courbe_optimisée.txt
done
echo "fini!"
rm -f tests/courbe_tmp1.txt
