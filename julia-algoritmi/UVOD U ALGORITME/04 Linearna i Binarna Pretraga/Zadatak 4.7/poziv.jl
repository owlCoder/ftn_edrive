include("program.jl")

print("Unesite vrednost ključa pretrage\n>> ")
in = readline()
ključ = parse(Int, in)

niz = [1, 2, 2, 3, 4, 5, 5, 6, 6, 6, 6, 6, 7, 8, 9, 10, 10]

indeks = binarnaPretraga(niz, ključ)

if indeks == -1
    println("\nNema broja $ključ u datom nizu.")
else
    print("Indeksi elemenata čija je vrednost jednaka vrednosti $ključ\n\nIndeksi: ")
    dužinaNiza = length(niz)

    for i in 1:indeks-1       # leva polovina
        if niz[i] == ključ
            print("$i ")
        elseif niz[i] > ključ # stajemo kada nađemo veći element od ključa
            break
        end
    end

    for i in indeks:dužinaNiza # desna polovina
        if niz[i] == ključ
            print("$i ")
        elseif niz[i] > ključ # stajemo kada nađemo veći element od ključa
            break
        end
    end
end