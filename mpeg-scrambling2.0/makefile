###########################################################
# The makefile for the MPEG program.
# There should be no changes for most UNIX compilers.
###########################################################

# edit following line to specify proper OS compiler
# (gcc for Windows, cc for Unix and GNU\Linux)
CC = gcc

# w ang g parameters have been introduced for debug purposes
# remove them in production environment
MFLAGS = -O3 -g -w
DEFS = system.h globals.h marker.h watermark.h scrambling.h cJSON.h
BASELINE = mpeg.o codec.o huffman.o io.o chendct.o lexer.o marker.o me.o mem.o stat.o stream.o transform.o watermark.o scrambling.o cJSON.c
SCRAMBLIBS = -l glib-2.0 -I /usr/include/glib-2.0/ -I /usr/include/glib-2.0/glib/ -I /usr/lib/x86_64-linux-gnu/glib-2.0/include/

.c.o:
	$(CC) $(MFLAGS) -c $*.c 

.c.ln:
	lint -c $*.c 

all: pre-build vala post-vala scrambling mpeg post-build

pre-build:
	@echo PRE

post-vala:
	@echo POST VALA

post-build:
	@echo POST

clean:
	rm *.o scrambling_vala.h ./scrambling/*.c mpeg

mpeg: $(BASELINE)
	$(CC) $(MFLAGS) $(BASELINE) -lm -o mpeg

vala:
	valac ./scrambling/*.vala -C -H scrambling_vala.h --vapidir ./scrambling/vapis/ --pkg OpenCV --pkg gee-0.8 --pkg gio-2.0 --pkg gdk-pixbuf-2.0 --disable-warnings

scrambling:
	$(CC) $(MFLAGS) scrambling.c -lm -o scrambling.o $(SCRAMBLIBS)

mpeg.o: mpeg.c $(DEFS) mpeg.h
codec.o: codec.c $(DEFS)
marker.o: marker.c $(DEFS) marker.h
huffman.o: huffman.c $(DEFS) huffman.h
io.o: io.c $(DEFS)
chendct.o: chendct.c $(DEFS)
lexer.o:lexer.c
mem.o: mem.c
me.o: me.c
stat.o: stat.c
stream.o: stream.c $(DEFS)
transform.o: transform.c $(DEFS) dct.h
watermark.o: watermark.c $(DEFS) watermark.h
#scrambling.o: scrambling.c $(DEFS) scrambling.h scrambling_vala.h $(SCRAMBLIBS)
cJSON.o: cJSON.c $(DEFS) cJSON.h


lcheck: mpeg.ln codec.ln marker.ln huffman.ln io.ln chendct.ln lexer.ln mem.ln me.ln stat.ln stream.ln transform.ln
	lint mpeg.ln codec.ln marker.ln huffman.ln io.ln chendct.ln lexer.ln mem.ln me.ln stat.ln stream.ln transform.ln


#
# Should you wish to modify the interpreter 
# or the Huffman tables, use these commands.
#
#
#ctables.h: tables.h htable
#	rm -f ctables.h
#	htable <tables.h >ctables.h
#
# Make sure that you move the first comment from the start to 
# within the braces %{ /* */ %} in htable.lex, lexer.l,
# otherwise it will give you a error (definitions too long). 
# Caution: the htable name may conflict with /usr/etc/htable
# on some machines.
#
#htable:htable.lex
#	lex htable.lex
#	mv lex.yy.c htable.c
#	$(CC) htable.c -o htable -ll
#
#
#  Caution: Sometimes -ll is required.
#
#lexer.c:lexer.l
#	lex lexer.l
#	mv lex.yy.c lexer.c
#
