# Zadatak 2.7 Napisati funkciju koja kao ulazni parametar ima matricu A, a kao
# izlazni matricu B istih dimenzija. Matrica B treba da sadrži iste elemente kao i
# matrica A, ali da ima zamenjenu levu u desnu polovinu matrice u odnosu na
# matricu A. Ukoliko je broj kolona matrice A neparan, srednju kolonu kopirati u
# matricu B. Zadatak uraditi na 2 načina: pomoću petlji i bez korišćenja petlji.

using Test
using Random

function matrica(A)
    (vrste, kolone) = size(A)
    B = zeros(vrste, kolone)

    polovina = floor(Int64, kolone / 2)
    ostatak =  floor(Int64, kolone % 2)

    for i in 1:vrste  # leva polovina -> desna polovina
        for j in 1:polovina
            B[i, j] = A[i, kolone + 1 - j]
        end
    end

    for i in 1:vrste # desna  polovina -> leva polovina
        for j in 1:polovina
            B[i, kolone + 1 - j] = A[i, j]
        end
    end

    if ostatak != 0 # srednju kolonu upiši u srednju kolonu nove matrice
        for i in 1:vrste  # vrste se menjaju, kolona je fiksna
            j = polovina + 1
            B[i, j] = A[i, j]
        end
    end

    return B
end

function main()
    A1 = [1 2 3; 4 5 6; 7 8 9]
    A2 = [1 2 3 6 3; 4 5 6 6 3; 4 4 5 6 3; 4 5 6 2 6; 5 14 7 8 5]
    A3 = [1 2; 4 5; 6 7]
    A4 = Random.rand(collect(0:15), 5, 5)
    A5 = Random.rand(collect(0:365693), (5, 2))

    @test matrica(A1) == reverse(A1, dims = 2)
    @test matrica(A2) == reverse(A2, dims = 2) 
    @test matrica(A3) == reverse(A3, dims = 2)
    @test matrica(A4) == reverse(A4, dims = 2) 
    @test matrica(A5) == reverse(A5, dims = 2) 
end

main()
