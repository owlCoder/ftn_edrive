include("program.jl")

A = [1 2 3; 4 5 6; 7 8 9]
B = [10 11 12; 13 14 15; 16 17 18]
el1 = 5

C, s = matrice(A, B, el1)

display(C)
println("\nSrednja vrednost elemenata većih od $el1 je: $s")