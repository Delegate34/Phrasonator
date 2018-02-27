% faits ~  BD  
auteur(flaubert,mme_bovary).
auteur(zola,germinal).

%regles 
livre(Y):-auteur(X,Y).
ecrivain(X):-auteur(X,Y).

% la famille de "Dune"
parent(nono,leto). 
parent(leto,paul).
parent(jessica,paul).
parent(paul,leto2).
parent(chani,leto2).
parent(paul,ghanima).
parent(chani,ghanima).
homme(paul).
homme(nono).
homme(leto).
homme(leto2).
femme(ghanima).
femme(chani).
femme(jessica).

% regle
pere(X,Y):-parent(X,Y),homme(X).
mere(X,Y):-parent(X,Y),femme(X).

fils(X,Y):-parent(Y,X),homme(X).
fille(X,Y):-parent(Y,X),femme(X).


soeur(X,Y):- femme(X), 
	     pere(Z,X),pere(Z,Y),mere(T,X),mere(T,Y), X\== Y. 


frere(X,Y):- homme(X), 
	     pere(Z,X),pere(Z,Y),mere(T,X),mere(T,Y), X\== Y. 

fereousoeur(X,Y):-frere(X,Y).
fereousoeur(X,Y):-soeur(X,Y).

grandparent(X,Y):-parent(X,Z),parent(Z,Y).

% on sort de SQL: recursion 

ancetre(X,Y):-parent(X,Y).
ancetre(X,Y):-parent(X,I),ancetre(I,Y).
% ancetre(X,Y):-ancetre(X,I),ancetre(I,Y). 
