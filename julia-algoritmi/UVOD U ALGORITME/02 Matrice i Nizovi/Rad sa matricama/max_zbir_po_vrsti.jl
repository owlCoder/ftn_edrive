# Neka je zadata proizvoljna matrica A. Odrediti redni broj vrste sa 
# maksimalnim zbirom elemenata. 

using LinearAlgebra;
using Statistics;
using Random;

function main()
    A = [1 2 3; 4 5 6; 7 8 9]
    display(A)

    suma = sum(A, dims = 2);
    maksimum = maximum(suma);
    indeksi = findall(suma .== maksimum);
    rezultat = indeksi[1][1];

    println("\nSuma iznosi: $suma");
    println("Maksimum iznosi: $maksimum");
    println("Maksimalna suma je: $(suma[rezultat]) za indeks $rezultat");
end

main()
