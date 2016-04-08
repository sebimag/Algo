CC=gnatmake


alea: alea.o 

words: 
	gnatmake words.adb


test:  words
	./random_input.pl 10 1000 > req.txt
	time ./words < req.txt > /dev/null

courbe:
	./courbe.sh



.PHONY: clean
clean:
	rm -f *~ *.o test words
