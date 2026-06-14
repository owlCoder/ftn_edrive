# Zadatak 6.2. Sortirati rastuće niz struktura koje predstavljaju studente prema broju
# indeksa, upotrebom Selection sort algoritma. Struktura koja predstavlja studenta
# sadrži polja ime, prezime i brojIndeksa.    

include("student.jl")
include("selectionSort.jl")

println("Nesortirani spisak studenata:\n")
ispisStudenata(studenti)
println()
selectionSortStudenti!(studenti)
println("Sortirani spisak studenata:\n")
ispisStudenata(studenti)