# Zadatak 5.2. Napisati funkciju koja će sortirati elemente niza u opadajućem
# redosledu upotrebom Merge Sort algoritma.

include("program.jl")

A = [5 7 2 4 6 1 3 8]

println("Pre sortiranja:")
display(A)

mergeSort!(A)

println("\nPosle sortiranja:")
display(A)