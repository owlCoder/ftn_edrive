function insertionSort!(niz, redosled)
    for j in 2:length(niz)
        key = niz[j]
        i = j - 1

        if redosled == "OPADAJUĆE"
            while i > 0 && niz[i] < key
                niz[i + 1] = niz[i]
                i = i - 1
            end
        elseif redosled == "RASTUĆE"
            while i > 0 && niz[i] > key
                niz[i + 1] = niz[i]
                i = i - 1
            end
        else
            println("\n$redosled NAČIN SORTIRANJA NE POSTOJI!")
            println("IZMENE NAD NIZOM NISU IZVRŠENE.\n")
            return
        end
        niz[i + 1] = key
    end
end


function sortNumberArray()
    niz = [55 -6 9 4 1 -55 55 66 3 2 11 -8]
    
    println("Niz pre sortiranja algoritmom    $niz")

    insertionSort!(niz, "RASTUĆE")
    println("Niz posle sortiranja [RASTUĆE  ] $niz")

    insertionSort!(niz, "OPADAJUĆE")
    println("Niz posle sortiranja [OPADAJUĆE] $niz")
end

sortNumberArray()
