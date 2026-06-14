function getPath(Graf, pocetak, kraj)
	path = Int[]
	temp = kraj
	
	while temp != pocetak
		path = [temp; path]
		temp = G.V[temp].pred
	end
	return [pocetak; path]
end