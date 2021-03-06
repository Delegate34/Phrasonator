:-encoding(utf8).

phrase(W) :-
  set_prolog_stack(global, limit(100 000 000 000)),
  findall(X,s(X,Y,Z),L),
  random_member(W,L).
  % open('liste.txt',write,OS),
  % loop_through_list(L,OS),
  % close(OS).

% loop_through_list([],OS).
% loop_through_list([Head|Tail],OS) :-
%     write(OS,Head),
%     write(OS,'\n'),
%     loop_through_list(Tail,OS).

s(L,P,Q):-
  sn(SN,P,X,N,G,H), sv(SV,X,Q,N,H,Ho),\+nth0(Z, SV, SN),append(SN,SV,L).
  % ,atomic_list_concat(L,' ',A).

sn([DET,NOM],P,Q,N,G,H):-
det(DET,P,X,N,G), n(NOM,X,Y,N,G,H).

sn([NP],P,Q,N,G,H):-
np(NP,P,X,N,G,H).

sv([VI],P,Q,N,H,Ho):-vi(VI,P,Q,N,H).

sv(L,P,Q,N,H,Ho):-
vt(VT,P,X,N,H,Ho), sn(SN,X,Q,No,G,Ho),append([VT],SN,L).

det(tout,P,Q,sing,masc).
det(toute,P,Q,sing,fem).
det(tous,P,Q,plur,masc).
det(toutes,P,Q,plur,fem).
det(chaque,P,Q,sing,masc).
det(chaque,P,Q,sing,fem).
det(quelque,P,Q,sing,masc).
det(quelques,P,Q,plur,masc).
det(quelque,P,Q,sing,fem).
det(quelques,P,Q,plur,fem).
det(certain,P,Q,sing,masc).
det(certaine,P,Q,sing,fem).
det(certains,P,Q,plur,masc).
det(certaines,P,Q,plur,fem).

vt(abandonne,P,Q,sing,hum,X).
vt(abandonnent,P,Q,plur,hum,X).
vt(accélère,P,Q,sing,hum,X).
vt(accèlerent,P,Q,plur,hum,X).
vt(admire,P,Q,sing,hum,X).
vt(admirent,P,Q,plur,hum,X).
vt(affronte,P,Q,sing,hum,hum).
vt(affrontent,P,Q,plur,hum,hum).
vt(aide,P,Q,sing,hum,hum).
vt(aident,P,Q,plur,hum,hum).
vt(aime,P,Q,sing,hum,nhum).
vt(aiment,P,Q,plur,hum,nhum).
vt(ajoute,P,Q,sing,hum,X).
vt(ajoutent,P,Q,plur,hum,X).
vi(va,P,Q,sing,hum).
vi(vont,P,Q,plur,hum).
vt(améliore,P,Q,sing,hum,nhum).
vt(améliorent,P,Q,plur,hum,nhum).
vt(amortit,P,Q,sing,hum,nhum).
vt(amortissent,P,Q,plur,hum,nhum).
vt(applaudit,P,Q,sing,hum,hum).
vt(applaudissent,P,Q,plur,hum,hum).
vt(arrête,P,Q,sing,hum,X).
vt(arrêtent,P,Q,plur,hum,X).
vi(arrête,P,Q,sing,hum).
vi(arrêtent,P,Q,plur,hum).
vt(arrive,P,Q,sing,hum,nhum).
vt(arrivent,P,Q,plur,hum,nhum).
vt(attaque,P,Q,sing,hum,X).
vt(attaquent,P,Q,plur,hum,X).
vt(attrape,P,Q,sing,hum,X).
vt(attrapent,P,Q,plur,hum,X).
vt(avance,P,Q,sing,hum,nhum).
vt(avancent,P,Q,plur,hum,nhum).
vi(avance,P,Q,sing,hum).
vi(avancent,P,Q,plur,hum).
vt(a,P,Q,sing,hum,nhum).
vt(ont,P,Q,plur,hum,nhum).
vi(appartient,P,Q,sing,hum).
vi(appartiennent,P,Q,plur,hum).
vt(danse,P,Q,sing,hum,nhum).
vt(dansent,P,Q,plur,hum,nhum).
vi(danse,P,Q,sing,hum).
vi(dansent,P,Q,plur,hum).
vt(défend,P,Q,sing,hum,X).
vt(défendent,P,Q,plur,hum,X).
vt(défie,P,Q,sing,hum,hum).
vt(défient,P,Q,plur,hum,hum).
vt(dégage,P,Q,sing,hum,X).
vt(dégagent,P,Q,plur,hum,X).
vi(dégage,P,Q,sing,hum).
vi(dégagent,P,Q,plur,hum).
vt(démarre,P,Q,sing,hum,nhum).
vt(démarrent,P,Q,plur,hum,nhum).
vi(démarre,P,Q,sing,hum).
vi(démarrent,P,Q,plur,hum).
vt(dévie,P,Q,sing,hum,X).
vt(dévient,P,Q,plur,hum,X).
vi(dévie,P,Q,sing,hum).
vi(dévient,P,Q,plur,hum).
vt(dope,P,Q,sing,hum,hum).
vt(dopent,P,Q,plur,hum,hum).
vi(dort,P,Q,sing,hum).
vi(dorment,P,Q,plur,hum).
vt(doit,P,Q,sing,hum,X).
vt(doivent,P,Q,plur,hum,X).
vt(dit,P,Q,sing,hum,nhum).
vt(disent,P,Q,plur,hum,nhum).
vt(dispute,P,Q,sing,hum,hum).
vt(disputent,P,Q,plur,hum,hum).
vt(domine,P,Q,sing,hum,X).
vt(dominent,P,Q,plur,hum,X).
vt(donne,P,Q,sing,hum,nhum).
vt(donnent,P,Q,plur,hum,nhum).
vi(donne,P,Q,sing,hum).
vi(donnent,P,Q,plur,hum).
vi(hésite,P,Q,sing,hum).
vi(hésitent,P,Q,plur,hum).
vt(humilie,P,Q,sing,hum,nhum).
vt(humilient,P,Q,plur,hum,nhum).
vt(jette,P,Q,sing,hum,nhum).
vt(jettent,P,Q,plur,hum,nhum).
vt(jongle,P,Q,sing,hum,nhum).
vt(jonglent,P,Q,plur,hum,nhum).
vt(joue,P,Q,sing,hum,nhum).
vt(jouent,P,Q,plur,hum,nhum).
vi(joue,P,Q,sing,hum).
vi(jouent,P,Q,plur,hum).
vt(lâche,P,Q,sing,hum,nhum).
vt(lâchent,P,Q,plur,hum,nhum).
vi(lâche,P,Q,sing,hum).
vi(lâchent,P,Q,plur,hum).
vt(lance,P,Q,sing,hum,nhum).
vt(lancent,P,Q,plur,hum,nhum).
vt(loupe,P,Q,sing,hum,nhum).
vt(loupent,P,Q,plur,hum,nhum).
vi(loupe,P,Q,sing,hum).
vi(loupent,P,Q,plur,hum).
vi(nage,P,Q,sing,hum).
vi(nagent,P,Q,plur,hum).
vi(navigue,P,Q,sing,hum).
vi(naviguent,P,Q,plur,hum).
vi(provient,P,Q,sing,hum).
vi(proviennent,P,Q,plur,hum).
vt(protège,P,Q,sing,hum,nhum).
vt(protègent,P,Q,plur,hum,nhum).
vi(progresse,P,Q,sing,hum).
vi(progressent,P,Q,plur,hum).
vt(prend,P,Q,sing,hum,X).
vt(prennent,P,Q,plur,hum,X).
vi(prend,P,Q,sing,hum).
vi(prennent,P,Q,plur,hum).
vt(pratique,P,Q,sing,hum,nhum).
vt(pratiquent,P,Q,plur,hum,nhum).
vt(plonge,P,Q,sing,hum,hum).
vt(plongent,P,Q,plur,hum,hum).
vi(plonge,P,Q,sing,hum).
vi(plongent,P,Q,plur,hum).
vt(perd,P,Q,sing,hum,X).
vt(perdent,P,Q,plur,hum,X).
vi(perd,P,Q,sing,hum).
vi(perdent,P,Q,plur,hum).
vi(part,P,Q,sing,hum).
vi(partent,P,Q,plur,hum).
vi(participe,P,Q,sing,hum).
vi(participent,P,Q,plur,hum).
vi(parle,P,Q,sing,hum).
vi(parlent,P,Q,plur,hum).
vt(recrute,P,Q,sing,hum,hum).
vt(recrutent,P,Q,plur,hum,hum).
vt(rejoint,P,Q,sing,hum,X).
vt(rejoignent,P,Q,plur,hum,X).
vt(remplace,P,Q,sing,hum,hum).
vt(remplacent,P,Q,plur,hum,hum).
vt(remporte,P,Q,sing,hum,nhum).
vt(remportent,P,Q,plur,hum,nhum).
vt(rencontre,P,Q,sing,hum,hum).
vt(rencontrent,P,Q,plur,hum,hum).
vt(respecte,P,Q,sing,hum,hum).
vt(respectent,P,Q,plur,hum,hum).
vt(utilise,P,Q,sing,hum,nhum).
vt(utilisent,P,Q,plur,hum,nhum).
vt(saisit,P,Q,sing,hum,nhum).
vt(saisissent,P,Q,plur,hum,nhum).
vt(salue,P,Q,sing,hum,hum).
vt(saluent,P,Q,plur,hum,hum).
vi(saute,P,Q,sing,hum).
vi(sautent,P,Q,plur,hum).
vt(sélectionne,P,Q,sing,hum,X).
vt(sélectionnent,P,Q,plur,hum,X).
vt(siffle,P,Q,sing,hum,hum).
vt(sifflent,P,Q,plur,hum,hum).
vi(siffle,P,Q,sing,hum).
vi(sifflent,P,Q,plur,hum).
vi(skie,P,Q,sing,hum).
vi(skient,P,Q,plur,hum).
vt(soigne,P,Q,sing,hum,hum).
vt(soignent,P,Q,plur,hum,hum).
vt(sort,P,Q,sing,hum,nhum).
vt(sortent,P,Q,plur,hum,nhum).
vi(sort,P,Q,sing,hum).
vi(sortent,P,Q,plur,hum).
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
vt(calme,P,Q,sing,hum,hum).
vt(calment,P,Q,plur,hum,hum).
vt(célèbre,P,Q,sing,hum,nhum).
vt(célèbrent,P,Q,plur,hum,nhum).
vt(change,P,Q,sing,hum,Y).
vt(changent,P,Q,plur,hum,Y).
vi(change,P,Q,sing,hum).
vi(changent,P,Q,plur,hum).
vt(choisit,P,Q,sing,hum,X).
vt(choisissent,P,Q,plur,hum,X).
vi(chute,P,Q,sing,hum).
vi(chutent,P,Q,plur,hum).
vt(concède,P,Q,sing,hum,X).
vt(concèdent,P,Q,plur,hum,X).
vt(connaît,P,Q,sing,hum,X).
vt(connaîssent,P,Q,plur,hum,X).
vt(continue,P,Q,sing,hum,nhum).
vt(continuent,P,Q,plur,hum,nhum).
vi(continue,P,Q,sing,hum).
vi(continuent,P,Q,plur,hum).
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
vt(félicite,P,Q,sing,hum,hum).
vt(félicitent,P,Q,plur,hum,hum).
vt(fête,P,Q,sing,hum,nhum).
vt(fêtent,P,Q,plur,hum,nhum).
vt(frappe,P,Q,sing,hum,X).
vt(frappent,P,Q,plur,hum,X).
vi(freine,P,Q,sing,hum).
vi(freinent,P,Q,plur,hum).
vt(gagne,P,Q,sing,hum,nhum).
vt(gagnent,P,Q,plur,hum,nhum).
vi(galope,P,Q,sing,hum).
vi(galopent,P,Q,plur,hum).
vt(garde,P,Q,sing,hum,nhum).
vt(gardent,P,Q,plur,hum,nhum).
vi(glisse,P,Q,sing,hum).
vi(glissent,P,Q,plur,hum).
vt(maîtrise,P,Q,sing,hum,nhum).
vt(maîtrisent,P,Q,plur,hum,nhum).
vi(marche,P,Q,sing,hum).
vi(marchent,P,Q,plur,hum).
vt(marque,P,Q,sing,hum,hum).
vt(marquent,P,Q,plur,hum,hum).
vi(marque,P,Q,sing,hum).
vi(marquent,P,Q,plur,hum).
vt(mène,P,Q,sing,hum,nhum).
vt(mènent,P,Q,plur,hum,nhum).
vi(mène,P,Q,sing,hum).
vi(mènent,P,Q,plur,hum).
vt(met,P,Q,sing,hum,nhum).
vt(mettent,P,Q,plur,hum,nhum).
vt(observe,P,Q,sing,hum,X).
vt(observent,P,Q,plur,hum,X).
vt(oppose,P,Q,sing,hum,hum).
vt(opposent,P,Q,plur,hum,hum).
vt(qualifie,P,Q,sing,hum,nhum).
vt(qualifient,P,Q,plur,hum,nhum).
vi(qualifie,P,Q,sing,hum).
vi(qualifient,P,Q,plur,hum).
vt(quitte,P,Q,sing,hum,nhum).
vt(quittent,P,Q,plur,hum,nhum).
vt(ralentit,P,Q,sing,hum,Z).
vt(ralentissent,P,Q,plur,hum,Z).
vi(ralentit,P,Q,sing,hum).
vi(ralentissent,P,Q,plur,hum).
vt(ramasse,P,Q,sing,hum,nhum).
vt(ramassent,P,Q,plur,hum,nhum).
vt(réceptionne,P,Q,sing,hum,nhum).
vt(réceptionnent,P,Q,plur,hum,nhum).
vt(recommence,P,Q,sing,hum,Z).
vt(recommencent,P,Q,plur,hum,Z).
vi(recommence,P,Q,sing,hum).
vi(recommencent,P,Q,plur,hum).
vt(récompense,P,Q,sing,hum,hum).
vt(récompensent,P,Q,plur,hum,hum).
vt(vainc,P,Q,sing,hum,hum).
vt(vainquent,P,Q,plur,hum,hum).
vi(vient,P,Q,sing,hum).
vi(viennent,P,Q,plur,hum).
vt(vise,P,Q,sing,hum,nhum).
vt(visent,P,Q,plur,hum,nhum).
vt(voit,P,Q,sing,hum,X).
vt(voient,P,Q,plur,hum,X).
vt(veut,P,Q,sing,hum,nhum).
vt(veulent,P,Q,plur,hum,nhum).
vt(tire,P,Q,sing,hum,nhum).
vt(tirent,P,Q,plur,hum,nhum).
vt(touche,P,Q,sing,hum,Y).
vt(touchent,P,Q,plur,hum,Y).
vi(triche,P,Q,sing,hum).
vi(trichent,P,Q,plur,hum).
vt(trouve,P,Q,sing,hum,X).
vt(trouvent,P,Q,plur,hum,X).
vt(supporte,P,Q,sing,hum,Y).
vt(supportent,P,Q,plur,hum,Y).
vt(suspend,P,Q,sing,hum,X).
vt(suspendent,P,Q,plur,hum,X).


n(sport,P,Q,sing,masc,nhum).
n(sports,P,Q,plur,masc,nhum).
n(traversée,P,Q,sing,fem,nhum).
n(athlétisme,P,Q,sing,masc,nhum).
n(jiujitsu,P,Q,sing,masc,nhum).
n(snowboard,P,Q,sing,masc,nhum).
n(taihojutsu,P,Q,sing,masc,nhum).
n(wakeboard,P,Q,sing,masc,nhum).
n(roulade,P,Q,sing,fem,nhum).
n(javelot,P,Q,sing,masc,nhum).
n(skieur,P,Q,sing,masc,hum).
n(boomerang,P,Q,sing,masc,nhum).
% n(contre-offensive,P,Q,sing,fem,nhum).
n(entorse,P,Q,sing,fem,nhum).
% n(water-polo,P,Q,sing,masc,nhum).
n(foulée,P,Q,sing,fem,nhum).
n(concurrent,P,Q,sing,masc,hum).
n(remontée,P,Q,sing,fem,nhum).
n(volée,P,Q,sing,fem,nhum).
n(divertissement,P,Q,sing,masc,nhum).
n(seniors,P,Q,plur,fem,hum).
n(nage,P,Q,sing,fem,nhum).
n(vague,P,Q,sing,fem,nhum).
n(tennis,P,Q,sing,fem,nhum).
n(abandon,P,Q,sing,masc,nhum).
n(outsider,P,Q,sing,masc,hum).
n(supériorité,P,Q,sing,fem,nhum).
n(sponsor,P,Q,sing,fem,nhum).
n(piscine,P,Q,sing,fem,nhum).
n(patineur,P,Q,sing,masc,hum).
n(aquagym,P,Q,sing,fem,nhum).
n(prise,P,Q,sing,fem,nhum).
n(pêche,P,Q,sing,fem,nhum).
n(épéisme,P,Q,sing,masc,nhum).
n(dérapage,P,Q,sing,masc,nhum).
n(galipette,P,Q,sing,fem,nhum).
n(échappée,P,Q,sing,fem,nhum).
n(tricheur,P,Q,sing,masc,hum).
n(marathon,P,Q,sing,masc,nhum).
n(plaquette,P,Q,sing,fem,nhum).
n(cage,P,Q,sing,fem,hum).
n(relayeur,P,Q,sing,masc,hum).
n(arbitre,P,Q,sing,masc,hum).
n(manchette,P,Q,sing,fem,nhum).
n(goal,P,Q,sing,masc,nhum).
n(moto,P,Q,sing,fem,nhum).
n(bicyclette,P,Q,sing,fem,nhum).
n(footballer,P,Q,sing,masc,hum).
n(dévissé,P,Q,sing,masc,nhum).
n(pistolet,P,Q,sing,masc,nhum).
n(haltérophile,P,Q,sing,fem,hum).
n(motoneige,P,Q,sing,fem,nhum).
n(jogging,P,Q,sing,masc,nhum).
n(trick,P,Q,sing,masc,nhum).
n(obstacle,P,Q,sing,masc,nhum).
n(régate,P,Q,sing,fem,nhum).
n(balle,P,Q,sing,masc,nhum).
n(ballon,P,Q,sing,masc,nhum).
n(gym,P,Q,sing,fem,nhum).
n(poutre,P,Q,sing,fem,nhum).
n(softball,P,Q,sing,masc,nhum).
% n(maitre-nageur,P,Q,sing,masc,hum).
n(chronométrage,P,Q,sing,masc,nhum).
n(chute,P,Q,sing,fem,nhum).
n(percée,P,Q,sing,fem,nhum).
n(hooligan,P,Q,sing,masc,hum).
n(tension,P,Q,sing,fem,nhum).
n(plongeon,P,Q,sing,masc,nhum).
n(ballet,P,Q,sing,masc,nhum).
n(cible,P,Q,sing,fem,nhum).
n(catch,P,Q,sing,masc,nhum).
n(feinte,P,Q,sing,fem,nhum).
n(intervieweur,P,Q,sing,masc,hum).
% n(pince-nez,P,Q,plur,masc,nhum).
n(basket,P,Q,sing,masc,nhum).
n(courses,P,Q,plur,fem,nhum).
n(mitaine,P,Q,sing,fem,nhum).
n(basket,P,Q,sing,fem,nhum).
n(kayac,P,Q,sing,masc,nhum).
n(batte,P,Q,sing,fem,nhum).
n(vista,P,Q,sing,fem,nhum).
n(manche,P,Q,sing,fem,nhum).
n(navigateur,P,Q,sing,masc,hum).
n(spectacle,P,Q,sing,masc,nhum).
n(crawleur,P,Q,sing,masc,hum).
n(coéquipier,P,Q,sing,masc,hum).
n(haies,P,Q,plur,fem,nhum).
n(recordman,P,Q,sing,masc,hum).
% n(demi-fond,P,Q,sing,masc,nhum).
n(éliminatoire,P,Q,sing,fem,nhum).
n(selles,P,Q,plur,fem,nhum).
n(favori,P,Q,sing,masc,nhum).
n(télé,P,Q,sing,fem,nhum).
n(cogneur,P,Q,sing,masc,hum).
n(club,P,Q,sing,masc,nhum).
n(taekwendo,P,Q,sing,masc,nhum).
n(hippique,P,Q,sing,masc,nhum).
n(prolongation,P,Q,sing,fem,nhum).
n(trapèze,P,Q,sing,masc,nhum).
n(baudrier,P,Q,sing,masc,nhum).
% n(base-ball,P,Q,sing,masc,nhum).
n(sabre,P,Q,sing,masc,nhum).
n(brasse,P,Q,sing,fem,nhum).
n(marqueuse,P,Q,sing,fem,hum).
n(vélodrome,P,Q,sing,masc,nhum).
n(canoéiste,P,Q,sing,fem,nhum).
n(baudruche,P,Q,sing,fem,nhum).
n(cyclisme,P,Q,sing,masc,nhum).
n(transpiration,P,Q,sing,fem,nhum).
n(sueur,P,Q,sing,fem,nhum).
n(tournoi,P,Q,sing,masc,nhum).
n(professionnalisme,P,Q,sing,masc,nhum).
n(faute,P,Q,sing,fem,nhum).
n(pirouette,P,Q,sing,fem,nhum).
n(dégagement,P,Q,sing,masc,nhum).
% n(médecine-ball,P,Q,sing,masc,nhum).
n(botte,P,Q,sing,fem,nhum).
n(danseur,P,Q,sing,masc,hum).
% n(tie-break,P,Q,sing,masc,nhum).
n(blason,P,Q,sing,masc,nhum).
n(gymnaste,P,Q,sing,fem,hum).
n(volleyeuse,P,Q,sing,fem,hum).
n(survêtement,P,Q,sing,masc,nhum).
n(samba,P,Q,sing,fem,nhum).
n(équitation,P,Q,sing,fem,nhum).
n(cavalière,P,Q,sing,fem,nhum).
% n(mi-temps,P,Q,sing,fem,nhum).
% n(protège-tibia,P,Q,sing,masc,nhum).
n(aptitude,P,Q,sing,fem,nhum).
n(brisé,P,Q,sing,masc,nhum).
n(cordage,P,Q,sing,masc,nhum).
n(pisteur,P,Q,sing,masc,hum).
n(manipulations,P,Q,plur,fem,nhum).
n(clubs,P,Q,plur,masc,nhum).
n(publicité,P,Q,sing,fem,nhum).
n(escapade,P,Q,sing,fem,nhum).
n(canyonisme,P,Q,sing,masc,nhum).
n(raid,P,Q,sing,masc,nhum).
n(cricket,P,Q,sing,masc,nhum).
n(attaque,P,Q,sing,fem,nhum).
% n(krav-maga,P,Q,sing,masc,nhum).
n(sarbacane,P,Q,sing,fem,nhum).
% n(fair-play,P,Q,sing,masc,nhum).
n(pointeur,P,Q,sing,masc,hum).
n(porteur,P,Q,sing,masc,hum).
n(traceur,P,Q,sing,masc,hum).
n(essai,P,Q,sing,masc,nhum).
n(apnée,P,Q,sing,fem,nhum).
n(jambière,P,Q,sing,fem,nhum).
n(freestyle,P,Q,sing,masc,nhum).
n(gain,P,Q,sing,masc,nhum).
n(sélectionneur,P,Q,sing,masc,nhum).
n(paddle,P,Q,sing,masc,nhum).
n(monoski,P,Q,sing,masc,nhum).
n(challenge,P,Q,sing,masc,nhum).
n(qualificatif,P,Q,sing,masc,nhum).
n(service,P,Q,sing,masc,nhum).
n(coach,P,Q,sing,masc,hum).
n(bloqueur,P,Q,sing,masc,hum).
n(match,P,Q,sing,masc,nhum).
n(défaite,P,Q,sing,fem,nhum).
n(boxe,P,Q,sing,fem,nhum).
n(finisseur,P,Q,sing,masc,hum).
n(touchdown,P,Q,sing,masc,nhum).
n(triathlonien,P,Q,sing,masc,hum).
n(quadruplé,P,Q,sing,masc,nhum).
n(égalité,P,Q,sing,fem,nhum).
n(quintuplé,P,Q,sing,masc,nhum).
n(handicapé,P,Q,sing,masc,hum).
n(combat,P,Q,sing,masc,nhum).
n(kayak,P,Q,sing,masc,nhum).
n(marcheur,P,Q,sing,masc,hum).
n(défense,P,Q,sing,fem,nhum).
n(étriers,P,Q,plur,masc,nhum).
n(surentraînement,P,Q,sing,masc,nhum).
% n(jiu-jitsu,P,Q,sing,masc,nhum).
n(bodysurf,P,Q,sing,masc,nhum).
n(marathonien,P,Q,sing,masc,hum).
n(agilité,P,Q,sing,fem,nhum).
n(hanche,P,Q,sing,fem,nhum).
n(riposte,P,Q,sing,fem,nhum).
n(vélo,P,Q,sing,masc,nhum).
% n(demi-longueur,P,Q,sing,fem,nhum).
n(mât,P,Q,sing,masc,nhum).
n(palmarès,P,Q,plur,masc,nhum).
n(plaquage,P,Q,sing,masc,nhum).
n(ailier,P,Q,sing,masc,hum).
n(équin,P,Q,sing,masc,nhum).
% n(knock-down,P,Q,sing,masc,nhum).
n(kendo,P,Q,sing,masc,nhum).
n(genouillère,P,Q,sing,fem,nhum).
n(prolongations,P,Q,plur,fem,nhum).
% n(knock-out,P,Q,sing,masc,nhum).
n(jouet,P,Q,sing,masc,nhum).
n(frappe,P,Q,sing,fem,nhum).
n(dopage,P,Q,sing,masc,nhum).
n(athlètes,P,Q,plur,fem,hum).
n(supporteur,P,Q,sing,masc,hum).
n(mawashi,P,Q,sing,masc,nhum).
n(poloïste,P,Q,sing,masc,hum).
n(saut,P,Q,sing,masc,nhum).
n(stade,P,Q,sing,masc,nhum).
n(patinoire,P,Q,sing,fem,nhum).
n(podiums,P,Q,plur,masc,nhum).
n(skateboard,P,Q,sing,masc,nhum).
n(spot,P,Q,sing,masc,nhum).
n(uppercut,P,Q,sing,masc,nhum).
n(biathlon,P,Q,sing,masc,nhum).
n(élimination,P,Q,sing,fem,nhum).
n(contre,P,Q,sing,masc,nhum).
n(terrain,P,Q,sing,masc,nhum).
n(écurie,P,Q,sing,fem,nhum).
n(partie,P,Q,sing,fem,nhum).
n(rame,P,Q,sing,fem,nhum).
n(pointes,P,Q,plur,fem,nhum).
n(transformation,P,Q,sing,fem,nhum).
n(badminton,P,Q,sing,masc,nhum).
n(internationaux,P,Q,plur,masc,nhum).
n(échauffement,P,Q,sing,masc,nhum).
n(crawl,P,Q,sing,masc,nhum).
n(acrobatie,P,Q,sing,fem,nhum).
n(talon,P,Q,sing,masc,nhum).
n(sauts,P,Q,plur,masc,nhum).
n(lutte,P,Q,sing,fem,nhum).
n(frappeur,P,Q,sing,masc,nhum).
n(toréador,P,Q,sing,masc,hum).
n(short,P,Q,sing,masc,nhum).
n(pénalité,P,Q,sing,fem,nhum).
n(clé,P,Q,sing,fem,nhum).
n(break,P,Q,sing,masc,nhum).
n(soigneur,P,Q,sing,masc,hum).
n(compétitivité,P,Q,sing,fem,nhum).
% n(trois-quarts,P,Q,plur,masc,hum).
n(point,P,Q,sing,masc,nhum).
n(transversale,P,Q,sing,fem,nhum).
n(bicyclette,P,Q,sing,fem,nhum).
n(assouplissement,P,Q,sing,masc,nhum).
n(cheval,P,Q,sing,masc,nhum).
n(retrait,P,Q,sing,masc,nhum).
n(descente,P,Q,sing,fem,nhum).
n(libero,P,Q,sing,masc,hum).
n(aviron,P,Q,sing,masc,nhum).
n(percée,P,Q,sing,masc,nhum).
n(canne,P,Q,sing,fem,nhum).
n(qualifié,P,Q,sing,masc,hum).
% n(ball-trap,P,Q,sing,masc,nhum).
n(claquage,P,Q,sing,masc,nhum).
n(agitation,P,Q,sing,fem,nhum).
n(jeu,P,Q,sing,masc,nhum).
n(quidditch,P,Q,sing,masc,nhum).
n(footing,P,Q,sing,masc,nhum).
n(minigolf,P,Q,sing,masc,nhum).
n(filet,P,Q,sing,masc,nhum).
n(dossard,P,Q,sing,masc,nhum).
n(marqué,P,Q,sing,fem,nhum).
n(surfeur,P,Q,sing,masc,hum).
n(batteur,P,Q,sing,masc,hum).
n(volley,P,Q,sing,masc,nhum).
n(windsurf,P,Q,sing,masc,nhum).
n(gainage,P,Q,sing,masc,nhum).
n(paintball,P,Q,sing,masc,nhum).
n(galop,P,Q,sing,masc,nhum).
n(but,P,Q,sing,masc,nhum).
n(arbalète,P,Q,sing,fem,nhum).
n(court,P,Q,sing,masc,nhum).
n(étrier,P,Q,sing,masc,nhum).
n(participant,P,Q,sing,masc,hum).
n(camp,P,Q,sing,masc,nhum).
n(marqueur,P,Q,sing,masc,hum).
n(motocrosseur,P,Q,sing,masc,hum).
n(plaisir,P,Q,sing,masc,nhum).
n(joueuse,P,Q,sing,fem,hum).
n(billard,P,Q,sing,masc,nhum).
n(ouverture,P,Q,sing,fem,nhum).
n(disque,P,Q,sing,masc,nhum).
n(sportive,P,Q,sing,fem,hum).
n(relais,P,Q,sing,masc,nhum).
n(canotage,P,Q,sing,masc,nhum).
n(allures,P,Q,plur,fem,nhum).
n(nul,P,Q,sing,masc,nhum).
n(galopade,P,Q,sing,fem,nhum).
n(défenses,P,Q,plur,fem,nhum).
n(allonge,P,Q,sing,fem,nhum).
n(tricherie,P,Q,sing,fem,nhum).
n(voltige,P,Q,sing,fem,nhum).
% n(contre-performance,P,Q,sing,fem,nhum).
n(corde,P,Q,sing,fem,nhum).
n(tennisman,P,Q,sing,masc,hum).
n(charnière,P,Q,sing,fem,nhum).
n(curling,P,Q,sing,masc,nhum).
n(numéro,P,Q,sing,masc,nhum).
n(mousqueton,P,Q,sing,masc,nhum).
n(tuba,P,Q,sing,masc,nhum).
% n(kayak-polo,P,Q,sing,masc,nhum).
n(drop,P,Q,sing,masc,nhum).
n(interdits,P,Q,plur,masc,nhum).
n(défense,P,Q,sing,fem,nhum).
n(passe,P,Q,sing,fem,nhum).
n(capitaine,P,Q,sing,masc,hum).
n(activité,P,Q,sing,fem,nhum).
n(raquette,P,Q,sing,fem,nhum).
n(publicitaire,P,Q,sing,masc,nhum).
n(droit,P,Q,sing,masc,nhum).
n(passeur,P,Q,sing,masc,hum).
n(aviateur,P,Q,sing,masc,hum).
n(musculation,P,Q,sing,fem,nhum).
n(plongée,P,Q,sing,fem,nhum).
n(triplé,P,Q,sing,masc,nhum).
n(motocross,P,Q,plur,masc,nhum).
n(fitness,P,Q,sing,masc,nhum).
n(gardien,P,Q,sing,masc,hum).
n(nageur,P,Q,sing,masc,hum).
n(pivot,P,Q,sing,masc,nhum).
n(pentathlon,P,Q,sing,masc,nhum).
n(détente,P,Q,sing,fem,nhum).
n(bobsleigh,P,Q,sing,masc,nhum).
n(portée,P,Q,sing,fem,nhum).
n(revers,P,Q,sing,masc,nhum).
n(golf,P,Q,sing,masc,nhum).
n(jonglerie,P,Q,sing,fem,nhum).
n(plaquer,P,Q,sing,masc,nhum).
n(figure,P,Q,sing,fem,nhum).
n(knockdown,P,Q,sing,masc,nhum).
n(plongeur,P,Q,sing,masc,hum).
n(croisière,P,Q,sing,fem,nhum).
n(appui,P,Q,sing,masc,nhum).
n(coureur,P,Q,sing,masc,hum).
n(boules,P,Q,plur,fem,nhum).
n(crampon,P,Q,sing,masc,nhum).
n(patinette,P,Q,sing,fem,nhum).
n(coudière,P,Q,sing,fem,nhum).
n(professionnels,P,Q,plur,masc,hum).
n(hooliganisme,P,Q,sing,masc,nhum).
n(sprint,P,Q,sing,masc,nhum).
n(champion,P,Q,sing,masc,hum).
n(tir,P,Q,sing,masc,nhum).
n(carrière,P,Q,sing,fem,nhum).
n(catcheur,P,Q,sing,masc,hum).
n(motocycliste,P,Q,sing,fem,hum).
n(santé,P,Q,sing,fem,nhum).
n(jockey,P,Q,sing,masc,hum).
n(boxeur,P,Q,sing,masc,hum).
n(perchiste,P,Q,sing,masc,hum).
n(pilote,P,Q,sing,masc,hum).
n(basketball,P,Q,sing,masc,nhum).
n(intervalle,P,Q,sing,masc,nhum).
n(lucarne,P,Q,sing,fem,nhum).
n(voilier,P,Q,sing,masc,nhum).
n(relégation,P,Q,sing,fem,nhum).
n(duel,P,Q,sing,masc,nhum).
n(joueurs,P,Q,plur,masc,hum).
n(peloton,P,Q,sing,masc,nhum).
n(timing,P,Q,sing,masc,nhum).
n(amateurs,P,Q,plur,masc,hum).
n(dunk,P,Q,sing,fem,nhum).
% n(ju-jitsu,P,Q,sing,masc,nhum).
n(finaliste,P,Q,sing,fem,hum).
n(pronostiqueur,P,Q,sing,masc,hum).
% n(volley-ball,P,Q,sing,masc,nhum).
n(trophée,P,Q,sing,masc,nhum).
n(skis,P,Q,plur,masc,nhum).
n(enchaînement,P,Q,sing,masc,nhum).
n(football,P,Q,sing,masc,nhum).
n(esquive,P,Q,sing,fem,nhum).
n(talonnage,P,Q,sing,masc,nhum).
n(épée,P,Q,sing,fem,nhum).
n(lanceur,P,Q,sing,masc,hum).
n(télévision,P,Q,sing,fem,nhum).
% n(starting-blocks,P,Q,plur,masc,nhum).
n(aviation,P,Q,sing,fem,nhum).
n(planche,P,Q,sing,fem,nhum).
n(solo,P,Q,sing,masc,nhum).
n(vélos,P,Q,plur,masc,nhum).
n(calories,P,Q,plur,fem,nhum).
n(étape,P,Q,sing,fem,nhum).
n(régatier,P,Q,sing,masc,hum).
n(sprinter,P,Q,sing,masc,nhum).
% n(ping-pong,P,Q,plur,masc,nhum).
n(skatepark,P,Q,sing,masc,nhum).
% n(demi-finaliste,P,Q,sing,fem,nhum).
n(cavalier,P,Q,sing,masc,nhum).
n(salsa,P,Q,sing,fem,nhum).
n(cocotte,P,Q,sing,fem,nhum).
n(sabre,P,Q,sing,masc,nhum).
n(haltère,P,Q,sing,masc,nhum).
n(fleurettiste,P,Q,sing,fem,nhum).
n(sanction,P,Q,sing,fem,nhum).
n(pédalier,P,Q,sing,masc,nhum).
n(trot,P,Q,sing,masc,nhum).
n(plongeon,P,Q,sing,masc,nhum).
n(avertissement,P,Q,sing,masc,nhum).
n(expulsion,P,Q,sing,fem,nhum).
n(carabinier,P,Q,sing,masc,hum).
n(téléski,P,Q,sing,masc,hum).
n(égalisation,P,Q,sing,fem,nhum).
n(thèque,P,Q,sing,fem,nhum).
n(socquettes,P,Q,plur,fem,nhum).
n(direct,P,Q,sing,masc,nhum).
n(passion,P,Q,sing,fem,nhum).
n(dribble,P,Q,sing,masc,nhum).
n(canoé,P,Q,sing,masc,nhum).
n(base,P,Q,sing,fem,nhum).
n(musculaire,P,Q,sing,fem,nhum).
n(seller,P,Q,sing,masc,nhum).
n(freeboard,P,Q,sing,fem,nhum).
n(sautoir,P,Q,sing,masc,nhum).
n(looping,P,Q,sing,masc,nhum).
n(escrimeur,P,Q,sing,masc,hum).
n(tennis,P,Q,sing,masc,nhum).
n(rabattement,P,Q,sing,masc,nhum).
n(doublé,P,Q,sing,masc,nhum).
n(handballeur,P,Q,sing,masc,hum).
n(marin,P,Q,sing,masc,hum).
n(haltères,P,Q,plur,masc,nhum).
n(catamaran,P,Q,sing,masc,nhum).
n(plaqueur,P,Q,sing,masc,hum).
n(selle,P,Q,sing,fem,nhum).
n(tandem,P,Q,sing,masc,nhum).
n(étalon,P,Q,sing,masc,hum).
n(pénalisation,P,Q,sing,fem,nhum).
n(piste,P,Q,sing,fem,nhum).
n(aquaplane,P,Q,sing,masc,nhum).
n(boomerang,P,Q,sing,masc,nhum).
n(ceinture,P,Q,sing,fem,nhum).
n(gymnastique,P,Q,sing,fem,nhum).
n(quilles,P,Q,plur,fem,nhum).
n(couleur,P,Q,sing,fem,nhum).
n(crampe,P,Q,sing,fem,nhum).
n(rencontre,P,Q,sing,fem,nhum).
n(championnat,P,Q,sing,masc,nhum).
n(tatami,P,Q,sing,masc,nhum).
n(fléchettes,P,Q,plur,fem,nhum).
n(score,P,Q,sing,masc,nhum).
n(derby,P,Q,sing,masc,nhum).
n(smash,P,Q,sing,masc,nhum).
n(sumotori,P,Q,sing,masc,hum).
n(footeux,P,Q,sing,masc,hum).
n(penalty,P,Q,sing,masc,nhum).
n(vrille,P,Q,sing,fem,nhum).
n(sifflet,P,Q,sing,masc,nhum).
n(sauvetage,P,Q,sing,masc,nhum).
n(cycliste,P,Q,sing,fem,hum).
n(barre,P,Q,sing,fem,nhum).
n(blocage,P,Q,sing,masc,nhum).
n(plot,P,Q,sing,masc,nhum).
n(gant,P,Q,sing,masc,nhum).
% n(aller-retour,P,Q,plur,masc,nhum).
n(arrêt,P,Q,sing,masc,nhum).
n(sportif,P,Q,sing,masc,hum).
n(filets,P,Q,plur,masc,nhum).
n(motocyclisme,P,Q,sing,masc,nhum).
n(streetball,P,Q,sing,masc,nhum).
n(pelouse,P,Q,sing,masc,nhum).
n(set,P,Q,sing,masc,nhum).
n(témoin,P,Q,sing,masc,nhum).
n(tremplin,P,Q,sing,masc,nhum).
% n(basket-ball,P,Q,sing,masc,nhum).
% n(moto-neige,P,Q,sing,fem,nhum).
n(force,P,Q,sing,fem,nhum).
n(compétition,P,Q,sing,fem,nhum).
n(sprinteur,P,Q,sing,masc,hum).
n(trampoline,P,Q,sing,masc,nhum).
n(salle,P,Q,sing,fem,nhum).
n(club,P,Q,sing,masc,nhum).
n(ligne,P,Q,sing,fem,nhum).
n(handicap,P,Q,sing,masc,nhum).
n(course,P,Q,sing,fem,nhum).
n(discipline,P,Q,sing,fem,nhum).
n(handisport,P,Q,sing,fem,nhum).
n(kenjutsu,P,Q,sing,masc,nhum).
n(voile,P,Q,sing,fem,nhum).
% n(pencak-silat,P,Q,sing,masc,nhum).
n(mesure,P,Q,sing,fem,nhum).
n(chandelle,P,Q,sing,fem,nhum).
n(traîneaux,P,Q,plur,masc,nhum).
n(extérieur,P,Q,sing,masc,nhum).
n(nageurs,P,Q,plur,masc,hum).
n(hockeyeur,P,Q,sing,masc,hum).
n(rétablissement,P,Q,sing,masc,nhum).
n(quad,P,Q,sing,masc,nhum).
% n(contre-attaque,P,Q,sing,fem,nhum).
n(annonceur,P,Q,sing,masc,nhum).
n(moulinet,P,Q,sing,masc,nhum).
n(squash,P,Q,sing,masc,nhum).
n(contrôle,P,Q,sing,masc,nhum).
n(muscle,P,Q,sing,masc,nhum).
n(ligue,P,Q,sing,fem,nhum).
n(haie,P,Q,sing,fem,nhum).
n(escalade,P,Q,sing,fem,nhum).
n(coup,P,Q,sing,masc,nhum).
n(jeux,P,Q,plur,masc,nhum).
n(gonflette,P,Q,sing,fem,nhum).
n(franchise,P,Q,sing,fem,nhum).
n(plaisance,P,Q,sing,fem,nhum).
n(karatéka,P,Q,sing,masc,hum).
n(tractions,P,Q,plur,fem,nhum).
% n(protège-dents,P,Q,plur,masc,nhum).
n(botte,P,Q,sing,fem,nhum).
n(ski,P,Q,sing,masc,nhum).
% n(pince-nez,P,Q,sing,masc,nhum).
n(défenseur,P,Q,sing,masc,hum).
n(buteur,P,Q,sing,masc,hum).
n(piste,P,Q,sing,fem,nhum).
n(patin,P,Q,sing,masc,nhum).
n(virage,P,Q,sing,masc,nhum).
n(gants,P,Q,plur,masc,nhum).
n(pressing,P,Q,sing,masc,nhum).
n(record,P,Q,sing,masc,nhum).
n(gauche,P,Q,sing,masc,nhum).
n(poids,P,Q,plur,masc,nhum).
n(karting,P,Q,sing,masc,nhum).
n(rallye,P,Q,sing,masc,nhum).
n(palet,P,Q,sing,masc,nhum).
n(box,P,Q,sing,masc,nhum).
n(classement,P,Q,sing,masc,nhum).
n(grimpeur,P,Q,sing,masc,hum).
n(débutant,P,Q,sing,masc,hum).
n(mouvement,P,Q,sing,masc,nhum).
n(anneaux,P,Q,plur,masc,nhum).
n(chasse,P,Q,sing,fem,nhum).
n(filet,P,Q,sing,masc,hum).
n(foot,P,Q,sing,masc,nhum).
n(compétiteur,P,Q,sing,masc,hum).
n(lutteur,P,Q,sing,masc,hum).
n(jury,P,Q,sing,masc,hum).
n(judo,P,Q,sing,masc,nhum).
n(médaille,P,Q,sing,fem,nhum).
n(archer,P,Q,sing,masc,hum).
n(arbitrage,P,Q,sing,masc,nhum).
n(juge,P,Q,sing,masc,hum).
n(note,P,Q,sing,fem,nhum).
n(triche,P,Q,sing,fem,nhum).
n(endurance,P,Q,sing,fem,nhum).
n(pétanque,P,Q,sing,fem,nhum).
n(chaussure,P,Q,sing,fem,hum).
n(challenger,P,Q,sing,masc,hum).
n(équipe,P,Q,sing,fem,nhum).
n(médaille,P,Q,sing,fem,nhum).
n(funboard,P,Q,sing,masc,hum).
n(touche,P,Q,sing,fem,nhum).
% n(maître-nageur,P,Q,sing,masc,hum).
n(étirement,P,Q,sing,masc,nhum).
n(parachutiste,P,Q,sing,fem,hum).
n(ace,P,Q,sing,masc,nhum).
n(compétence,P,Q,sing,fem,nhum).
n(perche,P,Q,sing,fem,nhum).
n(kitesurf,P,Q,sing,masc,nhum).
n(vainqueur,P,Q,sing,masc,hum).
n(interdit,P,Q,sing,masc,nhum).
n(rotation,P,Q,sing,fem,nhum).
n(finale,P,Q,sing,fem,nhum).
n(mêlée,P,Q,sing,fem,nhum).
n(cavalier,P,Q,sing,masc,hum).
n(judoka,P,Q,sing,fem,hum).
n(victoire,P,Q,sing,fem,nhum).
n(international,P,Q,sing,masc,nhum).
n(provocation,P,Q,sing,fem,nhum).
n(coaching,P,Q,sing,masc,nhum).
n(poulain,P,Q,sing,masc,hum).
n(porter,P,Q,sing,masc,nhum).
n(aïkidoka,P,Q,sing,masc,hum).
n(dameuse,P,Q,sing,fem,nhum).
n(gymnase,P,Q,sing,masc,nhum).
n(poudreuse,P,Q,sing,fem,nhum).
n(centre,P,Q,sing,masc,nhum).
n(physique,P,Q,sing,masc,nhum).
n(adversaire,P,Q,sing,masc,hum).
n(manager,P,Q,sing,masc,hum).
n(jonglage,P,Q,sing,masc,nhum).
% n(hors-jeu,P,Q,plur,masc,nhum).
n(hockey,P,Q,sing,masc,nhum).
n(volant,P,Q,sing,masc,nhum).
n(performance,P,Q,sing,fem,nhum).
n(transfert,P,Q,sing,masc,nhum).
n(joueur,P,Q,sing,masc,hum).
n(bodybuilder,P,Q,sing,masc,hum).
n(épreuve,P,Q,sing,fem,nhum).
n(réception,P,Q,sing,fem,nhum).
n(formation,P,Q,sing,fem,nhum).
n(arrivée,P,Q,sing,fem,nhum).
% n(beach-volley,P,Q,sing,masc,nhum).
n(kayakiste,P,Q,sing,fem,hum).
n(tacle,P,Q,sing,masc,nhum).
n(équipier,P,Q,sing,masc,hum).
n(handball,P,Q,sing,masc,nhum).
% n(semi-marathon,P,Q,sing,masc,nhum).
n(remplaçant,P,Q,sing,masc,hum).
n(qualification,P,Q,sing,fem,nhum).
n(tango,P,Q,sing,masc,nhum).
n(poirier,P,Q,sing,masc,nhum).
n(moniteur,P,Q,sing,masc,hum).
n(professionnel,P,Q,sing,masc,hum).
n(disqualification,P,Q,sing,fem,nhum).
n(supportrice,P,Q,sing,fem,hum).
n(acrobates,P,Q,plur,masc,hum).
n(arc,P,Q,sing,masc,nhum).
n(athlète,P,Q,sing,fem,hum).
n(entraîneur,P,Q,sing,masc,hum).
n(sélection,P,Q,sing,fem,nhum).
n(crosse,P,Q,sing,fem,nhum).
n(courbature,P,Q,sing,fem,nhum).
n(vitesse,P,Q,sing,fem,nhum).
n(amateur,P,Q,sing,masc,hum).
n(règle,P,Q,sing,fem,nhum).
n(pongiste,P,Q,sing,fem,hum).
n(cochonnet,P,Q,sing,masc,nhum).
n(pilote,P,Q,sing,masc,hum).
n(lancer,P,Q,sing,masc,nhum).
n(résultats,P,Q,plur,masc,nhum).
n(dribbleur,P,Q,sing,masc,nhum).
n(deltaplane,P,Q,sing,masc,nhum).
n(bicycle,P,Q,sing,masc,nhum).
n(podium,P,Q,sing,masc,nhum).
n(canot,P,Q,sing,masc,nhum).
n(danseuse,P,Q,sing,fem,hum).
n(asthme,P,Q,sing,masc,nhum).
n(effort,P,Q,sing,masc,nhum).
n(rivalité,P,Q,sing,fem,nhum).
n(canoë,P,Q,sing,masc,nhum).
n(clapping,P,Q,sing,masc,nhum).
n(milieu,P,Q,sing,masc,nhum).
n(sportives,P,Q,plur,fem,hum).
n(exercices,P,Q,plur,masc,nhum).
n(parapente,P,Q,sing,masc,nhum).
n(acrobate,P,Q,sing,masc,hum).
n(fédération,P,Q,sing,fem,nhum).
% n(moto-cross,P,Q,plur,masc,nhum).
n(revers,P,Q,plur,masc,nhum).
n(lob,P,Q,sing,masc,nhum).
n(meneur,P,Q,sing,masc,hum).
n(poteaux,P,Q,plur,masc,nhum).
n(avantage,P,Q,sing,masc,nhum).
n(aïkido,P,Q,plur,masc,nhum).
n(dos,P,Q,sing,masc,nhum).
n(lancers,P,Q,plur,masc,nhum).
n(sortie,P,Q,sing,fem,nhum).
n(montagne,P,Q,sing,fem,hum).
n(marche,P,Q,sing,fem,nhum).
n(tireur,P,Q,sing,masc,hum).
n(entraineuse,P,Q,sing,fem,hum).
n(panenka,P,Q,sing,fem,nhum).
n(supporteurs,P,Q,plur,masc,hum).
n(rugby,P,Q,sing,masc,nhum).
n(amateur,P,Q,sing,fem,hum).
n(corner,P,Q,sing,masc,nhum).
n(vestiaire,P,Q,sing,masc,nhum).
n(attaquant,P,Q,sing,masc,hum).
n(surface,P,Q,sing,fem,nhum).
n(olympiades,P,Q,plur,fem,nhum).
n(montants,P,Q,plur,masc,nhum).
n(toréador,P,Q,sing,masc,hum).
n(roller,P,Q,sing,masc,nhum).
n(parade,P,Q,sing,fem,nhum).
n(sportifs,P,Q,plur,masc,hum).
n(concours,P,Q,plur,masc,nhum).
n(parachutisme,P,Q,sing,masc,nhum).
n(bowling,P,Q,sing,masc,nhum).
n(repos,P,Q,sing,masc,nhum).
n(anticipation,P,Q,sing,fem,nhum).
n(courbatures,P,Q,plur,fem,nhum).
n(règles,P,Q,plur,fem,nhum).
n(arène,P,Q,sing,fem,nhum).
n(footballeuse,P,Q,sing,fem,hum).
n(entraîneuse,P,Q,sing,fem,hum).
n(slalom,P,Q,sing,masc,nhum).
n(talonneur,P,Q,sing,masc,hum).
n(paratriathlon,P,Q,sing,masc,nhum).
n(alpiniste,P,Q,sing,fem,hum).
% n(demi-finale,P,Q,sing,fem,nhum).
n(automobile,P,Q,sing,fem,nhum).
n(chasuble,P,Q,sing,fem,nhum).
% n(week-end,P,Q,sing,masc,nhum).
n(frontflip,P,Q,sing,masc,nhum).
n(engagement,P,Q,sing,masc,nhum).
n(golfeur,P,Q,sing,masc,hum).
n(balayage,P,Q,sing,masc,nhum).
n(supporteur,P,Q,sing,masc,hum).
% n(cache-cou,P,Q,sing,masc,nhum).
n(rugbyman,P,Q,sing,masc,hum).
n(skieur,P,Q,sing,masc,hum).
n(natation,P,Q,sing,fem,nhum).
n(ascension,P,Q,sing,fem,nhum).
n(olympiade,P,Q,sing,fem,nhum).
n(karaté,P,Q,sing,masc,nhum).
n(cheval,P,Q,sing,masc,hum).
n(flèche,P,Q,sing,fem,nhum).
n(chrono,P,Q,sing,masc,nhum).
% n(cyclo-cross,P,Q,sing,masc,nhum).
n(sumo,P,Q,plur,masc,hum).
n(pilier,P,Q,sing,masc,hum).
% n(contre-la-montre,P,Q,sing,masc,nhum).
n(décathlonien,P,Q,sing,masc,hum).
n(gagnant,P,Q,sing,masc,nhum).
n(cartons,P,Q,plur,masc,nhum).
n(playoffs,P,Q,plur,masc,nhum).
n(guidon,P,Q,sing,masc,nhum).
n(saison,P,Q,sing,fem,nhum).
n(kart,P,Q,sing,masc,nhum).
n(danse,P,Q,sing,fem,nhum).
n(haltérophilie,P,Q,sing,fem,nhum).
n(footballeur,P,Q,sing,masc,hum).
n(palme,P,Q,sing,fem,nhum).
n(baseball,P,Q,sing,masc,nhum).
n(spectateur,P,Q,sing,masc,hum).
n(randonnée,P,Q,sing,fem,nhum).
n(surf,P,Q,sing,masc,nhum).
n(licenciés,P,Q,plur,masc,hum).
n(cyclotourisme,P,Q,sing,masc,nhum).
n(poteau,P,Q,sing,masc,nhum).
n(skate,P,Q,sing,masc,nhum).
n(pratique,P,Q,sing,fem,nhum).
n(taekwondo,P,Q,sing,masc,nhum).
n(amorti,P,Q,sing,masc,nhum).
n(joueur,P,Q,sing,masc,hum).
n(navigation,P,Q,sing,fem,nhum).
n(zumba,P,Q,sing,fem,nhum).
n(boxeur,P,Q,sing,masc,hum).
% n(home-trainer,P,Q,sing,masc,nhum).
n(basketteur,P,Q,sing,masc,hum).
n(tournois,P,Q,plur,masc,nhum).
n(hippodrome,P,Q,sing,masc,nhum).
n(perdant,P,Q,sing,masc,nhum).
n(fatigue,P,Q,sing,fem,nhum).
n(parachute,P,Q,sing,masc,nhum).
n(patinage,P,Q,sing,masc,nhum).
n(engagement,P,Q,sing,masc,hum).
n(dragster,P,Q,sing,masc,nhum).
n(collectif,P,Q,sing,masc,nhum).
% n(punching-ball,P,Q,sing,masc,nhum).
n(écurie,P,Q,sing,fem,nhum).
n(pénalty,P,Q,sing,masc,nhum).
n(escrime,P,Q,sing,fem,nhum).
n(niveau,P,Q,sing,masc,nhum).
n(échecs,P,Q,plur,masc,nhum).
n(polo,P,Q,sing,masc,nhum).
n(ligue,P,Q,sing,fem,nhum).
n(sportive,P,Q,sing,fem,nhum).
n(centre,P,Q,sing,masc,hum).
n(luge,P,Q,sing,fem,nhum).
n(chandelle,P,Q,sing,fem,nhum).
n(joggeuse,P,Q,sing,fem,hum).
n(nageuse,P,Q,sing,fem,hum).
n(frisbee,P,Q,sing,masc,nhum).
% n(club-house,P,Q,sing,masc,nhum).
n(planeur,P,Q,sing,masc,nhum).
n(championne,P,Q,sing,fem,hum).
n(décathlon,P,Q,sing,masc,nhum).
n(joggeur,P,Q,sing,masc,hum).
n(gazon,P,Q,sing,masc,nhum).
n(tifo,P,Q,sing,masc,nhum).
n(triathlon,P,Q,sing,masc,nhum).
n(plongeoir,P,Q,sing,masc,nhum).
n(chistera,P,Q,sing,fem,nhum).
n(boulodrome,P,Q,sing,masc,nhum).
% n(starting-block,P,Q,sing,masc,nhum).
n(entraînement,P,Q,sing,masc,nhum).
n(jogging,P,Q,sing,masc,nhum).
% n(hors-piste,P,Q,plur,masc,nhum).
n(entraineur,P,Q,sing,masc,hum).
n(bridge,P,Q,sing,masc,nhum).
n(exercice,P,Q,sing,masc,nhum).
n(capoeira,P,Q,sing,fem,nhum).
n(prix,P,Q,sing,masc,nhum).
n(rafting,P,Q,sing,masc,nhum).
n(voiles,P,Q,plur,fem,nhum).
n(lancé,P,Q,sing,fem,nhum).
n(arènes,P,Q,plur,fem,nhum).
n(chaussures,P,Q,sing,masc,nhum).
n(arrivée,P,Q,sing,fem,nhum).
n(place,P,Q,sing,fem,hum).
n(lancer,P,Q,sing,masc,nhum).
n(tir,P,Q,sing,masc,nhum).
n(archère,P,Q,sing,fem,hum).

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
