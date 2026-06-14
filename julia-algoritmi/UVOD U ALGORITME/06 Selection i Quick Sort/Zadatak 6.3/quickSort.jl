function quickSort!(A)
	quickSortStep!(A, 1, length(A));
end

function quickSortStep!(A, p, r)
    if p < r
        q = partition!(A, p, r);
        quickSortStep!(A, p, q-1);
        quickSortStep!(A, q+1, r);
    end
end

function partition!(A, p, r)
    x = A[r];
    i = p - 1;
    for j = p:r-1
        if A[j] >= x
            i = i + 1;
            A[[i j]] = A[[j i]];
        end
    end
    A[[i+1 r]] = A[[r i+1]];
    return i + 1;
end