# Zadatak 7.2
# ● Napisati funkciju koja grupiše korisnike tako da se u svakoj grupi može doći od
# jednog do drugog korisnika vezama prijateljstava.
# ● Zadatak uraditi tako da se strukturi koja predstavlja korisnika doda polje
# koje označava pripadnosti grupi (ostrvu).

include("GRAPH!/graph.jl")
include("DFS!/DFS.jl")

M = [0 1 1 0 0 0 0; 
     1 0 0 0 0 0 0; 
     1 0 0 0 0 0 0;
     0 0 0 0 0 0 1; 
     0 0 0 0 0 1 0; 
     0 0 0 0 1 0 0;
     0 0 0 1 0 0 0]

G = neprazanGraf(M)
DFS!(G)

štampanjeGrafa(G)