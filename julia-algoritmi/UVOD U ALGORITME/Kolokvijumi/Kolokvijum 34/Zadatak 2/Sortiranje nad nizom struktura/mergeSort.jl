include("student.jl")

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
    Levo =  copy(niz[pocetak:sredina])
    Desno = copy(niz[sredina + 1:kraj])

    push!(Levo,  Student("", "", typemax(Int64)))     # typemin za opadajuće
    push!(Desno, Student("", "", typemax(Int64)))     # typemax za rastuće

    i = 1
    j = 1

    for k in pocetak:kraj
        if uporedi(Levo[i], Desno[j])  # ovde se menja znak < ili >
            niz[k] = Levo[i]
            i = i + 1
        else
            niz[k] = Desno[j]
            j = j + 1
        end
    end
end

function uporedi(s1, s2)
    return s1.brojIndeksa < s2.brojIndeksa  # znak > ili < menja način sortiranja sa
end                                         # RASTUĆE/OPADAJUĆE

function sortStructArray()   
    println("Pre sortiranja:") 
    ispisStudenata(studenti)

    mergeSort!(studenti)
    println("\nPosle sortiranja:")
    ispisStudenata(studenti)

end

sortStructArray()