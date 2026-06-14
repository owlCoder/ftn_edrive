using Printf

function pretraga(niz)
    elementiPojave = []
    brojPojava = []

    brojac = 1
    pivot = niz[1]
    duzina = length(niz)

    # @printf("\nELEMENT \t POJAVA\n")
    for i in 2:duzina
        if niz[i] == pivot
            brojac += 1
            
            # u slučaju da je najveći broj pojava na kraju niza
            if i == duzina
                push!(elementiPojave, pivot)
                push!(brojPojava, brojac)
            end
        else
            push!(elementiPojave, pivot)
            push!(brojPojava, brojac)
            # @printf("%5i \t %9i\n", pivot, brojac)
            pivot = niz[i]
            brojac = 1
        end
    end
    nebitanPodatak, indeks = findmax(brojPojava)

    return elementiPojave[indeks], brojPojava[indeks]
end