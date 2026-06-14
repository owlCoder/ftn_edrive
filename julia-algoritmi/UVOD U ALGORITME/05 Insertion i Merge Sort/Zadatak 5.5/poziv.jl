#== 
Zadatak 5.5. Napisati funkciju koja će sortirati redne brojeve kuća u ulici po rastućem
poretku koristeći Insertion sort metodu. Nakon toga, krirati skriptu koja će binarnom
pretragom pronaći kuću sa datim rednim brojem i ispisati da li se ona nalazi u prvoj ili
drugoj polovini ulice
==#

include("binarnoPretrazi.jl")
include("insertionSort.jl")

niz = [5 63 2 1 25 36 3 22 6 15]
ključ = 6

println("Niz pre sortiranja")
display(niz)

println("\nNiz posle sortiranja")
insertionSort!(niz)
display(niz)

println("\nElement koji se traži $ključ")
rezultat = binarnaPretraga(niz, ključ)

if  rezultat == -1
    println("\nNema kuće sa rednim brojem $ključ !")
else
    println("$rezultat")
end