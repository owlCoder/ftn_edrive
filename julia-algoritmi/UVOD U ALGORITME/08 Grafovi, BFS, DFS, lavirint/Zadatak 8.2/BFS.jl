function BFS!(G, s, izlazi)
    path = Int[]

    v = 1:length(G.V)

    for u = v
        G.V[u].color = 'W'
        G.V[u].pred = -1
    end

    Q = Int[]

    for i in 1:length(izlazi)
        G.V[izlazi[i]].color = 'G'
        G.V[izlazi[i]].pred = -1
        push!(Q, izlazi[i])
    end

    while ~isempty(Q)
        u = Q[1]
        deleteat!(Q, 1)

        if u == s
            temp = u
            while temp != -1
                path = [temp; path]
                temp = G.V[temp].pred
            end
            return path
        else
            for v in findall(G.AdjMatrix[u, :] .== 1)
                if G.V[v].color == 'W' && G.V[v].type != 'Z'
                    G.V[v].color = 'G'
                    G.V[v].pred = u
                    push!(Q, v)
                end
            end
        end
        G.V[u].color = 'B'
    end
    return path
end