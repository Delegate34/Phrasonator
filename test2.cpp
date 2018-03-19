#include <fstream>
#include <string.h>
#include <iostream>

using namespace std;

int main(int argc,char** argv){
  string id,mot,ligne,line,output;
  ifstream sport,relation;
  ofstream lexic;
  bool found = false;
  int l,compt=0;
  sport.open("mots.txt",ifstream::in);
  lexic.open("projet.pl",ofstream::out);
  relation.open("relations.txt",ifstream::in);
  if(sport.is_open()){
    sport.seekg (0, sport.beg);
    while(getline(sport,ligne)){
      //recuperer id et mot
      for(int i=0;i<ligne.length();i++){
        if(found){
          compt++;
        }
        if(ligne[i] == '='){
          l = i;
          found = true;
        }
        if(ligne[i] == '|' && found){
          if(id.empty()){
            id = ligne.substr(l+1,compt-1);
          }else{
            mot = ligne.substr(l+1,compt-1);
          }
          found = false;
          compt = 0;
          if(!id.empty() && !mot.empty()){
            break;
          }
        }
      }
      //Passage du mot en langage prolog
      if(relation.is_open()){
        relation.seekg (0, relation.beg);
        while(getline(relation,line)){
          //check nom:sing+fem
          if(line.find("146881")!=-1 && line.find(id)!=-1){
            ligne = "n("+mot+",P,Q,sing,fem):-entre("+mot+",P,Q).";
            lexic<<ligne;
            lexic<<"\n";
            break;
          }
          //check nom:plur+fem
          if(line.find("146893")!=-1 && line.find(id)!=-1){
            output = "n("+mot+",P,Q,plur,fem):-entre("+mot+",P,Q).";
            lexic<<output;
            lexic<<"\n";
            break;
          }
          //check nom:sing+masc
          if(line.find("146885")!=-1 && line.find(id)!=-1){
            output = "n("+mot+",P,Q,sing,masc):-entre("+mot+",P,Q).";
            lexic<<output;
            lexic<<"\n";
            break;
          }
          //check nom:plur+masc
          if(line.find("146887")!=-1 && line.find(id)!=-1){
            output = "n("+mot+",P,Q,plur,masc):-entre("+mot+",P,Q).";
            lexic<<output;
            lexic<<"\n";
            break;
          }

        }
        relation.clear();
      }
      found = false;
      id="";
      mot="";
      line="";
      output="";
    }
  }
  sport.close();
  lexic.close();
  relation.close();
  return 0;
}
