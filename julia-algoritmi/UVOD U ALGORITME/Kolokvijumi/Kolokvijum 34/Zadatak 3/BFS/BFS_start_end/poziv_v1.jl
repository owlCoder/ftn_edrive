include("graph.jl")
include("BFS_v1.jl")

M = [0 1 1 0 0 0; 
     1 0 0 1 0 1; 
     1 0 0 0 1 0;
     0 1 0 0 0 0; 
     0 0 1 0 0 1; 
     0 1 0 0 1 0]

G = nonEmptyGraph(M)
path = BFS!(G, 1, 6)
println("Path = $path");