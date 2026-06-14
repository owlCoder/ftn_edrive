# Zadatak 5. Napisati funkciju koja za zadatu kvadratnu matricu A, određuje:
# vektor m koji se formira od elemenata sa glavne dijagonale matrice A.
# skalar s koji predstavlja srednju vrednost elemenata iznad glavne dijagonale matrice
# A. (može se koristiti funkcija mean() iz programskog paketa Statistics)
using LinearAlgebra
using Statistics

A = [1 2 3; 4 5 6; 7 8 9]

# vektor m koji se formira od elemenata sa glavne dijagonale matrice A
function glavnaDijagonala(A)
    return diag(A)
end

# skalar s koji predstavlja srednju vrednost elemenata iznad glavne dijagonale matrice
# A. (može se koristiti funkcija mean() iz programskog paketa Statistics)
function avgIznadGlavneDijagonale(A)
    gornjaTrougaona = ones(size(A))
    gornjaTrougaona = triu(gornjaTrougaona, 1)
    maska = convert.(Bool, gornjaTrougaona)

    s = mean(A[maska])

    return s
end

println("m = ", glavnaDijagonala(A))
println("s = ", avgIznadGlavneDijagonale(A))
