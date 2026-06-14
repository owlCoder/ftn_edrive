# Zadatak 5.7. Napisati funkciju koja sortira niz tenisera po broju poena na ATP listi i skriptu
# koja ispisuje parove prvog kola turnira. Ukoliko dva tenisera imaju isti broj poena, sortirati ih
# po prezimenu i imenu. U prvom kolu turnira, sastaju se najbolje plasiran teniser i najgore
# plasirani, drugoplasirani i pretposlednje plasirani itd. Tenisere sortirati Insertion sort
# metodom.

include("teniser.jl")
include("program.jl")
include("insertionSort.jl")

println("Pre sortiranja")
ispisTenisera(teniseri)

println("\nPosle sortiranja")
insertionSort!(teniseri)
ispisTenisera(teniseri)

println("\n\n------------------------------- RASPORED TENISERA ZA PRVO KOLO ------------------------------------ ")
rasporediPrvoKolo(teniseri)
println("--------------------------------------------------------------------------------------------------- ")
