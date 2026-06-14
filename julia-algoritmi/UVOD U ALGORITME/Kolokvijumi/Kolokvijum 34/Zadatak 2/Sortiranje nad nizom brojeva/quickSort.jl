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

function uporedi(n1, pivot)
    return n1 <= pivot
end

function sortNumberArray()
    niz = [55 -6 9 4 1 -55 55 66 3 2 11 -8]
    
    println("Niz pre sortiranja algoritmom    $niz")
    quickSort!(niz)
    println("Niz posle sortiranja [RASTUĆE  ] $niz")
end

sortNumberArray()
