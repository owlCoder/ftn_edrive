function selectionSort!(niz)
    n = length(niz)

    for i in 1:(n - 1)
        minIdx = i
        for j in (i + 1):n
            if niz[j].brojIndeksa < niz[minIdx].brojIndeksa     
                minIdx = j              # znak > ili < menja način sortiranja niza
            end                         # RASTUĆE/OPADAJUĆE
        end
        if i != minIdx
            niz[[i minIdx]] = niz[[minIdx i]]
        end
    end
end                               

function sortStructArray()   
    println("Pre sortiranja:") 
    ispisStudenata(studenti)

    selectionSort!(studenti)
    println("\nPosle sortiranja:")
    ispisStudenata(studenti)

end

sortStructArray()