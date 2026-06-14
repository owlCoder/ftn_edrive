function mergeSort!(niz)
    mergeSortStep!(niz, 1, length(niz))
end

function mergeSortStep!(niz, pocetak, kraj)
    if pocetak < kraj
        sredina = Int(floor((pocetak + kraj) / 2))
        mergeSortStep!(niz, pocetak, sredina)
        mergeSortStep!(niz, sredina + 1, kraj)
        merge!(niz, pocetak, sredina, kraj)
    end
end

function merge!(niz, pocetak, sredina, kraj)
    L = copy(niz[pocetak:sredina])
    D = copy(niz[sredina+1:kraj])

    push!(L, typemax(Int64))
    push!(D, typemax(Int64))

    i = 1
    j = 1

    for k in pocetak:kraj
        if L[i] <= D[j]
            niz[k] = L[i]
            i += 1
        else
            niz[k] = D[j]
            j += 1
        end
    end
end