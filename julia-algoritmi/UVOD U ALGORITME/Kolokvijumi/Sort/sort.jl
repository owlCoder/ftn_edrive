function insertionSort!(niz)
	for j in 2:length(niz)
		key = niz[j]
		i = j - 1
		
		while i > 0 && niz[i] < key
			niz[i + 1] = niz[i]
			i -= 1
		end
		niz[i + 1] = key
	end
end

function selectionSort!(niz)
	n = length(niz)
	for i in 1:n-1
		minIdx = i
		
		for j in i+1:n
			if niz[j] < niz[minIdx]
				minIdx = j
			end
		end
		if i != minIdx
			niz[[i minIdx]] = niz[[minIdx i]]
		end
	end
end

function mergeSort!(niz)
	mergeSortStep!(niz, 1, length(niz))
end

function mergeSortStep!(niz, pocetak, kraj)
	if pocetak < kraj
		sredina = Int(floor((pocetak + kraj) / 2))
		mergeSortStep!(niz, pocetak, sredina)
		mergeSortStep!(niz, sredina + 1, kraj)
		merge!(niz, pocetak, sredina, kraj)
	end
end

function merge!(niz, pocetak, sredina, kraj)
	L = copy(niz[pocetak:sredina])
	D = copy(niz[sredina+1:kraj])
	
	push!(L, typemax(Int64))
	push!(D, typemax(Int64))
	
	i = 1
	j = 1
	
	for k in pocetak:kraj
		if L[i] <= D[j]
			niz[k] = L[i]
			i += 1
		else
			niz[k] = D[j]
			j += 1
		end
	end
end

function quickSort!(niz)
	quickSortStep!(niz, 1, length(niz))
end

function quickSortStep!(niz, pocetak, kraj)
	if pocetak < kraj
		sredina = partition!(niz, pocetak, kraj)
		quickSortStep!(niz, pocetak, sredina - 1)
		quickSortStep!(niz, sredina + 1, kraj)
	end
end

function partition!(niz, pocetak, kraj)
	pivot = niz[kraj]
	i = pocetak - 1
	
	for j in pocetak:kraj-1
		if niz[j] < pivot
			i += 1
			niz[[i j]] = niz[[j i]]
		end
	end
	niz[[i+1 kraj]] = niz[[kraj i+1]]
	return i + 1
end