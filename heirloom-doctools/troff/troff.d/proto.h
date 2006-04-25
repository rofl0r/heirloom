/*
 * Portions Copyright (c) 2005 Gunnar Ritter, Freiburg i. Br., Germany
 *
 * Sccsid @(#)proto.h	1.44 (gritter) 4/25/06
 */

/* t6.c */
int width(register tchar);
void zapwcache(int);
int getcw(register int);
int abscw(int);
int getascender(void);
int getdescender(void);
int kernadjust(tchar, tchar);
void xbits(register tchar, int);
tchar setch(int);
tchar setabs(void);
int findft(register int, int);
void caseps(void);
void casps1(register int);
int findps(register int);
void mchbits(void);
void setps(void);
tchar setht(void);
tchar setslant(void);
void caseft(void);
void setfont(int);
void setwd(void);
tchar vmot(void);
tchar hmot(void);
tchar mot(void);
tchar sethl(int);
tchar makem(register int);
tchar getlg(tchar);
int strlg(int, int *, int);
void caselg(void);
void caseflig(int);
void casefdeferlig(void);
void casefp(int);
void casefps(void);
int setfp(int, int, char *);
int nextfp(void);
void casecs(void);
void casebd(void);
void casevs(void);
void casess(void);
void casefspacewidth(void);
tchar xlss(void);
void casetrack(void);
void casefallback(void);
void casehidechar(void);
void casefzoom(void);
void casekern(void);
void casefkern(void);
void casepapersize(void);
void casemediasize(void);
void casetrimat(void);
void casebleedat(void);
void casecropat(void);
void caselhang(void);
void caserhang(void);
void casekernpair(void);
void casekernafter(void);
void casekernbefore(void);
void caseftr(void);
void casefeature(void);
int un2tr(int, int *);
int tr2un(tchar, int);
tchar setuc0(int);
tchar setanchor(void);
tchar setlink(void);
int pts2u(int);
double u2pts(int);
/* t10.c */
void ptinit(void);
void specnames(void);
int findch(register char *);
void ptout(register tchar);
tchar *ptout0(tchar *, tchar *);
void ptps(void);
void ptfont(void);
void ptfpcmd(int, char *);
void ptlead(void);
void ptesc(void);
void newpage(int);
void ptsupplyfont(char *, char *);
void ptlocale(const char *);
void pttrailer(void);
void ptstop(void);
void dostop(void);
