#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <stdbool.h>
#include <string.h>


int loiGeometrique(int v)
{
  int n = 0;
  int a = 0;
  while (a != 1){
    a = rand()%(v -1) + 1;
    n+=1;
  }
  return n; 
}


int main(int argc, char *argv[])
{
  srand(time(NULL)); 
  int lettre = 103;
  int n_lettre;
  int nb_mots = 1000;
  int v = atoi(argv[0]);  //la variance

  for(int j= 0; j<nb_mots; j++){
    n_lettre = loiGeometrique(v);
    for(int i=0; i<n_lettre; i++){
      fputc(lettre, stdout); 
    }
    fputc(10, stdout);
  } 
  return EXIT_SUCCESS;
}



