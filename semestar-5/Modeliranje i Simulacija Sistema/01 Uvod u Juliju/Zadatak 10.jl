# Zadatak 10: Napisati funkciju, po uzoru na funkciju sum, koja određuje sumu elemenata 
# proizvoljne matrice. Implementirati opcioni ili imenovani parametar funkcije na osnovu koga 
# će se računati suma elemenata po vrstama ili po kolonama matrice.
function _sum(A; dims = 2) # racuna se po vrstama podrazumevano
    redovi, kolone  = size(A)
    suma = []
    tmpSuma    = 0

    for i in 1:redovi
        for j in 1:kolone
            if dims == 2 # suma po vrstama
                tmpSuma += A[i, j]
            else         # suma po kolonama
                tmpSuma += A[j, i]
            end
        end
        push!(suma, tmpSuma)
        tmpSuma = 0
    end

    return suma
end

A = [1 4 -2 9 6; -10 -10 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]
println("Suma po vrstama  matrice A iznosi: ", _sum(A, dims = 2))
println("Suma po kolonama matrice A iznosi: ", _sum(A, dims = 1))