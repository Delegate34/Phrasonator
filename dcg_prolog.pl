analyse:-writeln('donner une phrase comme une liste de mots ou liste vide  pour sortir'), read(L),analysesynt(L). 

analysesynt(L):-L=[],!. 
analysesynt(L):-s(T,L,[]),analyse. 


entre(Word,[Word|Rest],Rest).

s([phrase,SN,SV],P,Q):-sn(SN,P,X,N,G,H), sv(SV,X,Q,N,H,Ho).

sn([syntagme\_nominal,DET,NOM,RELN],P,Q,N,G,H):-
det(DET,P,X,N,G), n(NOM,X,Y,N,G,H), reln(RELN,Y,Q,N,H,Ho).

sn([syntagme\_nominal,DET,NOM,RELA],P,Q,N,G,H):- 
det(DET,P,X,N,G), n(NOM,X,Y,N,G,H), rela(RELA,Y,Q,N,Hs,H).

sn([syntagme\_nominal,NP,RELN],P,Q,N,G,H):-
np(NP,P,X,N,G,H), reln(RELN,X,Q,N,H,Ho).

sn([syntagme\_nominal,NP,RELA],P,Q,N,G,H):- 
 np(NP,P,X,N,G,H), rela(RELA,X,Q,N,Hs,H).

reln([relative,PRON,SV],P,Q,N,H,Ho):- 
pron(PRON,P,X), sv(SV,X,Q,N,H,Ho).

rela([relative,PROA,SN,VT],P,Q,N,H,Ho):- 
proa(PROA,P,X), sn(SN,X,Y,No,G,H), vt(VT,Y,Q,No,H,Ho).

reln([t],P,P,N,H,Ho).

rela([t],P,P,N,H,Ho).

sv([syntagme\_verbal,VI],P,Q,N,H,Ho):-vi(VI,P,Q,N,H).

sv([syntagme\_verbal,VT,SN],P,Q,N,H,Ho):- 
vt(VT,P,X,N,H,Ho), sn(SN,X,Q,No,G,Ho).

proa(que,P,Q):-entre(que,P,Q).

pron(qui,P,Q):-entre(qui,P,Q).

vi(tombe,P,Q,sing,X):-entre(tombe,P,Q).

vi(tombent,P,Q,plur,X):-entre(tombent,P,Q).

vt(regarde,P,Q,sing,hum,X):-entre(regarde,P,Q).

vt(regardent,P,Q,plur,hum,X):-entre(regardent,P,Q).

vt(mange,P,Q,sing,hum,nhum):-entre(mange,P,Q).

vt(mangent,P,Q,plur,hum,nhum):-entre(mangent,P,Q).

vi(dort,P,Q,sing,hum):-entre(dort,P,Q).

vi(dorment,P,Q,plur,hum):-entre(dorment,P,Q).

det(une,P,Q,sing,fem):-entre(une,P,Q).

det(un,P,Q,sing,masc):-entre(un,P,Q).

det(la,P,Q,sing,fem):-entre(la,P,Q).

det(le,P,Q,sing,masc):-entre(le,P,Q).

det(des,P,Q,plur,G):-entre(des,P,Q).

det(les,P,Q,plur,G):-entre(les,P,Q).

n(pommes,P,Q,plur,fem,nhum):-entre(pommes,P,Q).

n(pomme,P,Q,sing,fem,nhum):-entre(pomme,P,Q).

n(femme,P,Q,sing,fem,hum):-entre(femme,P,Q).

n(femmes,P,Q,plur,fem,hum):-entre(femmes,P,Q).

np(pierre,P,Q,sing,masc,hum):-entre(pierre,P,Q).

np(marie,P,Q,sing,fem,hum):-entre(marie,P,Q).
