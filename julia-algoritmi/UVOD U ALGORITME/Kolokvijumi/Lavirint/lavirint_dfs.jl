function DFS!(Graf, pocetak, kraj)
    v = 1:length(Graf.V)

    for u in v
        G.V[u].color = 'W'
    end
    return DFS_Visit!(Graf, pocetak, kraj)
end

function DFS_Visit!(Graf, pocetak, kraj)
    path = Int[]

    if pocetak == kraj
        path = [pocetak]
        return path
    end

    G.V[pocetak].color = 'G'

    for v in findall(Graf.AdjMatrix[pocetak, :] .== 1)
        if Graf.V[v].color == 'W' && Graf.V[v].type == 'P'
            path = DFS_Visit!(Graf, v, kraj)

            if length(path) != 0
                return [pocetak; path]
            end
        end
    end
    Graf.V[pocetak].color = 'B'
    return path
end