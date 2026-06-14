#== Zadatak 8.2. Dat je lavirint dimenzija 8x8 kao na slici. Napisati funkciju koja
pronalazi putanju do najbližeg izlaza iz lavirinta ako je data početna pozicija i
spisak izlaza i prikazati lavirint sa putanjom ==#

include("labyrinth.jl")
include("BFS.jl")

redovi = 8;
kolone = 8;
G = emptyLabyrinth(redovi, kolone);

# kreiramo lavirint
defineNodesType!(G, 1:(redovi * kolone), 'P');
defineNodesType!(G, [5 9 10 11 13 15 21 23 24 26 28 29 31 34 44 45 46 47 50 55 58 60 61 63], 'Z')

izlazi = [1 8 62 64]

path = BFS!(G, 57, izlazi)
println("\nPath = $path\n")
printLabyrinthPath(G, path)