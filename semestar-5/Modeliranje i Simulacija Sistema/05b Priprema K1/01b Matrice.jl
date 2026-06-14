using LinearAlgebra, Statistics

function matrica(A, k)
    # pod a
    neparne_vrste = A[1:2:end, :]
    v = neparne_vrste[neparne_vrste .< k]

    # pod b
    avg_gd = mean(diag(A))
    el_ispod_gd = tril(A, -1)
    s = length(el_ispod_gd[el_ispod_gd .< avg_gd])

    return v, s
end

# main.jl
A = [1 2 3; 4 5 6; 7 8 9]
println(matrica(A, 5))