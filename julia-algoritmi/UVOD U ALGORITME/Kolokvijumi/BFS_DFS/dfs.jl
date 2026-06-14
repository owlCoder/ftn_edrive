function DFS!(Graf)
	v = 1:size(Graf.AdjMatrix, 1)
	
	for u in v
		Graf.V[u].color = 'W'
		Graf.V[u].pred = -1
	end
	
	for u in v
		if Graf.V[v].color == 'W'
			DFS_Visit!(Graf, u)
		end
	end
end

function DFS_Visit!(Graf, u)
	Graf.V[u].color = 'W'
	
	for v in findall(Graf.AdjMatrix[u, :] .== 1)
		if Graf.V[v].color == 'W'
			Graf.V[v].pred = u
			DFS_Visit(Graf, v)
		end
	end
	Graf.V[u].color = 'B'
end

function getPath(Graf, pocetak, kraj)
	path = Int[]
	temp = kraj
	
	while temp != pocetak
		path = [temp; path]
		temp = Graf.V[temp].pred
	end
	return [pocetak; path]
end

function DFS!(Graf, pocetak, kraj)
	v = 1:size(Graf.AdjMatrix, 1)
	
	for u in v
		Graf.V[u].color = 'W'
		Graf.V[u].pred = -1
	end
	
	DFS_Visit!(Graf, pocetak, kraj, pocetak)
end

function DFS_Visit!(Graf, u, kraj, pocetak)
	if u == kraj
		path = getPath(Graf, pocetak, kraj)
		println("Putanja: $path")
	else
		Graf.V[u].color = 'G'
		
		for v in findall(Graf.AdjMatrix[u, :] .== 1)
			if Graf.V[v].color == 'W'
				Graf.V[v].color = 'G'
				Graf.V[v].pred = u
				DFS_Visit(Graf, v, kraj, pocetak)
			end
		end
		Graf.V[u].color = 'B'
	end
end

function DFS!(Graf)
	v = 1:size(Graf.AdjMatrix, 1)
	
	for u in v
		Graf.V[u].color = 'W'
		Graf.V[u].pred = -1
	end
	
	rbOstrva = 0
	
	for u in v
		if Graf.V[v].color == 'W'
			rbOstrva += 1
			DFS_Visit!(Graf, u, rbOstrva)
		end
	end
end

function DFS_Visit!(Graf, u, rbOstrva)
	Graf.V[u].color = 'G'
	Graf.V[u].d = rbOstrva
	
	for u in findall(Graf.AdjMatrix[u, :] .== 1)
		if Graf.V[u].color == 'W'
			DFS_Visit!(Graf, v, rbOstrva)
		end
	end	
	Graf.V[u].color = 'B'
end