# Zadatak 2.7 Napisati funkciju koja kao ulazni parametar ima matricu A, a kao
# izlazni matricu B istih dimenzija. Matrica B treba da sadrži iste elemente kao i
# matrica A, ali da ima zamenjenu levu u desnu polovinu matrice u odnosu na
# matricu A. Ukoliko je broj kolona matrice A neparan, srednju kolonu kopirati u
# matricu B. Zadatak uraditi na 2 načina: pomoću petlji i bez korišćenja petlji.

function matrica!(A)
    (vrste, kolone) = size(A)
    B = zeros(vrste, kolone)

    B = reverse(A, dims = 2)

    return B
end

function main()
    A1 = [1 3; 4 5]
    A2 = [1 2 3; 4 5 6; 14 7 8]
    A3 = [1 2; 4 5; 6 7]


    println("\nPre izmene")
    display(A1)
    display(A2)
    display(A3)

    B1 = matrica!(A1)
    B2 = matrica!(A2)
    B3 = matrica!(A3)

    println("\nPosle izmene")
    display(B1)
    display(B2)
    display(B3)
end

main()
