/*
Zadatak 0:
    Napraviti C program za analizu ulaznog teksta na osnovu tekst gramatike. Program treba da
    prepoznaje simbole:
    • reči koje počinju velikim slovom
    • reči koje počinju malim slovom i
    • tačku.

    Reči su u tekstu razdvojene belinama (razmak, tabulator, novi red). Za svaki prepoznati simbol,
    program u novom redu treba da ispiše ime tokena (CWORD, WORD ili DOT) i string reči. Ukoliko
    program, u toku analize teksta, sa ulaza preuzme znak koji nije definisan gramatikom simbola,
    treba da u novom redu ispiše "GRESKA:" i iza toga znak koji nije u skladu sa gramatikom.

    //oznaka za kraj datoteke (Windows Ctrl+Z, Unix Ctrl+D)
    Preusmeravanje ulaza kod pokretanja programa se može uraditi sa: ./a.out < test.txt

    Za ulaz: "Ovo je tekst." izlaz treba da bude:
      CWORD Ovo
      WORD je
      WORD tekst
      DOT .
*/
#include <ctype.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  int ch;
  int state = 0;
  char str[20];
  int i = 0;

  while(1) {
    switch(state) {
      case 0: {
        ch = getc(stdin);
        if(ch == '.')
          state = 1;
        else if(isupper(ch)) // da li je veliko slovo
          state = 2; 	
        else if(islower(ch)) // da li je malo slovo
          state = 3; 	
        else {
          if(ch == EOF) { // kraj unosa
            printf("\n\n");
            return 0;	
          }
        }
      }; break;

      case 1: {
        printf("\nDOT\t.");
        state = 0;
      }; break;

      case 2: {
         while(ch != ' ' && ch != '.') { // sve dok se ne naidje na tacku ili razmak
             str[i++] = ch;              // ucitavati i pamtiti sve karaktere iz datoteke
             ch = getc(stdin);
         }
         str[i] = '\0';                  // ucitana je cela rec, termiranje stringa
         printf("\nCWORD\t%s", str);

         if(ch == '.')                   // ako je sledeci ucitani karakter tacka, ispisi
            printf("\nDOT\t.");

         memset(str, '\0', sizeof(str)); // isprazni string
      	 i = 0;
         state = 0;
      }; break;

      case 3: {
         while(ch != ' ' && ch != '.') { // sve dok se ne naidje na tacku ili razmak
             str[i++] = ch;              // ucitavati i pamtiti sve karaktere iz datoteke
             ch = getc(stdin);
         }
         str[i] = '\0';                  // ucitana je cela rec, termiranje stringa
         printf("\nWORD\t%s", str);

         if(ch == '.')                   // ako je sledeci ucitani karakter tacka, ispisi
            printf("\nDOT\t.");

         memset(str, '\0', sizeof(str)); // isprazni string
      	 i = 0;
         state = 0;
      }; break;

      default: {
      	 printf("\nERROR\t");           // u suprotnom uneto je nesto nevalidno
      }; break;
    }
  }
}

