CC=g++
LEX=flex
YACC=bison
THIS_MAKEFILE= $(abspath $(dir $(firstword $(MAKEFILE_LIST))))

object: lex.cpp yacc.cpp
	$(CC) -fPIC -shared lex.cpp yacc.cpp -o liblex_yacc.so
	sudo ln -bs $(THIS_MAKEFILE)/liblex_yacc.so /usr/lib/liblex_yacc.so

lex.o: lex.cpp yacc.hpp main.h
	$(CC) -c lex.cpp

yacc.o: yacc.hpp yacc.cpp main.h 
	$(CC) -c yacc.cpp

lex.cpp: lex.l
	$(LEX) -o lex.cpp lex.l

yacc.cpp yacc.hpp: yacc.y main.h
	$(YACC) -d -o yacc.cpp yacc.y
	sudo ln -bs $(THIS_MAKEFILE)/main.h /usr/include/main.h
	sudo ln -bs $(THIS_MAKEFILE)/yacc.hpp /usr/include/yacc.hpp
	
.PHONY : clean
clean:
	sudo rm -rf /usr/include/main.h
	sudo rm -rf /usr/include/yacc.hpp
	sudo rm -rf /usr/lib/liblex_yacc.so
	rm -f *.o *.so lex.cpp yacc.hpp yacc.cpp
