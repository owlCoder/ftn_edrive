# Zadatak 7.4. Neka je dat graf čiji čvorovi predstavljaju gradove, a grane puteve između
# gradova. Neka je za svaki put između dva grada i i j poznata njegova dužina dij. Napisati
# program koji traži put između dva grada A i B, ako je poznato da na putu ne sme da postoji
# put duži od d kilometara. Ideja: umesto vrednosti 1, u matrici susedstva pamtiti dužinu
# puta. Pri proveri da li je grad beo, proveriti i da li je put do njega manji od d. 
# Koristiti BFS pretragu.


include("GRAPH!/graph.jl")
include("BFS!/BFS.jl")

M = [0 3 0 0 0 0 1; 
     3 0 0 0 0 0 0; 
     1 0 0 5 8 0 0;
     0 0 5 0 0 0 3; 
     0 0 8 0 0 4 0; 
     0 0 0 0 4 0 1;
     1 0 0 3 0 1 0]

G = neprazanGraf(M)

maxKm = 10
putevi = BFS!(G, 1, 3, maxKm)

println("\nPut: $putevi")

štampanjeGrafa(G)