:-encoding(utf8).

phrase(W) :-
  set_prolog_stack(global, limit(100 000 000 000)),
  findall(X,s(X,Y,Z),L),
  % random_member(W,L).
  open('liste.txt',write,OS),
  loop_through_list(L,OS),
  close(OS).

loop_through_list([],OS).
loop_through_list([Head|Tail],OS) :-
    write(OS,Head),
    write(OS,'\n'),
    loop_through_list(Tail,OS).

s(L,P,Q):-
  sn(SN,P,X,N,G,H,B),
  sv(SV,X,Q,N,H,Ho),
  \+nth0(Z, SV, SN),
  append(SN,SV,L).
  % ,atomic_list_concat(L,' ',A).

sn([DET,NOM],P,Q,N,G,H,B):-
  det(DET,P,X,N,G,B),
  n(NOM,X,Y,N,G,H).

sn([NP],P,Q,N,G,H):-
  np(NP,P,X,N,G,H).

% sv([VI],P,Q,N,H,Ho):-vi(VI,P,Q,N,H).

sv(L,P,Q,N,H,Ho):-
  vt(VT,P,X,N,H,Ho),
  sn(SN,X,Q,No,G,Ho,Q),
  append([VT],SN,L).

det(la,P,Q,sing,fem,NQ).
det(le,P,Q,sing,masc,NQ).
det(les,P,Q,plur,_,NQ).
det(tout,P,Q,sing,masc,Qu).
det(toute,P,Q,sing,fem,Qu).
det(tous,P,Q,plur,masc,Qu).
det(toutes,P,Q,plur,fem,Qu).
det(chaque,P,Q,sing,masc,Qu).
det(chaque,P,Q,sing,fem,Qu).
det(quelque,P,Q,sing,masc,Qu).
det(quelques,P,Q,plur,masc,Qu).
det(quelque,P,Q,sing,fem,Qu).
det(quelques,P,Q,plur,fem,Qu).
det(certain,P,Q,sing,masc,Qu).
det(certaine,P,Q,sing,fem,Qu).
det(certains,P,Q,plur,masc,Qu).
det(certaines,P,Q,plur,fem,Qu).

vt(abandonne,P,Q,sing,hum,X).
vt(abandonnent,P,Q,plur,hum,X).
vt(affronte,P,Q,sing,hum,hum).
vt(affrontent,P,Q,plur,hum,hum).
vt(attaque,P,Q,sing,hum,X).
vt(attaquent,P,Q,plur,hum,X).
vt(attrape,P,Q,sing,hum,X).
vt(attrapent,P,Q,plur,hum,X).
vt(avance,P,Q,sing,hum,nhum).
vt(avancent,P,Q,plur,hum,nhum).
vi(avance,P,Q,sing,hum).
vi(avancent,P,Q,plur,hum).
vt(ont,P,Q,plur,hum,nhum).
vi(appartient,P,Q,sing,hum).
vi(appartiennent,P,Q,plur,hum).
vt(danse,P,Q,sing,hum,nhum).
vt(dansent,P,Q,plur,hum,nhum).
vi(danse,P,Q,sing,hum).
vt(domine,P,Q,sing,hum,X).
vt(dominent,P,Q,plur,hum,X).
vt(joue,P,Q,sing,hum,nhum).
vt(jouent,P,Q,plur,hum,nhum).
vi(joue,P,Q,sing,hum).
vi(jouent,P,Q,plur,hum).
vi(progresse,P,Q,sing,hum).
vi(progressent,P,Q,plur,hum).
vt(prend,P,Q,sing,hum,X).
vt(prennent,P,Q,plur,hum,X).
vi(prend,P,Q,sing,hum).
vi(prennent,P,Q,plur,hum).
vt(pratique,P,Q,sing,hum,nhum).
vt(pratiquent,P,Q,plur,hum,nhum).
vt(remplace,P,Q,sing,hum,hum).
vt(remplacent,P,Q,plur,hum,hum).
vt(remporte,P,Q,sing,hum,nhum).
vt(remportent,P,Q,plur,hum,nhum).
vt(rencontre,P,Q,sing,hum,hum).
vt(rencontrent,P,Q,plur,hum,hum).
vt(siffle,P,Q,sing,hum,hum).
vt(sifflent,P,Q,plur,hum,hum).
vi(siffle,P,Q,sing,hum).
vi(sifflent,P,Q,plur,hum).
vt(stoppe,P,Q,sing,hum,X).
vt(stoppent,P,Q,plur,hum,X).
vi(stoppe,P,Q,sing,hum).
vi(stoppent,P,Q,plur,hum).
vi(sue,P,Q,sing,hum).
vi(suent,P,Q,plur,hum).
vt(suit,P,Q,sing,hum,hum).
vt(suivent,P,Q,plur,hum,hum).
vi(suit,P,Q,sing,hum).
vi(suivent,P,Q,plur,hum).
vt(bat,P,Q,sing,hum,hum).
vt(battent,P,Q,plur,hum,hum).
vi(bat,P,Q,sing,hum).
vi(battent,P,Q,plur,hum).
vt(blesse,P,Q,sing,hum,hum).
vt(blessent,P,Q,plur,hum,hum).
vt(bloque,P,Q,sing,hum,Y).
vt(bloquent,P,Q,plur,hum,Y).
vt(boit,P,Q,sing,hum,nhum).
vt(boivent,P,Q,plur,hum,nhum).
vt(bouscule,P,Q,sing,hum,hum).
vt(bousculent,P,Q,plur,hum,hum).
vt(contre,P,Q,sing,hum,X).
vt(contrent,P,Q,plur,hum,X).
vi(court,P,Q,sing,hum).
vi(courent,P,Q,plur,hum).
vt(fait,P,Q,sing,hum,nhum).
vt(font,P,Q,plur,hum,nhum).
vt(fatigue,P,Q,sing,hum,hum).
vt(fatiguent,P,Q,plur,hum,hum).
vi(fatigue,P,Q,sing,hum).
vi(fatiguent,P,Q,plur,hum).
vt(frappe,P,Q,sing,hum,X).
vt(frappent,P,Q,plur,hum,X).
vt(gagne,P,Q,sing,hum,nhum).
vt(gagnent,P,Q,plur,hum,nhum).
vi(marche,P,Q,sing,hum).
vi(marchent,P,Q,plur,hum).
vt(marque,P,Q,sing,hum,hum).
vt(marquent,P,Q,plur,hum,hum).
vi(marque,P,Q,sing,hum).
vi(marquent,P,Q,plur,hum).
vt(vainc,P,Q,sing,hum,hum).
vt(vainquent,P,Q,plur,hum,hum).
vt(vise,P,Q,sing,hum,nhum).
vt(visent,P,Q,plur,hum,nhum).
vt(tire,P,Q,sing,hum,nhum).
vt(tirent,P,Q,plur,hum,nhum).
vt(touche,P,Q,sing,hum,Y).
vt(touchent,P,Q,plur,hum,Y).


n(sport,P,Q,sing,masc,nhum).
n(sports,P,Q,plur,masc,nhum).
n(jiujitsu,P,Q,sing,masc,nhum).
% n(contre-offensive,P,Q,sing,fem,nhum).
n(entorse,P,Q,sing,fem,nhum).
n(tricheur,P,Q,sing,masc,hum).
n(marathon,P,Q,sing,masc,nhum).
n(arbitre,P,Q,sing,masc,hum).
n(goal,P,Q,sing,masc,nhum).
n(footballer,P,Q,sing,masc,hum).
n(balle,P,Q,sing,masc,nhum).
n(ballon,P,Q,sing,masc,nhum).
n(tension,P,Q,sing,fem,nhum).
n(cible,P,Q,sing,fem,nhum).
n(catch,P,Q,sing,masc,nhum).
n(feinte,P,Q,sing,fem,nhum).
n(intervieweur,P,Q,sing,masc,hum).
n(basket,P,Q,sing,masc,nhum).
n(courses,P,Q,plur,fem,nhum).
n(basket,P,Q,sing,fem,nhum).
n(batte,P,Q,sing,fem,nhum).
n(spectacle,P,Q,sing,masc,nhum).
n(haies,P,Q,plur,fem,nhum).
n(favori,P,Q,sing,masc,nhum).
n(baudrier,P,Q,sing,masc,nhum).
n(tournoi,P,Q,sing,masc,nhum).
n(faute,P,Q,sing,fem,nhum).
n(botte,P,Q,sing,fem,nhum).
n(volleyeuse,P,Q,sing,fem,hum).
n(clubs,P,Q,plur,masc,nhum).
n(attaque,P,Q,sing,fem,nhum).
n(essai,P,Q,sing,masc,nhum).
n(service,P,Q,sing,masc,nhum).
n(coach,P,Q,sing,masc,hum).
n(bloqueur,P,Q,sing,masc,hum).
n(match,P,Q,sing,masc,nhum).
n(boxe,P,Q,sing,fem,nhum).
n(touchdown,P,Q,sing,masc,nhum).
n(riposte,P,Q,sing,fem,nhum).
n(plaquage,P,Q,sing,masc,nhum).
n(ailier,P,Q,sing,masc,hum).
n(kendo,P,Q,sing,masc,nhum).
n(prolongations,P,Q,plur,fem,nhum).
n(jouet,P,Q,sing,masc,nhum).
n(frappe,P,Q,sing,fem,nhum).
n(dopage,P,Q,sing,masc,nhum).
n(supporteur,P,Q,sing,masc,hum).
n(stade,P,Q,sing,masc,nhum).
n(podiums,P,Q,plur,masc,nhum).
n(contre,P,Q,sing,masc,nhum).
n(terrain,P,Q,sing,masc,nhum).
n(partie,P,Q,sing,fem,nhum).
n(libero,P,Q,sing,masc,hum).
n(batteur,P,Q,sing,masc,hum).
n(volley,P,Q,sing,masc,nhum).
n(but,P,Q,sing,masc,nhum).
n(court,P,Q,sing,masc,nhum).
n(participant,P,Q,sing,masc,hum).
n(camp,P,Q,sing,masc,nhum).
n(marqueur,P,Q,sing,masc,hum).
n(sportive,P,Q,sing,fem,hum).
n(relais,P,Q,sing,masc,nhum).
n(nul,P,Q,sing,masc,nhum).
n(tricherie,P,Q,sing,fem,nhum).
n(drop,P,Q,sing,masc,nhum).
n(interdits,P,Q,plur,masc,nhum).
n(passe,P,Q,sing,fem,nhum).
n(capitaine,P,Q,sing,masc,hum).
n(raquette,P,Q,sing,fem,nhum).
n(passeur,P,Q,sing,masc,hum).
n(gardien,P,Q,sing,masc,hum).
n(pivot,P,Q,sing,masc,nhum).
n(revers,P,Q,sing,masc,nhum).
n(golf,P,Q,sing,masc,nhum).
n(plaquer,P,Q,sing,masc,nhum).
n(knockdown,P,Q,sing,masc,nhum).
n(boules,P,Q,plur,fem,nhum).
n(crampon,P,Q,sing,masc,nhum).
n(sprint,P,Q,sing,masc,nhum).
n(champion,P,Q,sing,masc,hum).
n(tir,P,Q,sing,masc,nhum).
n(boxeur,P,Q,sing,masc,hum).
n(basketball,P,Q,sing,masc,nhum).
n(intervalle,P,Q,sing,masc,nhum).
n(lucarne,P,Q,sing,fem,nhum).
n(duel,P,Q,sing,masc,nhum).
n(joueurs,P,Q,plur,masc,hum).
n(peloton,P,Q,sing,masc,nhum).
n(timing,P,Q,sing,masc,nhum).
n(amateurs,P,Q,plur,masc,hum).
n(dunk,P,Q,sing,fem,nhum).
n(football,P,Q,sing,masc,nhum).
n(esquive,P,Q,sing,fem,nhum).
n(talonnage,P,Q,sing,masc,nhum).
n(sprinter,P,Q,sing,masc,nhum).
n(avertissement,P,Q,sing,masc,nhum).
n(expulsion,P,Q,sing,fem,nhum).
n(direct,P,Q,sing,masc,nhum).
n(passion,P,Q,sing,fem,nhum).
n(dribble,P,Q,sing,masc,nhum).
n(base,P,Q,sing,fem,nhum).
n(tennis,P,Q,sing,masc,nhum).
n(handballeur,P,Q,sing,masc,hum).
n(plaqueur,P,Q,sing,masc,hum).
n(piste,P,Q,sing,fem,nhum).
n(couleur,P,Q,sing,fem,nhum).
n(crampe,P,Q,sing,fem,nhum).
n(rencontre,P,Q,sing,fem,nhum).
n(championnat,P,Q,sing,masc,nhum).
n(tatami,P,Q,sing,masc,nhum).
n(score,P,Q,sing,masc,nhum).
n(smash,P,Q,sing,masc,nhum).
n(sumotori,P,Q,sing,masc,hum).
n(footeux,P,Q,sing,masc,hum).
n(penalty,P,Q,sing,masc,nhum).
n(vrille,P,Q,sing,fem,nhum).
n(sifflet,P,Q,sing,masc,nhum).
n(sauvetage,P,Q,sing,masc,nhum).
n(barre,P,Q,sing,fem,nhum).
n(blocage,P,Q,sing,masc,nhum).
n(gant,P,Q,sing,masc,nhum).
n(sportif,P,Q,sing,masc,hum).
n(filets,P,Q,plur,masc,nhum).
n(pelouse,P,Q,sing,masc,nhum).
n(set,P,Q,sing,masc,nhum).
n(force,P,Q,sing,fem,nhum).
n(muscle,P,Q,sing,masc,nhum).
n(ligue,P,Q,sing,fem,nhum).
n(jeux,P,Q,plur,masc,nhum).
n(buteur,P,Q,sing,masc,hum).
n(filet,P,Q,sing,masc,hum).
n(foot,P,Q,sing,masc,nhum).
n(judo,P,Q,sing,masc,nhum).
n(arbitrage,P,Q,sing,masc,nhum).
n(juge,P,Q,sing,masc,hum).
n(note,P,Q,sing,fem,nhum).
n(triche,P,Q,sing,fem,nhum).
n(endurance,P,Q,sing,fem,nhum).
n(chaussure,P,Q,sing,fem,hum).
n(challenger,P,Q,sing,masc,hum).
n(touche,P,Q,sing,fem,nhum).
n(ace,P,Q,sing,masc,nhum).
n(vainqueur,P,Q,sing,masc,hum).
n(interdit,P,Q,sing,masc,nhum).
n(rotation,P,Q,sing,fem,nhum).
n(finale,P,Q,sing,fem,nhum).
n(judoka,P,Q,sing,fem,hum).
n(victoire,P,Q,sing,fem,nhum).
n(international,P,Q,sing,masc,nhum).
n(provocation,P,Q,sing,fem,nhum).
n(coaching,P,Q,sing,masc,nhum).
n(poulain,P,Q,sing,masc,hum).
n(porter,P,Q,sing,masc,nhum).
n(gymnase,P,Q,sing,masc,nhum).
n(poudreuse,P,Q,sing,fem,nhum).
n(centre,P,Q,sing,masc,nhum).
n(physique,P,Q,sing,masc,nhum).
n(adversaire,P,Q,sing,masc,hum).
n(manager,P,Q,sing,masc,hum).
n(hockey,P,Q,sing,masc,nhum).
n(volant,P,Q,sing,masc,nhum).
n(performance,P,Q,sing,fem,nhum).
n(transfert,P,Q,sing,masc,nhum).
n(joueur,P,Q,sing,masc,hum).
n(tacle,P,Q,sing,masc,nhum).
n(handball,P,Q,sing,masc,nhum).
n(qualification,P,Q,sing,fem,nhum).
n(poirier,P,Q,sing,masc,nhum).
n(moniteur,P,Q,sing,masc,hum).
n(professionnel,P,Q,sing,masc,hum).
n(disqualification,P,Q,sing,fem,nhum).
n(supportrice,P,Q,sing,fem,hum).
n(acrobates,P,Q,plur,masc,hum).
n(arc,P,Q,sing,masc,nhum).
n(courbature,P,Q,sing,fem,nhum).
n(vitesse,P,Q,sing,fem,nhum).
n(amateur,P,Q,sing,masc,hum).
n(pilote,P,Q,sing,masc,hum).
n(lancer,P,Q,sing,masc,nhum).
n(dribbleur,P,Q,sing,masc,nhum).
n(podium,P,Q,sing,masc,nhum).
n(milieu,P,Q,sing,masc,nhum).
n(sportives,P,Q,plur,fem,hum).
n(exercices,P,Q,plur,masc,nhum).
n(revers,P,Q,plur,masc,nhum).
n(lob,P,Q,sing,masc,nhum).
n(meneur,P,Q,sing,masc,hum).
n(poteaux,P,Q,plur,masc,nhum).
n(avantage,P,Q,sing,masc,nhum).
n(dos,P,Q,sing,masc,nhum).
n(lancers,P,Q,plur,masc,nhum).
n(sortie,P,Q,sing,fem,nhum).
n(entraineuse,P,Q,sing,fem,hum).
n(supporteurs,P,Q,plur,masc,hum).
n(rugby,P,Q,sing,masc,nhum).
n(amateur,P,Q,sing,fem,hum).
n(corner,P,Q,sing,masc,nhum).
n(vestiaire,P,Q,sing,masc,nhum).
n(attaquant,P,Q,sing,masc,hum).
n(surface,P,Q,sing,fem,nhum).
n(olympiades,P,Q,plur,fem,nhum).
n(montants,P,Q,plur,masc,nhum).
n(parade,P,Q,sing,fem,nhum).
n(sportifs,P,Q,plur,masc,hum).
n(concours,P,Q,plur,masc,nhum).
n(repos,P,Q,sing,masc,nhum).
n(anticipation,P,Q,sing,fem,nhum).
n(footballeuse,P,Q,sing,fem,hum).
n(talonneur,P,Q,sing,masc,hum).
n(golfeur,P,Q,sing,masc,hum).
n(balayage,P,Q,sing,masc,nhum).
n(supporteur,P,Q,sing,masc,hum).
n(rugbyman,P,Q,sing,masc,hum).
n(skieur,P,Q,sing,masc,hum).
n(natation,P,Q,sing,fem,nhum).
n(ascension,P,Q,sing,fem,nhum).
n(olympiade,P,Q,sing,fem,nhum).
n(cheval,P,Q,sing,masc,hum).
n(chrono,P,Q,sing,masc,nhum).
n(sumo,P,Q,plur,masc,hum).
n(pilier,P,Q,sing,masc,hum).
n(ligue,P,Q,sing,fem,nhum).
n(entraineur,P,Q,sing,masc,hum).

np(Porsche,P,Q,sing,fem,nhum).
np(NFL,P,Q,sing,masc,nhum).
np(Puma,P,Q,sing,masc,nhum).
np(Belgique,P,Q,sing,fem,nhum).
np(Grèce,P,Q,sing,fem,nhum).
np(Ferrari,P,Q,sing,fem,nhum).
np(Tunisie,P,Q,sing,fem,nhum).
np(Australie,P,Q,sing,fem,nhum).
np(Galatasaray,P,Q,sing,masc,nhum).
% np(Grande-Bretagne,P,Q,sing,fem,hum).
np(Espagne,P,Q,sing,fem,hum).
np(Nike,P,Q,sing,fem,nhum).
% np(Royaume-Uni,P,Q,sing,masc,hum).
np(France,P,Q,sing,masc,hum).
np(BMX,P,Q,sing,masc,nhum).
np(Bastia,P,Q,sing,masc,nhum).
np(Angleterre,P,Q,sing,fem,hum).
np(ULM,P,Q,sing,masc,nhum).
np(Allemagne,P,Q,sing,fem,nhum).
np(Inde,P,Q,sing,fem,nhum).
np(Canada,P,Q,sing,masc,nhum).
% np(Roland-Garros,P,Q,sing,masc,nhum).
np(Brennus,P,Q,sing,masc,nhum).
np(Panthéon,P,Q,sing,masc,nhum).
np(Europe,P,Q,sing,fem,hum).
np(Suisse,P,Q,sing,fem,hum).
np(Wimbledon,P,Q,sing,masc,nhum).
np(Italie,P,Q,sing,masc,nhum).
np(F1,P,Q,sing,fem,nhum).
np(Paris,P,Q,sing,masc,hum).
% np(Fosbury-flop,P,Q,sing,masc,nhum).
np(Pakistan,P,Q,sing,masc,nhum).
np(Poulidor,P,Q,sing,masc,hum).
np(Monaco,P,Q,sing,masc,nhum).
np(Londres,P,Q,sing,masc,nhum).
np(JO,P,Q,plur,fem,nhum).
