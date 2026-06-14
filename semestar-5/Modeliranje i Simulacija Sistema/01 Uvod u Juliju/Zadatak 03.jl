# Zadatak 3. Za proizvoljnu kvadratnu matricu A, izdvojiti elemente koji se nalaze 
# na preseku parnih vrsta i parnih kolona.
using LinearAlgebra

A = [1 4 -2 9 6; -1 0 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]
presekParneVrsteParneKolone = A[2:2:end, 2:2:end]