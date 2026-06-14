include("program.jl")
include("pretragaPojava.jl")

niz = [5 63 3 1 56 36 25 5 1 25]

println("Niz pre sortiranja")
display(niz)

println("\nNiz posle sortiranja")
mergeSort!(niz)
display(niz)

pivot, brojac = pretraga(niz)
println("\nBroj $pivot se pojavio $brojac puta.")