# Zadatak 2: Za proizvoljnu kvadratnu matricu A, izdvojiti sve elemente koji su deljivi sa 9
using LinearAlgebra

A = [1 4 -2 9 6; -1 0 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]
deljiviSa9 = A[rem.(A, 9) .== 0]