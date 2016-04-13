#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <stdbool.h>
#include <string.h>

//utilisation: alea moyenne v

int main(int argc, char *argv[])
{
  srand(time(NULL)); 
  int lettre = 97;
  int n_lettre;
  int nb_mots = 500;
  int moyenne = atoi(argv[0]);
  int v = atoi(argv[1]);  //agit sur la variance

  n_lettre = moyenne - v;
  for(int j= 0; j<nb_mots; j++){
    for(int i=0; i<n_lettre; i++){
      fputc(lettre, stdout); 
    }
    fputc(10, stdout);
  }
  n_lettre = moyenne + v;
  for(int j= 0; j<nb_mots; j++){
    for(int i=0; i<n_lettre; i++){
      fputc(lettre, stdout); 
    }
    fputc(10, stdout);
  }
  return EXIT_SUCCESS;
}



