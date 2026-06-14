function uporedi(student1, student2)
	return student1.brojIndeksa < student2.brojIndeksa;
end

function selectionSortStudenti!(A)
  n = length(A)
  for i=1:n-1
    minIdx = i
    for j=i+1:n
      if (uporedi(A[j], A[minIdx]))
        minIdx = j
      end
    end 
    if i!=minIdx
       A[[i minIdx]] = A[[minIdx i]];
    end
  end
end