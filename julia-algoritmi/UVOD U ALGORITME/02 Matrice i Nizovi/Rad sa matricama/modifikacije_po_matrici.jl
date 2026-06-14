# Formirati matricu 4x4 koja iznad glavne dijagonale ima vrednosti 5, ispod nje 2, a na glavnoj
# dijagonali vrednosti 4

using LinearAlgebra;
using Statistics;

function main()
    A = ones(4, 4);

    # IZNAD GD -> 5, ISPOD GD -> 2, NA GD -> 4
    A = triu(A, 1) .* 5 + tril(A,-1) .*2 + Diagonal(A).*4
    display(A)
end

main()
