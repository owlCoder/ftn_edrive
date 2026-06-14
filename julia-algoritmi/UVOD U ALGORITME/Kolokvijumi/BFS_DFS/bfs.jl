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
	Graf.V[s].pred = -1
	Graf.V[s].d = 0
	
	Q = Int[]
	push!(Q, s)
	
	while ~isempty(Q)
		u = Q[1]
		deleteat!(Q, 1)
		
		for v in findall(Graf.AdjMatrix[u, :] .== 1)
			if Graf.V[v].color == 'W'
				Graf.V[v].color = 'G'
				Graf.V[v].d = Graf.V[u].d + 1
				Graf.V[v].pred = u
				push!(Q, v)
			end
		end
		Graf.V[u].color = 'B'
	end
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