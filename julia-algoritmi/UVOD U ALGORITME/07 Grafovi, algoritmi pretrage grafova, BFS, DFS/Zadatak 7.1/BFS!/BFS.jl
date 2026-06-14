function BFS!(Graf, početak, kraj)
    v = 1:size(Graf.AdjMatrix, 1)
    for u in v
        if u != početak
            Graf.V[u].boja = 'W'
            Graf.V[u].udaljenost = typemax(Int)
            Graf.V[u].prethodni = -1
        end
    end

    Graf.V[početak].boja = 'G'
    Graf.V[početak].udaljenost = 0
    Graf.V[početak].prethodni = -1

    Q = Int[]
    push!(Q, početak)

    while ~isempty(Q)
        u = Q[1]
        deleteat!(Q, 1)

        if u == kraj
            putanja = Int[]
            tmp = kraj

            while tmp != početak
                putanja = [tmp; putanja]
                tmp = Graf.V[tmp].prethodni
            end
            return [početak; putanja]
        else 
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
    return []
end