function uporedi(student1, student2)
   return student1.brojIndeksa<student2.brojIndeksa
end

function mergeSort!(A)
   mergeSortStep!(A, 1, length(A));
end

function mergeSortStep!(A, p, r)
   if p < r
      q = Int(floor((p+r)/2));
      mergeSortStep!(A, p, q);
      mergeSortStep!(A, q+1, r);
      merge!(A, p, q, r);
   end
end

function merge!(A, p, q, r)
	L = copy(A[p:q])
	R = copy(A[q+1:r])
	push!(L, Student("", "", typemax(Int64)))
	push!(R, Student("", "", typemax(Int64)))
	i = 1;
	j = 1;
	for k = p:r
		if uporedi(L[i], R[j])
			A[k] = L[i];
			i = i + 1;
		else
			A[k] = R[j];
			j = j + 1;
		end
	end
end