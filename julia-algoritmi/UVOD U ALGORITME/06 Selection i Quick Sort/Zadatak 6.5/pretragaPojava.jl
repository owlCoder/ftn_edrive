function pretraga(recnici)
    elementiPojave = []
    brojPojava = []

    brojac = 1
    pivot = recnici[1].rec
    duzina = length(recnici)

    for i in 2:duzina
        if recnici[i].rec == pivot
            brojac += 1
            
            # u slučaju da je najveći broj pojava na kraju recnicia
            if i == duzina
                push!(elementiPojave, pivot)
                push!(brojPojava, brojac)
            end
        else
            push!(elementiPojave, pivot)
            push!(brojPojava, brojac)
           
            pivot = recnici[i].rec
            brojac = 1
        end
    end
    nebitanPodatak, indeks = findmax(brojPojava)

    return elementiPojave[indeks], brojPojava[indeks]
end