function getPath(Graf, pocetak, kraj)
	path = Int[]
	tmp = kraj

	while tmp != pocetak
		path = [tmp; path]
		tmp = Graf.V[tmp].pred
	end
	return [pocetak; path]
end

function DFS!(Graf, pocetak, kraj)
	v = 1:size(Graf.AdjMatrix, 1)
	
	# svi cvorovi su beli i nemaju prethodnika
	for u in v
		Graf.V[u].color = 'W'
		Graf.V[u].pred  = -1
	end
	
	DFS_Visit!(Graf, pocetak, kraj, pocetak)
end

function DFS_Visit!(Graf, u, kraj, pocetak)
	if u == kraj
		putanja = getPath(Graf, pocetak, kraj)
		println("Put: $putanja")
	else
		Graf.V[u].color = 'G'
		
		for v in findall(Graf.AdjMatrix[u, :] .== 1)
			if Graf.V[v].color == 'W'
				Graf.V[v].color = 'G'
				Graf.V[v].pred = u
				DFS_Visit!(Graf, v, kraj, pocetak)
			end
		end
		G.V[u].color = 'B'
	end
end