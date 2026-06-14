include("labyrinth.jl")
include("BFS.jl")

g = emptyLabyrinth(8, 8)

# Put 1
defineNodesType!(g, 1:8*8, 'P')
defineNodesType!(g, [1 2 3 4 7 12 15 20 30 33 34 36 37 39 40 51 52 53 61 62], 'Z')

println("\n\nPut od čvora 57 do 32:")
put1 = BFS!(g, 57, 32)
printLabyrinthPath(g, put1)

# Put 2
println("\n\nPut od čvora 57 do 64:")
put2 = BFS!(g, 57, 64)
printLabyrinthPath(g, put2)