#include <fstream>
#include <string.h>
#include <iostream>
#include <time.h>

using namespace std;

//recuperation des verbes
int main(int argc,char** argv){
  clock_t tStart = clock();
  string mot,ligne;
  ifstream sport,other;
  ofstream lexic;
  string nom[809];
  bool found = false;
  int l,compt=0,size=0;
  sport.open("generateur5.pl",ifstream::in);
  other.open("generateurBis.pl",ifstream::in);
  lexic.open("generateur7.pl",ofstream::out);
  if(other.is_open()){
    other.seekg (1000, other.beg);
    while(getline(other,ligne)){
      if(ligne.find("n(")!=-1 || ligne.find("np(")!=-1){
      for(int i=0;i<ligne.length();i++){
        if(found){
          compt++;
        }
        if(ligne[i-1] == 'p' && ligne[i] == '('){
          l = i;
          found = true;
        }
        if(ligne[i-1] == 'n' && ligne[i] == '('){
          l = i;
          found = true;
        }
        if(ligne[i]==',' && found ){
          nom[size] = ligne.substr(l+1,compt-1);
          size++;
          found = false;
          compt = 0;
          break;
        }
      }
    }
    }
  }
  for (size_t i = 0; i < 809; i++) {
    cout<<nom[i]<<endl;
  }
  if(sport.is_open()){
    sport.seekg (0, sport.beg);
    while(getline(sport,ligne)){
      if(ligne.find("(cible")!=-1){
        for(int i=0;i<ligne.length();i++){
          if(found){
            compt++;
          }
          if(ligne[i] == ','){
            l = i;
            found = true;
            compt=0;
          }
          if(ligne[i] == ')' && found){
            mot = ligne.substr(l+1,compt-1);
            found = false;
            compt = 0;
            break;
          }
        }
      }
      if(ligne.find("(agent")!=-1){
        for(int i=0;i<ligne.length();i++){
          if(found){
            compt++;
          }
          if(ligne[i] == ',' && found){
            mot = ligne.substr(l+1,compt-1);
            found = false;
            compt = 0;
            break;
          }
          if(ligne[i] == ','){
            l = i;
            found = true;
            compt=0;
          }
        }
      }
      std::cout << mot << endl;
      for(int i=0;i<120;i++){
        if(mot.find(nom[i])!=-1){
          lexic<<ligne;
          lexic<<'\n';
          break;
        }
      }
    }
  }
  sport.close();
  other.close();
  lexic.close();
  printf("Temps d'execution: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
  return 0;
}
