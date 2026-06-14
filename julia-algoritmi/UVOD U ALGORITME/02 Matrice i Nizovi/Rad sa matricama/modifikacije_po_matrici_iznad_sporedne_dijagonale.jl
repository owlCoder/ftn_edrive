# Za zadatu matricu A veličine 10x10, čije su vrednosti slučajno generisane, napisati program
# koji određuje sve elemente iznad sporedne dijagonale (izdvaja u poseban vektor). 

using LinearAlgebra;
using Statistics;
using Random;

function main()
    A = Random.rand(10, 10) .* 100;

    iznad_sporedne = triu(reverse(A, dims = 2), 1);
    display(iznad_sporedne)
end

main()
