#!/bin/bash
rm test_variance.txt

clang alea.c -o alea
for i in `seq 1 100`;  #nombre de variance testées
do
    ./alea $i > req.txt
    (time ./words < req.txt > /dev/null) 2> test_variance1.txt
    cat test_variance1.txt | grep  "real" | cut -d "m" -f 2 | cut -d "s" -f 1 >>test_variance.txt
    echo $i
done
rm test_variance1.txt

