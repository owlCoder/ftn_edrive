#ifndef ANTONIM_H
#define ANTONIM_H

#include <map>
#include <string>

using namespace std;

// Funkcija koja će biti iskorišćena kao funkcija niti - u zadatom rečniku (parametar "recnik") pronaći suprotnu reč (antonim) od zadate reči "rec"
//
// recnik   - Rečnik koji sadrži parove reč - reč suprotnog značenja
// rec      - Reč za koju se traži reč suprotnog značenja
// rezultat - Reč suprotnog značenja (ako je pronađena, ako nije pronađena ovde treba da se upiše prazan string)
//
#include <iostream>
typedef map<string, string>::const_iterator cit;

void nadjiAntonim(map<string, string> recnik, string rec, string &rezultat)
{
    // AKO SE TRAZI ELEMENT
    for(cit it = recnik.cbegin(); it != recnik.cend(); it++) {
        if(it -> second == rec) {
            rezultat = it -> first;
            return;
        }
    }

    // AKO SE TRAZI PO KLJUCU
    for(cit it = recnik.cbegin(); it != recnik.cend(); it++) {
        if(it -> first == rec) {
            rezultat = it -> second;
            return;
        }
    }

    rezultat = ""; // NIJE PRONADJENA REC NI PO JEDNOM KRITERIJUMU
}

#endif // ANTONIM_H
