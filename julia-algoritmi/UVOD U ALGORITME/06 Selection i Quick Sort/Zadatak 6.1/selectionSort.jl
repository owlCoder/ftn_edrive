function selectionSort!(A)
    n = length(A)
    for i=1:n-1
      maxIdx = i
      for j=i+1:n
        if A[j] > A[maxIdx]
          maxIdx = j
        end
      end 
      if i!=maxIdx
         A[[i maxIdx]] = A[[maxIdx i]];
      end
    end
  end