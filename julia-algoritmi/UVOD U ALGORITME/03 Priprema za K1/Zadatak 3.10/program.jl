# Zadatak 3.9. Napisati funkciju koja kao ulazni parametar ima kvadratnu matricu A, a
# kao izlazni parametar vraća skalar s koji predstavlja redni broj vrste sa minimalnom
# sumom.

function minSumaVrsta(A)
    s = 0
    (vrste, kolone) = size(A)

    sume = vec(sum(A, dims = 2))

    najmanji = minimum(sume)
    n   = size(sume, 1)

    s = getIndexFromMin(sume, najmanji, n)

    return s
end

function getIndexFromMin(sume, najmanji, n)
    for i in 1:n
        if sume[i] == najmanji
            return i
        end
    end
end