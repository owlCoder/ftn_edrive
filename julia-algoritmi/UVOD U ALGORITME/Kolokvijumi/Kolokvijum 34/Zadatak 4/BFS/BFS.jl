# BFS algoritam koji pretražuje graf počevši od prosleđenog čvora.

function BFS!(Graf, start)
	v = 1:size(Graf.AdjMatrix, 1)
	
	# svi cvorovi osim prvog su beli
	for u in v
		if u != start
			Graf.V[u].color = 'W'
			Graf.V[u].d = typemax(Int)
			Graf.V[u].pred = -1
		end
	end
	
	# prvi cvor je siv - za obradu
	Graf.V[start].color = 'G'
	Graf.V[start].d = 0
	Graf.V[start].pred = -1

	Q = Int[]
	push!(Q, start)
	
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

function getPath(Graf, pocetak, kraj)
	path = Int[]
	temp = kraj
	
	while temp != pocetak
		path = [temp; path]
		temp = Graf.V[temp].pred
	end
	return [pocetak; path]
end
