function BFS!(Graf, pocetak, kraj)
    v = 1:size(Graf.AdjMatrix, 1)

    # svi čvorovi osim prvog su beli
    for u in v
        if u != pocetak
            Graf.V[u].color = 'W'
            Graf.V[u].d = typemax(Int)
            Graf.V[u].pred = -1
        end
    end

    # prvi čvor je prvi na redu za obradu
    Graf.V[pocetak].color = 'G'
    Graf.V[pocetak].d = 0
    Graf.V[pocetak].pred = -1

    Q = Int[]
    push!(Q, pocetak)

    while ~isempty(Q)
        u = Q[1]
        deleteat!(Q, 1)

        if u == kraj
            putanja = Int[]
            temp = kraj

            while temp != pocetak
                putanja = [temp; putanja]
                temp = Graf.V[temp].pred
            end
            return [pocetak; putanja]
        else
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
    return []
end