function DFS!(Graf)
    v = 1:size(Graf.AdjMatrix, 1)
    
    for u = v
        Graf.V[u].color = 'W'
        Graf.V[u].pred = -1
    end
    rbOstrva = 0

    for u = v
        if G.V[u].color == 'W'
            rbOstrva = rbOstrva + 1
            DFS_Poseti!(Graf, u, rbOstrva)
        end
    end
end

function DFS_Poseti!(Graf, u, rbOstrva)
    Graf.V[u].color = 'G'
    Graf.V[u].d = rbOstrva # d umesto za razdaljinu, koristimo pripadnost ostrvu
    
    for v in findall(Graf.AdjMatrix[u, :] .== 1)
        if Graf.V[v].color == 'W' && Graf.V[v].pol == 'z'
            DFS_Poseti!(Graf, v, rbOstrva)
        end
    end
    G.V[u].color = 'B'
end