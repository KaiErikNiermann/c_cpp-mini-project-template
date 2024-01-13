CFLAGS=-O3 -I$(IDIR)
CC = gcc

IDIR = include
ODIR = obj
SRCDIR = src
LANG = c

DEPS = $(wildcard $(IDIR)/*.h)
SRC = $(wildcard $(SRCDIR)/*.$(LANG))
OBJ = $(patsubst $(SRCDIR)/%.$(LANG), $(ODIR)/%.o, $(SRC))

$(OBJ) $(ODIR)/main.o: $(DEPS)

$(ODIR)/%.o: $(SRCDIR)/%.$(LANG)
	+@[ -d $(ODIR) ] || mkdir -p $(ODIR)
	$(CC) -MMD $(CFLAGS) -c -o $@ $<

main: $(OBJ) $(ODIR)/main.o
	$(CC) -o $@ $^ $(CFLAGS)

run: 
	./main

clean:
	rm -rf $(ODIR) main
