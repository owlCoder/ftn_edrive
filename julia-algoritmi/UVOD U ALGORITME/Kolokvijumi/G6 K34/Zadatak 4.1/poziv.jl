include("graph.jl")
include("DFS.jl")

G = emptyGraph(8)

G.V[1].ime = "Mesa"
G.V[1].prezime = "Selimovic"
G.V[1].pol = 'm'
G.V[2].ime = "Laza"
G.V[2].prezime = "Lazarevic"
G.V[2].pol = 'm'
G.V[3].ime = "Jovan"
G.V[3].prezime = "Jovanovic"
G.V[3].pol = 'm'
G.V[4].ime = "Isidora"
G.V[4].prezime = "Sekulic"
G.V[4].pol = 'z'
G.V[5].ime = "Dragoljub"
G.V[5].prezime = "Mihailovic"
G.V[5].pol = 'm'
G.V[6].ime = "Borislav"
G.V[6].prezime = "Pekic"
G.V[6].pol = 'm'
G.V[7].ime = "Ivo"
G.V[7].prezime = "Andric"
G.V[7].pol = 'm'
G.V[8].ime = "Danica"
G.V[8].prezime = "Maksimovic"
G.V[8].pol = 'z'

G.AdjMatrix = [ 0 1 0 0 0 0 1 0;
                1 0 1 0 1 0 0 1;
                0 1 0 0 1 0 1 0;
                0 0 0 0 0 1 1 1;
                0 1 1 0 0 1 0 1;
                0 0 0 1 1 0 1 0;
                1 0 1 1 0 1 0 0;
                0 1 0 1 1 0 0 0]

DFS!(G)
printGraph(G)