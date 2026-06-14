# Ulazni parametri matrica A, skalar el1, izlazni
# matrica B, skalari s i r.
# B ima sve elemente matrice A veće od el1 na svojim
# pozicijama, dok su ostale vrednosti jednake 0.
# s je redni broj kolone matrice A sa najvećim proizvodom
# r je zbir elemenata sporedne dijagonale matrice A.
# Rešiti bez rešavanja petlji.

function zadatak2(A, el1)
    a, b = findmax(prod(A, dims = 1))
    s = b[2][1]

    r = sum(Diagonal(reverse(A, dims = 2)))
    m, n = size(A)

    B = zeros(Int, m, n)
    B = (A .> el1) .* A

    return B, s, r
end

using LinearAlgebra

A = [1 20 3; 4 45 6; 7 8 9]
el1 = 3

B, s, r = zadatak2(A, el1)

display(B)
println("\n$s\n$r")
