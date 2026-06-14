# DFS obilazak grafa bez 'ostrva'

function DFS!(Graf)
	v = 1:size(Graf.AdjMatrix, 1)
	
	# svi cvorovi su na pocetku beli i nemaju prethodnika
	for u in v
		Graf.V[u].color = 'W'
		Graf.V[u].pred  = -1
	end
	
	# prodji kroz svaki beli cvor
	for u in v
		if Graf.V[u].color == 'W'
			DFS_Visit!(Graf, u)
		end
	end
end

function DFS_Visit!(Graf, u)
	G.V[u].color = 'G'
	
	for v in findall(Graf.AdjMatrix[u, :] .== 1)
		if Graf.V[v].color == 'W'
			Graf.V[v].pred = u
			DFS_Visit!(Graf, v)
		end
	end
	Graf.V[u].color = 'B'
end