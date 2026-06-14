# Zadatak 6. Napisati funkciju koja za zadate kvadratne matrice A i B istih dimenzija određuje:
# vektor m koji se sastoji od elemenata ispod glavne dijagonale matrice A koji su
# pozitivni celi brojevi deljivi sa 3.
# skalar s koji predstavlja srednju vrednost elemenata sa sporedne dijagonale matrice
# B koji su veći od srednje vrednosti elemenata sa glavne dijagonale matrice A.

using LinearAlgebra
using Statistics

# vektor m koji se sastoji od elemenata ispod glavne dijagonale matrice A koji su
# pozitivni celi brojevi deljivi sa 3.
function pozitivniCeliBrojeviDeljiviSa3(A)
    donjaTrougaona = ones(size(A))
    donjaTrougaona = tril(donjaTrougaona, -1)
    maska = convert.(Bool, donjaTrougaona)

    m = A[maska]
    m = m[(m .>= 0) .& (rem.(m, 3) .== 0)]

    return m;
end

# skalar s koji predstavlja srednju vrednost elemenata sa sporedne dijagonale matrice
# B koji su veći od srednje vrednosti elemenata sa glavne dijagonale matrice A.
function avgSporednaDijagonalaAGlavnaB(A, B)
    # srednja vrednost elemenata sa glavne dijagonale matrice a
    glavnaDijagonala = diag(A)
    avgGlavnaDijagonala = mean(glavnaDijagonala)

    # vrednosti matrice B sa sporedne dijagonale veci od proseka glavne dijagonale A
    sporednaDijagonala = diag(reverse(B, dims = 2))
    s = mean(sporednaDijagonala[sporednaDijagonala .>= avgGlavnaDijagonala])

    return s
end

# main.jl
A = [1 -2 3; 3 3 6; 7 9 8]
B = [9 8 7; 6 5 4; 3 2 1]

println("m = ", pozitivniCeliBrojeviDeljiviSa3(A))
println("s = ", avgSporednaDijagonalaAGlavnaB(A, B))
