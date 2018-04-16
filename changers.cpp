#include <fstream>
#include <string.h>
#include <iostream>
#include <time.h>

using namespace std;

//recuperation des verbes
int main(int argc,char** argv){
  clock_t tStart = clock();
  string mot,ligne;
  ifstream sport,verbe;
  ofstream lexic;
  string verbes[120];
  bool found = false;
  int l,compt=0,size=0;
  sport.open("generateur3.pl",ifstream::in);
  verbe.open("nani.txt",ifstream::in);
  lexic.open("generateur5.pl",ofstream::out);
  if(verbe.is_open()){
    verbe.seekg (0, verbe.beg);
    while(getline(verbe,ligne)){
      for(int i=0;i<ligne.length();i++){
        if(found){
          compt++;
        }
        if(ligne[i] == ' '){
          l = i;
          found = true;
          compt=0;
        }
        if(i == ligne.length()-1 && found ){
          verbes[size] = ligne.substr(l+1,compt);
          size++;
          found = false;
          compt = 0;
          break;
        }
      }
    }
  }
  if(sport.is_open()){
    sport.seekg (0, sport.beg);
    while(getline(sport,ligne)){
      if(ligne.find("(agent")!=-1){
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
      if(ligne.find("(cible")!=-1){
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
        if(verbes[i].find(mot)!=-1){
          lexic<<ligne;
          lexic<<'\n';
          break;
        }
      }
    }
  }
  sport.close();
  verbe.close();
  lexic.close();
  printf("Temps d'execution: %.2fs\n", (double)(clock() - tStart)/CLOCKS_PER_SEC);
  return 0;
}
