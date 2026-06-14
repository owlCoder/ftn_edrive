# Neka je zadata proizvoljna matrica B. Napisati kod u Julia-i koji određuje logičku vrednost da li
# je proizvod svih elemenata u parnim redovima veći od sume svih elemenata u neparnim
# kolonama.

# Neka je zadata proizvoljna matrica A. Odrediti redni broj vrste sa 
# maksimalnim zbirom elemenata. 

using LinearAlgebra;
using Statistics;
using Random;

function main()
    A = [1 2 3; 4 5 6; 7 8 9; 10 11 12]

    sumaNeparneKolone = sum(A[:, 1:2:end])
    proizvodParniRedovi = prod(prod(A[2:2:end, :], dims = 2))
    
    display(A)
    println("\nSuma neparne kolone: $sumaNeparneKolone")
    println("Proizvod parni redovi: $proizvodParniRedovi")
    println("Proizvod parni redovi > sumaNeparneKolone ? : $(proizvodParniRedovi > sumaNeparneKolone)")
end

main()
