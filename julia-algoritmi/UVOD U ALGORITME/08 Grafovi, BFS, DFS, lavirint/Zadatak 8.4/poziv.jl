#==  Zadatak 8.4 U lavirintu se osim slobodnih polja i zidova, nalaze i rupe u koje
ne sme da se upadne prilikom traženja puta. Napisati program koji pronalazi
put kroz lavirint, takav da se na putu ne nalazi nijedna rupa.
– Ideja: Uvesti i tip čvora za rupu. Prilikom provere da li je susedni čvor beo,
proveriti i da li je različit od rupe. ==#

include("labyrinth.jl")
include("BFS.jl")

nbRows = 5; 
nbColumns = 5; 
G = emptyLabyrinth(nbRows, nbColumns)

defineNodesType!(G, [1 2 3 5 6 8 13 14 15 17 21 22 24 25], 'P'); # PUT
defineNodesType!(G, [4 7 9 16 18 19 20], 'Z');                   # ZID 
defineNodesType!(G, [10 11 12 23], 'R');                         # RUPA

println("Izgled lavirinta pre obilaska")
println()
printLabyrinthType(G)
println()
#== SVI ČVORI ĆE SVAKAKO BITI BELI
println("Ispis lavirinta pre obilaska")
println()
printLabyrinthColor(G)
println() ==#

println("Ispis lavirinta posle obilaska")
println()
BFS!(G, 22); 
printLabyrinthColor(G)
println()

println("Izgled lavirinta sa putanjom")
println()
path = getPath(G, 22, 6)
printLabyrinthPath(G, path)
println()