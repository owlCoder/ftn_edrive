# Zadatak 4: Napisati funkciju koja određuje zbir svih elemenata matrice A
# gde je m broj vrsta, a n broj kolona, koji imaju osobinu da je zbir indeksa (i + j)
# paran broj (A11 + A13 + ...)
A = [1 4 -2 9 6; -10 -10 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]

function sumiranje(A)
    redova, kolona = size(A)
    suma = 0;

    for i in 1:redova
        for j in 1:kolona
            if (i + j) % 2 == 0
                suma += A[i, j]
            end
        end
    end

    return suma
end

sumiranje(A)