/* 

fichier 1 : grammaire hors contexte


fichier 2    ensuite la meme grammaire en prolog sans accord


fichier 3 la meme grammaire avec accord


fichier 4 la meme grammaire qui produit les arbres d'analyse 


CFG 

s -> gn gv 
gn -> det nom 
gv -> vt gn 
vt -> regarde | regardent 
nom -> chat | chien | chats | chiens 
det -> le | la | les 


*/

% reperage par difference de listes:
% gn([le,petit,chat,regarde,le,chien],[regarde, le, chien])
% signifie que la fin de la première liste est la deuxxieme liste et que la différence [le, peit, chat] est un gn.

% CLAUSE d INITIALISATION DE "ENTRE"

entre(Mot,[Mot|Reste],Reste).
% initialise le repérage par différences de listes.
% attention à bien mettre  le Mot en premier (ou en dernier)
% Mot est uen variable qui deviendra un mot et Reste est une liste de mot qui initalise le repérage par différence de liste.

% interrogation s([le petit, chat, dort],[]). 
%les règles categoire-> mot deviennent 
det([det,le],X,Y):-entre(le,X,Y).
det([det,la],X,Y):-entre(les,X,Y).
det([det,les],X,Y):-entre(la,X,Y).
nom([nom,chat],X,Y):-entre(chat,X,Y).
nom([nom,chats],X,Y):-entre(chats,X,Y).
nom([nom,chien],X,Y):-entre(chien,X,Y).
nom([nom,chiens],X,Y):-entre(chiens,X,Y).
vt([vt, regarde],X,Y):-entre(regarde,X,Y).
vt([vt, regardent],X,Y):-entre(regardent,X,Y).

% les regles de reecriture deviennent: 
gn([gn,T1,T2],X,Y):-det(T1,X,I),nom(T2,I,Y).
gv([gv,T1,T2],X,Y):-vt(T1,X,I),gn(T2,I,Y).
s([s,T1,T2],X,Y):-gn(T1,X,I),gv(T2,I,Y).

%phrase(X,T):-s(T,X,[]). 


% PROBLEME PAS d ACCORD 
