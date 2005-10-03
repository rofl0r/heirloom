LIBHNJ = ../libhnj
VPATH=..
OBJ = t10.o t6.o hytab.o n1.o n2.o n3.o n4.o n5.o \
	n7.o n8.o n9.o ni.o nii.o suftab.o makedev.o afm.o otf.o unimap.o \
	malloc.o calloc.o version.o

FLAGS = -DUSG -DINCORE $(EUC) -I. -I.. -DMACDIR='"$(MACDIR)"' \
	-DFNTDIR='"$(FNTDIR)"' -DTABDIR='"$(TABDIR)"' -DHYPDIR='"$(HYPDIR)"'

.c.o:
	$(CC) $(CFLAGS) $(WARN) $(CPPFLAGS) $(FLAGS) -c $<

all: troff ta otfdump

troff: $(OBJ) $(LIBHNJ)/libhnj.a
	$(CC) $(LDFLAGS) $(OBJ) -L$(LIBHNJ) -lhnj $(LIBS) -o troff

ta: draw.o ta.o
	$(CC) $(LDFLAGS) draw.o ta.o $(LIBS) -lm -o $@

otfdump: otfdump.o otfdump_version.o
	$(CC) $(LDFLAGS) otfdump.o otfdump_version.o $(LIBS) -o $@

install:
	$(INSTALL) -c troff $(ROOT)$(BINDIR)/troff
	$(STRIP) $(ROOT)$(BINDIR)/troff
	$(INSTALL) -c ta $(ROOT)$(BINDIR)/ta
	$(STRIP) $(ROOT)$(BINDIR)/ta
	$(INSTALL) -c otfdump $(ROOT)$(BINDIR)/otfdump
	$(STRIP) $(ROOT)$(BINDIR)/otfdump
	$(INSTALL) -c -m 644 troff.1b $(ROOT)$(MANDIR)/man1b/troff.1b
	$(INSTALL) -c -m 644 otfdump.1b $(ROOT)$(MANDIR)/man1b/otfdump.1b

clean:
	rm -f $(OBJ) draw.o ta.o troff ta otfdump otfdump.o otfdump_version.o \
		core log *~

mrproper: clean

draw.o: draw.c
makedev.o: makedev.c dev.h
t10.o: t10.c ../tdef.h ../ext.h dev.h afm.h troff.h
t6.o: t6.c ../tdef.h dev.h ../ext.h afm.h unimap.h troff.h
unimap.o: unimap.h
ta.o: ta.c dev.h
hytab.o: ../hytab.c
malloc.o: ../malloc.c ../mallint.h
n1.o: ../n1.c ../tdef.h ../ext.h ./proto.h
n2.o: ../n2.c ../tdef.h ./proto.h ../ext.h
n3.o: ../n3.c ../tdef.h ./proto.h ../ext.h
n4.o: ../n4.c ../tdef.h ./proto.h ../ext.h
n5.o: ../n5.c ../tdef.h ../ext.h
n7.o: ../n7.c ../tdef.h ./proto.h ../ext.h
n8.o: ../n8.c ../tdef.h ../ext.h ./proto.h
n9.o: ../n9.c ../tdef.h ./proto.h ../ext.h
ni.o: ../ni.c ../tdef.h ./proto.h
nii.o: ../nii.c ../tdef.h ./proto.h ../ext.h
suftab.o: ../suftab.c
version.o: ../version.c
otfdump_version.o: ../version.c
afm.o: dev.h afm.h
otf.o: dev.h afm.h
otfdump.o: afm.h afm.c otf.c otfdump.c dpost.d/getopt.c dev.h
