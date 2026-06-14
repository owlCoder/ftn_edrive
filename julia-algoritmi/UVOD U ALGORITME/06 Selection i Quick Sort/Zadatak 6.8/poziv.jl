# Zadatak 6.8. Sortirati takmičare na nekom takmičenju po prezimenu i imenu
# rastuće koristeći Quick sort algoritam. Nakon toga, pronaći dva takmičara binarnom
# pretragom i ispisati koji od takmičara je osvojio veći broj poena. Za takmičara se
# pamte ime, prezime i broj osvojenih poena

include("takmicar.jl")
include("quickSort.jl")
include("binarnaPretraga.jl")

println("Nesortirani spisak takmičara:")
ispisTakmičara(takmičari)
println()

quickSort!(takmičari)
println("Sortirani spisak takmičara:")
ispisTakmičara(takmičari)

key1 = "Vanja"
key2 = "Vanja"

i1 = binarnaPretraga(takmičari, key1)
i2 = binarnaPretraga(takmičari, key2)

if i1 == -1 || i2 == -1
    println("\nZa zadati kriterijum dati takmičar se ne nalazi u nizu!")
else
    i = -1
    println("\nVeći broj poena je osvojio takmičar")
    if takmičari[i1].poeni > takmičari[i2].poeni
        i = i1
    else
        i = i2
    end

    @printf("%2i. %-10s %-10s %3i\n", i, takmičari[i].ime, takmičari[i].prezime, takmičari[i].poeni)
end