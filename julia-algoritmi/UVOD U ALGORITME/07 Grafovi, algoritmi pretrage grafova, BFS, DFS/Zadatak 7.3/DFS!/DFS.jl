include("../GRAPH!/graph.jl")

function DFS!(Graf, početak, kraj)
    v = 1:size(Graf.AdjMatrix, 1)
    
    for u = v
        Graf.V[u].boja = 'W'
        Graf.V[u].prethodni = -1
    end

    DFS_Poseti!(Graf, početak, kraj, početak)
end

function DFS_Poseti!(Graf, u, kraj, početak)
    if u == kraj
        putanja = pronađiPutanju(Graf, početak, kraj)
        println("Put: $putanja")
    else
        Graf.V[u].boja = 'G'

        for v in findall(Graf.AdjMatrix[u, :] .== 1)
            if Graf.V[v].boja == 'W'
                G.V[v].prethodni = u
                DFS_Poseti!(Graf, v, kraj, početak)
            end
        end
        G.V[u].boja = 'W'
    end
end