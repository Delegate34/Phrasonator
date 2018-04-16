#include <fstream>
#include <string.h>
#include <iostream>
#include <ctype.h>
#include <time.h>
#include <map>
#include <sstream>
#include <vector>

using namespace std;

//ce programme a un temps d'execution de pres de 14131.57s presque 4h
int main(int argc,char** argv){
  clock_t tStart = clock();
  string id,mot,ligne,line,output;
  ifstream sport,relation;
  ofstream lexic;
  bool found = false;
  int l,compt=0,size=0;
  // string listeids[2149][3];
  // vector<string,string> listeids;
  string listeid1[2149],listeid2[2149];
  map<string, string> listemots;
  sport.open("mots.txt",ifstream::in);
  lexic.open("generateur3.pl",ofstream::out);
  relation.open("relations.txt",ifstream::in);
  if(relation.is_open()){
    relation.seekg (0, relation.beg);
    while(getline(relation,ligne)){
      //recuperer les ids des mots en relations
      // if(ligne.find('|t=13|')){
      //   agent=1;
      // }
      // if(ligne.find('|t=24|')){
      //   agent=2;
      // }
      // if(agent==1 || agent==2){
        // cout<<agent<<endl;
        if(ligne.find("|t=13|")!=-1 || ligne.find("|t=24|")!=-1){
        for(int i=0;i<ligne.length();i++){
          //   break;
          // }
          if(found){
            compt++;
          }
          if(ligne[i-1] == '1' && ligne[i] == '='){
            l = i+1;
            found = true;
          }
          if(ligne[i-1] == '2' && ligne[i] == '='){
            l = i+1;
            found = true;
          }
          if(ligne[i] == '|' && found){
            if(listeid1[size].empty()){
              // if(agent==1){
                // listeids[size].push_back(ligne.substr(l,compt-1));
              // }else{
                listeid1[size]=ligne.substr(l,compt-1);
              // }
            }else if(listeid2[size].empty()){
              // if(agent==1){
              // listeids[size].push_back(ligne.substr(l,compt-1));
              // }else{
                listeid2[size]=ligne.substr(l,compt-1);
                size++;
                // break;
              // }
            }
            // agent=0;
            found = false;
            compt = 0;
            // if(!listeids[size][2].empty()){
            //   size++;
            //   break;
            // }
          }
        }
      }
    }
  }
  for(int i=0;i<2149;i++){
    std::cout << listeid1[i]<<" "<<listeid2[i] << '\n';
  }
  //on recupere les mots correspondant aux ids
  if(sport.is_open()){
    sport.seekg (0, sport.beg);
    while(getline(sport,line)){
      //on recupere les mots et leurs ids
      for(int i=0;i<line.length();i++){
        if(found){
          compt++;
        }
        if(line[i] == '='){
          l = i;
          found = true;
        }
        if(line[i] == '|' && found){
          if(id.empty()){
            id=line.substr(l+1,compt-1);
          }else{
            listemots[id] = line.substr(l+1,compt-1);
          }
          found = false;
          compt = 0;
          if(!listemots[id].empty()){
            break;
          }
        }
      }
      id="";
      line="";
    }
  }
  for(int i=0;i<2149;i++){
    output="relsem(agent,"+listemots[listeid2[i]]+","+listemots[listeid1[i]]+").";
    lexic<<output;
    lexic<<"\n";
  }
  // for (int i=0; i < sizeof(listeids); i++){
  //   free(listeids[i]);
  // }
  listemots.clear();
  sport.close();
  lexic.close();
  relation.close();
  printf("Temps d'execution: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
  return 0;
}
