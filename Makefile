
CFLAGS+=-g -Wall

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	FINAL_EXE_LDFLAGS+=-Wl,-rpath=.
endif

ALL: test

test: test.cpp libget_three.so libget_seven.so
	g++ $(CFLAGS) $(FINAL_EXE_LDFLAGS) -o test test.cpp -L. -lget_three -lget_seven

libget_three.so: get_three.o
	g++ -o libget_three.so -shared get_three.o
get_three.o: get_three.cpp get_three.h
	g++ $(CFLAGS) $(SO_CFLAGS) -o get_three.o -c -fPIC get_three.cpp

libget_seven.so: get_seven.o
	g++ -o libget_seven.so -shared get_seven.o
get_seven.o: get_seven.cpp get_seven.h
	g++ $(CFLAGS) $(SO_CFLAGS) -o get_seven.o -c -fPIC get_seven.cpp

clean:
	rm -f test libget_three.so libget_seven.so *.o
