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

function uporedi(s1, s2)
    return s1.brojIndeksa < s2.brojIndeksa  # znak > ili < menja način sortiranja sa
end                                         # RASTUĆE/OPADAJUĆE

function sortStructArray()   
    println("Pre sortiranja:") 
    ispisStudenata(studenti)

    quickSort!(studenti)
    println("\nPosle sortiranja:")
    ispisStudenata(studenti)

end

sortStructArray()