CC      = gcc
CFLAGS  = -Wall -g -I .
LD      = gcc
LDFLAGS = -Wall -g

PROGS       = snakes nums hungry
SNAKEOBJS   = randomsnakes.o
HUNGRYOBJS  = hungrysnakes.o
NUMOBJS     = numbersmain.o
OBJS        = $(SNAKEOBJS) $(HUNGRYOBJS) $(NUMOBJS)
SRCS        = randomsnakes.c numbersmain.c hungrysnakes.c
HDRS        =

EXTRACLEAN  = core $(PROGS)

all: $(PROGS)

clean:
	rm -f $(OBJS) $(EXTRACLEAN) lwp.o magic64.o liblwp.a liblwp.so libsnakes.so


snakes: randomsnakes.o liblwp.so libsnakes.so
	#$(LD) $(LDFLAGS) -o snakes randomsnakes.o -L. -lncurses -lsnakes -lLWP -lPLN
	$(LD) $(LDFLAGS) -o snakes randomsnakes.o  libsnakes.a liblwp.a libPLN.a -lncurses
hungry: hungrysnakes.o liblwp.so libsnakes.so
	#$(LD) $(LDFLAGS) -o hungry hungrysnakes.o -L. -lncurses -lsnakes -lLWP -lPLN
	$(LD) $(LDFLAGS) -o hungry hungrysnakes.o libsnakes.a liblwp.a libPLN.a -lncurses


libsnakes.so:
	$(LD) -shared -o libsnakes.so libsnakes.a
nums: numbersmain.o liblwp.so
	$(LD) $(LDFLAGS) -o nums numbersmain.o liblwp.a libPLN.a -lncurses


liblwp.so: liblwp.a
	$(LD) -shared -o liblwp.so liblwp.a

hungrysnakes.o: lwp.h snakes.h

randomsnakes.o: lwp.h snakes.h

numbersmain.o: lwp.h

liblwp.a: 
	$(CC) -c lwp.c util.c rr.c list.c
	ar r liblwp.a lwp.o util.o rr.o list.o
	rm lwp.o util.o rr.o list.o

submission:
	tar -cf project2_submission.tar lwp.c lwp.h rr.c rr.h list.h list.c Makefile README.md
	gzip project2_submission.tar