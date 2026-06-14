using LinearAlgebra

# Napisati funkciju koja kao ulazni parametar prima kvadratnu matricu A i skalar s, a kao povratne
# vrednosti vraća:

function matrice(A, s)
    # a) Skalar c, koji predstavlja srednju vrednost svih pozitivnih elemenata iz matrice A koji
    #    su deljivi sa skalarom s.
    c =  positive_rem_s = A[(A .> 0) .& (rem.(A, s) .== 0)]

    # b) Vektor p, koji se sastoji od elemenata sa glavne dijagonale matrice A koji su veći od
    #    zbira svih elemenata iz neparnih vrsta te matrice
    suma_neparni = sum(A[1:2:end, :])
    dijagonala = diag(A)
    p = dijagonala[dijagonala .>= suma_neparni]

    return c, p
end

# main.jl
A = [1 2 -3; 4 4 4; 6 -7 4]
c, p = matrice(A, 2)

println("c: ", c, "\np:", p)


