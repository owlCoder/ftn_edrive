include("graph.jl")
include("BFS_v2.jl")

M = [0 1 0 0 0 1 1;
	 0 0 0 0 0 1 0;
	 0 0 0 0 0 0 1;
	 0 0 1 0 1 0 0;
	 0 0 0 0 0 0 0;
	 0 0 0 1 1 0 1;
	 0 0 0 0 1 0 0]
	 
start = 1

G = nonEmptyGraph(M)
BFS!(G, start)
printGraph(G)