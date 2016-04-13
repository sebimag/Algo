#!/bin/bash



./tests/random_input.pl 100 1000 > tests/req.txt   #nb_lettres  nb_mots
time ./words < tests/req.txt > /dev/null


#changer les valeurs qui suivent .pl (première ligne) pour faire vos tests