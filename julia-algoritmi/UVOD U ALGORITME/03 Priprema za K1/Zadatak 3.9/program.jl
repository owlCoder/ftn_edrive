# Napisati funkciju koja kao ulazne parametre ima matricu A i skalar el1, a kao izlazne
# parametre ima vektor v i skalar s. Vektor v predstavlja sve elemente iz neparnih vrsta matrice A koji su
# deljivi sa el1, a skalar s predstavlja zbir svih elemenata glavne dijagonale matrice A manjih od el1.

function matrice_petlje(A, el1)
    v = []
    s = 0

    (VA, KA) = size(A)
    
    for i in 1:2:VA
        for j in 1:KA
            if(A[i, j] % el1 == 0)
                push!(v, A[i, j])
            end
        end
    end

    for i in 1:VA
        for j in 1:KA
            if(i == j && A[i, j] < el1)
                s += A[i, j]
            end
        end
    end
    
    return v, s
end


function matrice_bez_petlje(A, el1)
    (VA, KA) = size(A)

    neparneVrste = A[1:2:VA, :]
    deljiviSaEl1 = neparneVrste .% el1 .== 0
    v = neparneVrste[findall(deljiviSaEl1 .== 1)]

    d = Diagonal(A) + zeros(VA, KA)
    dijagonala = sum(d, dims = 1)

    manjiOdEl1 = findall(dijagonala .< el1)
    s = sum(dijagonala[manjiOdEl1])

    return v, s
end