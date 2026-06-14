function mergeSort!(niz)
    mergeSortStep!(niz, 1, length(niz))
end

function mergeSortStep!(niz, pocetak, kraj)
    if pocetak < kraj
        sredina = Int(floor( (pocetak + kraj) / 2))
        mergeSortStep!(niz, pocetak, sredina)
        mergeSortStep!(niz, sredina + 1, kraj)
        merge!(niz, pocetak, sredina, kraj)
    end
end

function merge!(niz, pocetak, sredina, kraj)
    Levo = copy(niz[pocetak:sredina])
    Desno = copy(niz[sredina + 1:kraj])

    push!(Levo,  typemax(Int64))    # typemin za opadajuće
    push!(Desno, typemax(Int64))    # typemax za rastuće

    i = 1
    j = 1

    for k in pocetak:kraj
        if Levo[i] <= Desno[j]  # ovde se menja znak < ili >
            niz[k] = Levo[i]
            i = i + 1
        else
            niz[k] = Desno[j]
            j = j + 1
        end
    end
end

function sortNumberArray()
    niz = [55 -6 9 4 1 -55 55 66 3 2 11 -8]
    
    println("Niz pre sortiranja algoritmom    $niz")
    mergeSort!(niz)
    println("Niz posle sortiranja [RASTUĆE  ] $niz")
end

sortNumberArray()
