CC=gnatmake

all: alea words wordso

alea: 
	clang ./tests/alea.c -o ./tests/alea

words: 
	gnatmake -D bin words.adb

wordso: 
	gnatmake -D ./optimisation ./optimisation/wordso.adb -o ./optimisation/wordso


courbe: words
	./tests/courbe.sh

courbe_opt: wordso
	./tests/courbe_opt.sh

tests: all
	tests/courbe_double.sh

test_simple: words
	tests/test_simple.sh

test_simple_opt: wordso
	tests/test_simple_opt.sh

test_variance: alea words
	tests/variance.sh

.PHONY: clean
clean:
	rm -f *~ *.o words *.ali
	rm -f ./optimisation/*.txt optimisation/*.o ./optimisation/*.ali ./optimisation/*~ ./optimisation/wordso
	rm -f tests/alea tests/*.txt
	rm -f ./bin/*