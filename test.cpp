#include <fstream>
#include <string.h>

using namespace std;

int main(int argc,char** argv){
  string ligne;
  ifstream sport;
  ofstream lexic;
  int j = 3;
  sport.open("sport.txt",ifstream::in);
  lexic.open("projet.pl",ofstream::out);
  if(sport.is_open()){
    sport.seekg (20, sport.beg);
    while(j<4658){
      getline(sport,ligne);
      for(int i=0;i<ligne.length();i++){
        if(ligne[i]=='n'&&ligne[i+1]=='='){
          ligne.erase(0,i+2);
        }
      }
      for(int i=0;i<ligne.length();i++){
        if(ligne[i]=='|'){
          ligne.erase(i,ligne.length());
        }
      }
      ligne="n("+ligne+",P,Q)";
      if(lexic.is_open()){
        lexic<<ligne;
        lexic<<"\n";
      }
      j++;
    }
  }
  sport.close();
  lexic.close();
}
