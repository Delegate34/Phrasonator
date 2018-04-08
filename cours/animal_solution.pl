:-dynamic(known/3).

%% peau(poils,mimi). 
%% oreilles(pointues,mimi).
%% taille(20,mimi). 
       
liste_animaux([chat,chien,cheval,oiseau,crocodile]).


animal(X):-
	liste_animaux(L),
	member(P, L),
	T=..[P,X], % T=P(X)
	call(T), % T
	write('je pense que '), 
	write(X),
	write(' est un '),
	write(P).

chien(X):-
	peau(poils,X),
	taille(U,X), 
	U<100.
chat(X):-
	oreilles(pointues,X),
	peau(poils,X),
	taille(U,X), 
	U<30.
cheval(X):-
	oreilles(pointues,X),
	peau(poils,X),
	taille(U,X), 
	U>150,
	U<300.
oiseau(X):-
	peau(plumes,X).

crocodile(X):-peau(ecailles,X),taille(U,X),U>200,oreilles(inexistantes,X). 


oreilles(Y,X):-
	ask(oreilles,Y,X).
peau(Y,X):-
	ask(peau,Y,X).
taille(Y,X):-
	ask(taille,Y,X).
 


ask(U,Y,X):-
	known(U,Y,X).
%       autre solution: avec coupure et unification
%	known(U,Y0,X),
%	!,  
%	Y0 = Y. % unification explicite

ask(oreilles,Y,X) :-
	not(known(oreilles,_,X)),
	write('comment sont les oreilles de '),
	writeln(X),
	/* menu_ask s'ajoute ici */
	menu_ask([pointues,tombantes,inexistantes], Y0),
	assert(known(oreilles,Y0,X)),
%	!,
	Y0 = Y.
ask(peau,Y,X):-
	not(known(peau,_,X)),
	write('de quoi est couverte la peau de '), 
	writeln(X), 
	/* menu_ask s'ajoute ici */
	menu_ask([poils,plumes,ecailles], Y0),
	assert(known(peau,Y0,X)),
	Y0 = Y.
ask(taille,Y,X):-
	not(known(taille,_,X)),
	write('quelle est la taille en cm de  ' ),
	writeln(X),
	read(Y),
	assert(known(taille,Y,X)).

menu_ask(List, X) :-
	/* ecrire le liste avec des numeros a partir de 1 */
	write_list(List, 1),
	/* le nombre d'element en List est Len */
	length(List, Len),
	/* lire un number entre 1 en Len */
	read_between(1, Len, N),
	/* selectionner le Nieme element de List */
	member_n(N, List, X).


member_n(1, [X|_], X).
member_n(N0, [_|Ys], X) :-
	/* verifie qu'on ne depasse pas */
	N0 > 1,           % comparaison
	/* diminue */
	N is N0 - 1,      % calcul avec "is"
	/* Ys a un element moins et N est plus petit de 1 */
	member_n(N, Ys, X).

write_list([], _) :-
	nl.
write_list([X|Xs], N0) :-
	write(N0),
	write('. '),
	writeln(X),
	N is N0 + 1,
	write_list(Xs, N).

read_between(Min, Max, Term) :-
	/* lire un terme */
	read(Term0),
	/* verifier que le terme qu'on vient de lire nous convient */
	read_between1(Min, Max, Term0, Term).

read_between1(Min, Max, Term0, Term) :-
	/* pas un integer */
	not(integer(Term0)),
	writeln('Choissisez un numero'),
	read_between(Min, Max, Term).
read_between1(Min, Max, Term, Term) :-
	/* integer dans les bornes */
	integer(Term),
	Term >= Min,
	Term =< Max.
read_between1(Min, Max, Term0, Term) :-
	/* integer trop petit */
	integer(Term0),
	Term0 < Min,
	write('Choissisez un numero plus grand que ou egal a '),
	writeln(Min),
	read_between(Min, Max, Term).
read_between1(Min, Max, Term0, Term) :-
	/* integer trop grand */
	integer(Term0),
 	Term0 > Max,
	write('Choissisez un numero plus petit que ou egal a '),
	writeln(Max),
	read_between(Min, Max, Term).
