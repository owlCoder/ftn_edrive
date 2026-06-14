# Zadatak 1: Za proizvoljnu kvadratnu matricu A, izdvojiti sve parne kolone.
using LinearAlgebra

A = [1 4 -2 9 6; -1 0 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]
parneKolone = A[:, 2:2:end]