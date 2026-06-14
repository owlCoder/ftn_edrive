# quickSort.jl
# Koristi se prilagođeni quick sort algoritam za sortiranje po ključu idČvora.
# Autor: PR55-2020 Danijel Jovanović

function quickSort!(niz)
    quickSortStep!(niz, 1, length(niz))
end

function quickSortStep!(niz, pocetak, kraj)
    if pocetak < kraj
        sredina = partition!(niz, pocetak, kraj)
        quickSortStep!(niz, pocetak, sredina - 1)
        quickSortStep!(niz, sredina + 1, kraj)
    end
end

function partition!(niz, pocetak, kraj)
    pivot = niz[kraj]
    i = pocetak - 1
    
    for j in pocetak:(kraj - 1)
        if uporedi(niz[j], pivot)
            i = i + 1
            niz[[i j]] = niz[[j i]]
        end
    end
    niz[[i + 1 kraj]] = niz[[kraj i + 1]]
    return i + 1
end

function uporedi(u1, u2)
    return u1.idČvora < u2.idČvora          # znak > ili < menja način sortiranja sa
end                                         # RASTUĆE/OPADAJUĆE