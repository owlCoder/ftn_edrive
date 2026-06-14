function selectionSort!(niz)
    n = length(niz)

    for i in 1:(n - 1)
        minIdx = i
        for j in (i + 1):n
            if niz[j] < niz[minIdx]     # znak > ili < menja način sortiranja niza
                minIdx = j              # RASTUĆE/OPADAJUĆE
            end
        end
        if i != minIdx
            niz[[i minIdx]] = niz[[minIdx i]]
        end
    end
end

function sortNumberArray()
    niz = [55 -6 9 4 1 -55 55 66 3 2 11 -8]
    
    println("Niz pre sortiranja algoritmom    $niz")
    selectionSort!(niz)
    println("Niz posle sortiranja [RASTUĆE  ] $niz")
end

sortNumberArray()