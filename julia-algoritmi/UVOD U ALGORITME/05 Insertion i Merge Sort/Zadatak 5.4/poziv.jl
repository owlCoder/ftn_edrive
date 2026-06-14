# Zadatak 5.4. Napisati funkcije koje sortiraju niz fudbalskih klubova po broju
#osvojenih bodova opadajuće. Ukoliko dva kluba imaju isti broj osvojenih
# bodova, sortirati ih po gol razlici (razlika između broja datih i broja primljenih
# golova). Kreirati po jednu funkciju za Insertion sort i Merge sort, kao i skriptu
# koja kreira niz klubova i ispisuje ih sortirano

include("klub.jl")
include("insertionSort.jl")
include("mergeSort.jl")

println("Tabela pre sortiranja:")

ispisKlubova(klubovi)

klubovi2 = copy(klubovi)
insertionSort!(klubovi2)
mergeSort!(klubovi)

println("\nTabela posle sortiranja sa insertion sort metodom:")
ispisKlubova(klubovi)

println("\nTabela posle sortiranja sa merge sort metorom:")
ispisKlubova(klubovi2)