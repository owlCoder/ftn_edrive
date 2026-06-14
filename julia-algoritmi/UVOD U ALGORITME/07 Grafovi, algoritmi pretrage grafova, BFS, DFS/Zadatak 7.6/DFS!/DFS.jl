include("../GRAPH!/graph.jl")

putanje = []
udaljenosti = []

function DFS!(Graf, početak, kraj)
    v = 1:size(Graf.AdjMatrix, 1)
    
    for u = v
        Graf.V[u].boja = 'W'
        Graf.V[u].prethodni = -1
    end

    DFS_Poseti!(Graf, početak, kraj, početak)

    return putanje, udaljenosti
end

function DFS_Poseti!(Graf, u, kraj, početak)
    if u == kraj
        putanja = pronađiPutanju(Graf, početak, kraj)
        push!(putanje, putanja)
        push!(udaljenosti, Graf.V[kraj].udaljenost)
        # println("Put: $putanja")
    else
        Graf.V[u].boja = 'G'

        for v in findall(Graf.AdjMatrix[u, :] .> 0)
            if Graf.V[v].boja == 'W'
                G.V[v].prethodni = u
                G.V[v].udaljenost = G.V[u].udaljenost + G.AdjMatrix[u, v]
                DFS_Poseti!(Graf, v, kraj, početak)
            end
        end
        G.V[u].boja = 'W'
    end
end