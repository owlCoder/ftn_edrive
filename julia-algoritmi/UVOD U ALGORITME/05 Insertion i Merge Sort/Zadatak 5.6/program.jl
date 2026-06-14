# Zadatak 5.6. Napisati funkciju koja će sortirati niz brojeva u rastućem poretku i skriptu koja
# ispisuje kojih brojeva ima najviše u nizu. Za sortiranje koristiti Merge sort algoritam, a
# algoritam traženja broja koji se najviše ponavlja uraditi jednim prolaskom kroz sortirani niz.

function mergeSort!(A)
    mergeSortStep!(A, 1, length(A));
end

function mergeSortStep!(A, p, r)
    if p < r
        q = Int(floor((p+r)/2));
        mergeSortStep!(A, p, q);
        mergeSortStep!(A, q+1, r);
        spajanje!(A, p, q, r);
    end
end

function spajanje!(A, p, q, r)
    L = copy(A[p:q])
    R = copy(A[q+1:r])

    push!(L, typemax(Int64))
    push!(R, typemax(Int64))

    i = 1;
    j = 1;

    for k = p:r
        if L[i] <= R[j]
            A[k] = L[i];
            i = i + 1;
        else
            A[k] = R[j];
            j = j + 1;
        end
    end
end