function binarnoPretraži(A, ključ)
    početak = 1
    kraj = length(A)

    while početak <= kraj
        sredina = Int(floor( (početak + kraj) / 2))

        if A[sredina] == ključ
            return sredina
        elseif A[sredina] > ključ
            kraj = sredina - 1
        else
            početak = sredina + 1
        end
    end

    return -1
end
