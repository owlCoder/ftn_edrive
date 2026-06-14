# Zadatak 6.4. Sortirati niz struktura koje predstavljaju studente prema prezimenu,
# upotrebom Quick sort algoritma. Ukoliko dva studenta imaju isto prezime, sortirati ih
# po imenu. Studente sa istim imenom i prezimenom sortirati po broju indeksa.
# Struktura koja predstavlja studenta sadrži polja ime, prezime i brojIndeksa. 

include("student.jl")
include("quickSort.jl")

println("Nesortirani spisak studenata:\n")
ispisStudenata(studenti)
println()

quickSort!(studenti)
println("Sortirani spisak studenata:\n")
ispisStudenata(studenti)