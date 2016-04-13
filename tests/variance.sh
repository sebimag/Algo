#!/bin/bash

echo
echo variance nulle:
./alea 5 0 > ./tests/req.txt
(time ./words < ./tests/req.txt > /dev/null) 2> ./tests/test_variance1.txt
cat ./tests/test_variance1.txt | grep  "real" | cut -d "m" -f 2 | cut -d "s" -f 1

echo variance non nulle:
./alea 5 2 > ./tests/req.txt
(time ./words < ./tests/req.txt > /dev/null) 2> ./tests/test_variance1.txt
cat ./tests/test_variance1.txt | grep  "real" | cut -d "m" -f 2 | cut -d "s" -f 1
echo

rm tests/test_variance1.txt

