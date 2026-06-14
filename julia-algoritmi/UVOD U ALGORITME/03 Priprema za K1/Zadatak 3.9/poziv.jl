using Test

include("program.jl")

A = [1 2 3; 4 5 6; 7 8 9]
B = [10 11 12; 13 14 15; 16 17 18]
C = [11 12 13; 15 15 16; 17 18 19]
el1 = 8

@test matrice_bez_petlje(A, el1) == matrice_petlje(A, el1)
@test matrice_bez_petlje(B, el1) == matrice_petlje(B, el1)
@test matrice_bez_petlje(C, el1) == matrice_petlje(C, el1)