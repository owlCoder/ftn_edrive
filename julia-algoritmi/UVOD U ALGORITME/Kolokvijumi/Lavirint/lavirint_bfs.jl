function BFS!(Graf, s)
    v = 1:size(Graf.AdjMatrix, 1)

    for u in v
        if u != s
            Graf.V[u].color = 'W'
            Graf.V[v].d = typemax(Int)
            Graf.V[v].pred = -1
        end
    end

    Graf.V[s].color = 'G'
    Graf.V[s].d = 0
    Graf.V[s].pred = -1

    Q = Int[]
    push!(Q, s)

    while ~isempty(Q)
        u = Q[1]
        deleteat!(Q, 1)

        for v in findall(Graf.AdjMatrix[u, :] .== 1)
            if Graf.V[v].color == 'W' && Graf.V[v].type == 'P'
                Graf.V[v].color = 'G'
                Graf.V[v].d = Graf.V[u].d + 1
                Graf.V[v].pred = u
                push!(Q, v)
            end
        end
        Graf.V[u].color = 'B'
    end
end

# sa ciljem
function BFS!(Graf, s)
    v = 1:size(Graf.AdjMatrix, 1)

    for u in v 
        if u != s
            Graf.V[u].color = 'W'
            Graf.V[u].pred = -1
            Graf.V[u].d = typemax(Int)
        end
    end

    Graf.V[s].color = 'G'
    Graf.V[s].d = 0
    Graf.V[s].pred = -1

    Q = Int[]
    push!(Q, s)

    while ~isempty(Q)
        u = Q[1]
        deleteat!(Q, 1)

        if G.V[u].type == 'C'
            path = Int[]
            temp = u

            while temp != s
                path = [temp; path]
                temp = Graf.V[temp].pred
            end
            return [s; path]
        else
            for v in findall(Graf.AdjMatrix[u, :] .== 1)
                if Graf.V[v].color == 'W'
                    Graf.V[v].color = 'G'
                    Graf.V[v].pred = u
                    Graf.V[v].d = Graf.V[u].pred + 1
                    push!(Q, v)
                end
            end
        end
        Graf.V[u].color = 'B'
    end
    return Int[]
end

# vise izlaza
function BFS!(Graf, s, izlazi)
    path = Int[]
    v = 1:length(Graf.V)

    for u in v
        Graf.V[u].color = 'W'
        Graf.V[u].pred = -1
    end

    Q = Int[]

    # izlazi kao pocetni cvorovi
    for i in 1:length(izlazi)
        Graf.V[izlazi[i]].color = 'G'
        Graf.V[izlazi[i]].pred = -1
        push!(Q, izlazi[i])
    end

    while ~isempty(Q)
        u = Q[1]
        deleteat!(Q, 1)

        if u == s
            temp = u

            while temp != -1
                path = [temp; path]
                temp = Graf.V[temp].pred
            end
            return path
        else
            for v in findall(Graf.AdjMatrix[u, :] .== 1)
                if Graf.V[v].color == 'W' && Graf.V[v].type == 'P'
                    Graf.V[v].color = 'G'
                    Graf.V[v].pred = u
                    push!(Q, v)
                end
            end
        end
        Graf.V[u].color = 'B'
    end
    return path
end

function getPath(Graf, pocetak, kraj)
    path = Int[]
    temp = kraj

    while kraj != pocetak
        path = [temp; path]
        temp = Graf.V[temp].pred
    end
    return [pocetak; path]
end