# Zadatak 3.5. Napisati funkciju koja kao ulazne parametre ima skalare d, el1 i el2, a kao
# izlazni parametar vraća matricu A. Matrica A je kvadratna matrica dimenzije d, koja u
# neparnim vrstama ima elemente el1, a u parnim vrstama elemente el2.

function zadatak35(d, el1, el2)
    A = zeros(d, d)
    A[1:2:d, :] .= el1
    A[2:2:d, :] .= el2

    return A
end

A = zadatak35(6, 5, 2)
display(A)

