bulgarianSolitaire: main.o checkPiles.o finalConfig.o initGame.o modulo.o playRound.o printPiles.o
	gcc -o bulgarianSolitaire main.o checkPiles.o finalConfig.o initGame.o modulo.o playRound.o printPiles.o

main.o: main.s
	gcc -g -c main.s

checkPiles.o: checkPiles.s
	gcc -g -c checkPiles.s

finalConfig.o: finalConfig.s
	gcc -g -c finalConfig.s

initGame.o: initGame.s
	gcc -g -c initGame.s

modulo.o: modulo.s
	gcc -g -c modulo.s

playRound.o: playRound.s
	gcc -g -c playRound.s

printPiles.o: printPiles.s
	gcc -g -c printPiles.s

clean:
	rm *.o
