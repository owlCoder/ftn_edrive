# Zadatak 7.3
# ● Neka je dat graf čiji čvorovi predstavljaju gradove, a grane puteve između gradova. Napisati
# program koji traži sve puteve između dva grada A i B.
# ● Ideja: Koristiti DFS pretragu. Umesto postavljanja čvora na vrednot crn nakon obrade
# čvora, postaviti ga opet na belog, da bi se pronašli i ostali putevi kroz taj grad.

include("GRAPH!/graph.jl")
include("DFS!/DFS.jl")

M = [0 1 1 0 0 0 1; 
     1 0 0 0 0 0 0; 
     1 0 0 1 1 0 0;
     0 0 1 0 0 0 1; 
     0 0 1 0 0 1 0; 
     0 0 0 0 1 0 1;
     1 0 0 1 0 1 0]

G = neprazanGraf(M)
DFS!(G, 1, 6)

štampanjeGrafa(G)