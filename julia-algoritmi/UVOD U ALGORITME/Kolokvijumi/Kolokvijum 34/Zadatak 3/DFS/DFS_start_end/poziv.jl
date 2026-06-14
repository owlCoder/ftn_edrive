include("graph.jl")
include("DFS.jl")

M = [0 1 1 0 0 0 1; 
     1 0 0 0 0 0 0; 
     1 0 0 1 1 0 0;
     0 0 1 0 0 0 1; 
     0 0 1 0 0 1 0; 
     0 0 0 0 1 0 1;
     1 0 0 1 0 1 0]

G = nonEmptyGraph(M)
DFS!(G, 1, 6)

printGraph(G)