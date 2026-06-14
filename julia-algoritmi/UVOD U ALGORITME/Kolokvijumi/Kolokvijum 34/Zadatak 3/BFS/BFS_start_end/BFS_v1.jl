# BFS funkcija sa rad idStart i idEnd

function BFS!(Graf, pocetak, kraj)
	v = 1:size(Graf.AdjMatrix, 1)
	
	# svi cvorovi osim prvog su beli
	for u in v
		if u != pocetak
			Graf.V[u].color = 'W'
			Graf.V[u].d = typemax(Int64)
			Graf.V[u].pred = -1
		end
	end
	
	# prvi cvor je prvi na redu za obradu
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
			tmp = kraj
			
			while tmp != pocetak
				putanja = [tmp; putanja]
				tmp = Graf.V[tmp].pred
			end
			return [pocetak; putanja]
		else
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
	return []
end