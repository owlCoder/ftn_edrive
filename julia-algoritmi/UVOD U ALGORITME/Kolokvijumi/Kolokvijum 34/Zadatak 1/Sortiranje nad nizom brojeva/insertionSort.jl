function insertionSort!(niz)
    for j in 2:length(niz)
        key = niz[j]
        i = j - 1

        while i > 0 && niz[i] > key     # znak > ili < menja način sortiranja niza
            niz[i + 1] = niz[i]         # RASTUĆE/OPADAJUĆE       
            i = i - 1
        end
        niz[i + 1] = key
    end
end

function sortNumberArray()
    niz = [55 -6 9 4 1 -55 55 66 3 2 11 -8]
    
    println("Niz pre sortiranja algoritmom    $niz")
    insertionSort!(niz)
    println("Niz posle sortiranja [RASTUĆE  ] $niz")
end

sortNumberArray()
