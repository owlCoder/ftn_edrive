# PR55-2020 Danijel Jovanović

include("mergeSort.jl")

niz = [55 6 -9 4 5 -23 11 20 1 6 1]

println("PRE SORTIRANJA")
display(niz)

mergeSort!(niz)

println("\nPOSLE SORTIRANJA")
display(niz)

medijalni = Int(ceil(length(niz) / 2))
println("\nMedijalni element na indeksu $medijalni je: $(niz[medijalni])")