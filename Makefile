CC=gnatmake

all: alea words wordso

alea: 
	clang ./tests/alea.c -o ./tests/alea

words: 
	gnatmake -D bin words.adb

wordso: 
	gnatmake -D ./optimisation ./optimisation/wordso.adb -o ./optimisation/wordso


courbe:
	./tests/courbe.sh

tests: all
	tests/courbe_double.sh

.PHONY: clean
clean:
	rm -f *~ *.o words *.ali
	rm -f ./optimisation/*.txt optimisation/*.o ./optimisation/*.ali ./optimisation/*~ ./optimisation/wordso
	rm -f tests/alea tests/*.txt
	rm -f ./bin/*