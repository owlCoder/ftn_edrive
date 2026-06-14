# ● Napisati funkciju koja za dva ID-ija korisnika pronalazi najkraću putanju od
# jednog do drugog korisnika preko veza prijateljstava. Ulazni parametar su graf,
# startni i krajnji ID od dva korisnika, a izlazni parametar je putanja koja se sastoji
# od ID-eva korisnika između pomenuta dva.
# ● Kreirati modifikaciju BFS algoritma, tako da je funkcija findPath ugrađena u
# pretragu. 

include("GRAPH!/graph.jl")
include("BFS!/BFS.jl")

M = [0 1 1 0 0 0; 
     1 0 0 1 0 1; 
     1 0 0 0 1 0;
     0 1 0 0 0 0; 
     0 0 1 0 0 1; 
     0 1 0 0 1 0]

G = neprazanGraf(M)
path = BFS!(G, 1, 6)

println("Path = $path");