# Zadatak 8.5 U lavirintu se osim slobodnih polja i zidova, nalaze i polja koja
# na sebi sadrže i kovčege sa blagom. Koristeći DFS algoritam, pronaći put
# kroz lavitint koji će pokupiti najviše kovčega sa blagom.

include("labyrinth.jl")
include("DFS.jl")

# definisanje lavirinta
nbRows = 8
nbColumns = 8
G = emptyLabyrinth(nbRows, nbColumns)
# definisanje vrsta cvorova
defineNodesType!(G, 1:nbRows*nbColumns, 'P'); # PUT
defineNodesType!(G, [5 10 11 13 15 21 23 24 28 29 31 34 46 47 55 58], 'Z'); # ZID
defineNodesType!(G, [9 26 44 45 50 60 61 63], 'K')          # KOVČEG SA BLAGOM

# println("Ispis putanje i izgled lavirinta pre obilaska\n")
printLabyrinthType(G)

# poziv za trazenje puta od čvora 25 do čvora 26
path = DFS!(G, 12, 26);

println("\n\nIspis putanje i izgled lavirinta posle obilaska")
println("\nPath = $path\n")
printLabyrinthPath(G, path)
brojKovčegaNaPutu(G, path)