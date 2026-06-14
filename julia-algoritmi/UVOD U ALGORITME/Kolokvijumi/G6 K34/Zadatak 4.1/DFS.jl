function DFS!(Graf)
    v = 1:size(Graf.AdjMatrix, 1)

    for u in v
        Graf.V[u].color = 'W'
        Graf.V[u].pred = -1
    end

    rbOstrva = 0
    for u in v
        if Graf.V[u].color == 'W'
            rbOstrva += 1
            DFS_Visit!(Graf, u, rbOstrva)
    
        end
    end
end

function DFS_Visit!(Graf, u, rbOstrva)
    Graf.V[u].color = 'G'
    Graf.V[u].d = rbOstrva

    for v in findall(Graf.AdjMatrix[u, :] .== 1)
        if Graf.V[v].color == 'W' 
            DFS_Visit!(Graf, v, rbOstrva)
        end
    end
    Graf.V[u].color = 'B'
end