OBJ = lex.yy.o sunflower.tab.o
parser: $(OBJ)
	gcc -o parser $(OBJ) -lfl
lex.yy.o: lex.yy.c sunflower.tab.h
	gcc -c lex.yy.c
lex.yy.c: sunflower.lex
	flex sunflower.lex
sunflower.tab.o: sunflower.tab.c
	gcc -c sunflower.tab.c
sunflower.tab.c: sunflower.y
	bison -d sunflower.y
