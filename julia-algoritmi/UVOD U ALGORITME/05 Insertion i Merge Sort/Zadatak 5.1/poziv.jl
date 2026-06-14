# Zadatak 5.1. Napisati funkciju koja će sortirati elemente niza u opadajućem
# redosledu upotrebom Insertion Sort algoritma

include("program.jl")

A = [5 7 2 4 6 1 3]

println("Pre sortiranja:")
display(A)

insertionSort!(A)
println("\nPosle sortiranja:")
display(A)