function BFS!(Graf, s)
    v = 1:size(Graf.AdjMatrix, 1)
    for u in v
        if u != s
            Graf.V[u].boja = 'W'
            Graf.V[u].udaljenost = typemax(Int)
            Graf.V[u].prethodni = -1
        end
    end

    Graf.V[s].boja = 'G'
    Graf.V[s].udaljenost = 0
    Graf.V[s].prethodni = -1

    Q = Int[]
    push!(Q, s)

    while ~isempty(Q)
        u = Q[1]
        deleteat!(Q, 1)

        for v in findall(Graf.AdjMatrix[u, :] .== 1)
            if Graf.V[v].boja == 'W'
               Graf.V[v].boja = 'G'
               Graf.V[v].udaljenost = Graf.V[u].udaljenost + 1
               Graf.V[v].prethodni = u
               push!(Q, v)
            end
        end
        Graf.V[u].boja = 'B'
    end
end