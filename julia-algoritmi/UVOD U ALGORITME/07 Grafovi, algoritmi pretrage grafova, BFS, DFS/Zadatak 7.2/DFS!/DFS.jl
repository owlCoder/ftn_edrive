function DFS!(Graf)
    v = 1:size(Graf.AdjMatrix, 1)
    
    for u = v
        Graf.V[u].boja = 'W'
        Graf.V[u].prethodni = -1
    end
    rbOstrva = 0

    for u = v
        if G.V[u].boja == 'W'
            rbOstrva = rbOstrva + 1
            DFS_Poseti!(Graf, u, rbOstrva)
        end
    end
end

function DFS_Poseti!(Graf, u, rbOstrva)
    Graf.V[u].boja = 'G'
    Graf.V[u].udaljenost = rbOstrva # d umesto za razdaljinu, koristimo pripadnost ostrvu
    
    for v in findall(Graf.AdjMatrix[u, :] .== 1)
        if Graf.V[v].boja == 'W'
            DFS_Poseti!(Graf, v, rbOstrva)
        end
    end
    G.V[u].boja = 'B'
end