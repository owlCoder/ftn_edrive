# Zadatak 7.6. Neka je dat graf čiji čvorovi predstavljaju gradove, a grane puteve između
# gradova. Za svaki pud pamti se njegova dužina d (ij). Napisati program koji traži najkraći put
# između dva grada A i B. Ideja: Koristiti DFS pretragu svih puteva, pa izabrati najmanji.

include("GRAPH!/graph.jl")
include("DFS!/DFS.jl")

M = [0 3 1 0 0 0 1; 
     3 0 0 0 4 0 0; 
     1 0 0 5 8 0 0;
     0 0 5 0 0 0 3; 
     0 4 8 0 0 4 0; 
     0 0 0 0 4 0 1;
     1 0 0 3 0 1 0]

G = neprazanGraf(M)

putanje, udaljenosti = DFS!(G, 3, 4)

if putanje == [] || udaljenosti == []
    println("Nema najkraceg puta!")
else
    junk, najkraciPut = findmin(udaljenosti)
    println("\nPut: $(putanje[najkraciPut]) je udaljenosti $(udaljenosti[najkraciPut])")

    štampanjeGrafa(G)
end