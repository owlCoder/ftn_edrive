# Zadatak 2.7 Napisati funkciju koja kao ulazni parametar ima matricu A, a kao
# izlazni matricu B istih dimenzija. Matrica B treba da sadrži iste elemente kao i
# matrica A, ali da ima zamenjenu levu u desnu polovinu matrice u odnosu na
# matricu A. Ukoliko je broj kolona matrice A neparan, srednju kolonu kopirati u
# matricu B. Zadatak uraditi na 2 načina: pomoću petlji i bez korišćenja petlji.

using Random

function matrica(A)
    (vrste, kolone) = size(A)
    B = zeros(vrste, kolone)

    polovina = floor(Int64, kolone / 2)
    ostatak =  floor(Int64, kolone % 2)

    if ostatak != 0
         B[:, 1:polovina] = A[:, kolone:-1:(polovina + 2)]
         B[:, kolone:-1:(polovina + 2)] = A[:, 1:polovina]
         B[:, (polovina + 1)] = A[:, (polovina + 1)]  # vrste se menjaju, kolona je fiksna

    else
         B[:, kolone:-1:(polovina + 1)] = A[:, 1:polovina] 
         B[:, 1:polovina] = A[:, kolone:-1:(polovina + 1)]
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
