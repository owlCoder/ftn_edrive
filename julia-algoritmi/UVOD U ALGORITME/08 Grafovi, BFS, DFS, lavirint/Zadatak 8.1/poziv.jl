#== Zadatak 8.1 Dat je lavirint dimenzija 8x8. Napisati funkciju koja pronalazi putanju
do izlaza iz lavirinta ako je data početna pozicija i pozicija izlaza i prikazati lavirint
sa putanjom. Koristiti DFS pretragu, a putanju kreirati pri povratku iz rekurzije.
■ Ideja: pri nailasku na krajnji čvor vratiti putanju sa samo tim čvorom. Ukoliko je
putanja pronađena posle posete nekom čvoru, dopuniti putanju sa tekućim
čvorom i prekinuti pretragu. Ako putanja nije pronadjena, vratiti praznu putanju ==#

include("labyrinth.jl")
include("DFS.jl")

redovi = 8
kolone = 8

G = emptyLabyrinth(redovi, kolone)

defineNodesType!(G, 1:(redovi * kolone), 'P')
defineNodesType!(G, [5 9 10 11 13 15 21 23 24 26 28 29 31 34 44 45 46 47 50 55 58 60 61 63], 'Z')

path = DFS!(G, 57, 62)

println("Ispis putanje i izgled lavirinta posle obilaska")
println("\nPath = $path\n")
printLabyrinthPath(G, path)