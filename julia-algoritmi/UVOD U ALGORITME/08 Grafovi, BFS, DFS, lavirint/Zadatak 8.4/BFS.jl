function BFS!(G, s)
   # da li je korisnik uneo čvor gde je rupa ?
   if G.V[s].type == 'R' || G.V[s].type == 'Z'
		error("Rupa/Zid ne može biti cilj, samo P (put)!")
   end

   v = 1:size(G.AdjMatrix, 1) 
   for u in v
     if u != s
        G.V[u].color = 'W'
		G.V[u].d = typemax(Int)
		G.V[u].pred = -1
     end
   end 

   G.V[s].color = 'G'
   G.V[s].d = 0
   G.V[s].pred = -1
  
   Q = Int[]
   push!(Q, s)

   while ~isempty(Q) 
        u = Q[1]
		deleteat!(Q, 1) 

        for v in findall(G.AdjMatrix[u,:] .==1) 
	   		if G.V[v].color == 'W' && G.V[v].type != 'Z' && G.V[v].type != 'R' 
				G.V[v].color = 'G'
				G.V[v].d = G.V[u].d + 1
				G.V[v].pred = u
				push!(Q, v)
	   		end 
		end 
		G.V[u].color = 'B'
   end 
end 
 
function getPath(G, idStart, idEnd) 
	path = Int[]
	temp = idEnd; 
	while (temp != idStart) 
		path = [temp; path]

		if temp < 1
			error("Nije moguće naći put do cilja!")
		end
			temp = G.V[temp].pred;
	end 
	return [idStart; path]
end
