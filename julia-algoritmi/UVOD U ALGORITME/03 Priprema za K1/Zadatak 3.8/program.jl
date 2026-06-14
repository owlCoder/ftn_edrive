# Zadatak 3.8. Napisati funkciju koja kao ulazni parametar ima kvadratne matrice A i B istih dimenzija i
# skalar el1, a kao izlazne parametre matricu C i skalar s. Matrica C je istih dimenzija kao i matrice A i B,
# iznad glavne dijagonale ima elemente matrice A koji se nalaze iznad glavne dijagonale, ispod glavne
# dijagonale ima elemente matrice B koji se nalaze ispod glavne dijagonale matrice B, a na dijagonali ima
# elemente el1. Skalar s predstavlja prosek svih elemenata matrice A, koji su veći od el1. 

using LinearAlgebra
using Statistics

function matrice(A, B, el1)
    (VA, KA) = size(A)
    (VB, KB) = size(B)

    if (VA == KA && VB == KB) && (VA == VB)
        C = zeros(VA, KA)
        s = 0

        gornjaTroug = triu(A)
        donjaTroug =  tril(B)
        C = C + gornjaTroug + donjaTroug

        dijagonala = Diagonal(ones(VA, KA))
        C[findall(dijagonala .== 1)] .= el1

        veciOdEl1 = findall(A .> el1)
        s = mean(A[veciOdEl1])
    end


    return C, s
end