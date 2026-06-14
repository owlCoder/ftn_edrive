# Neka je dan sistem od 3 linearne jednačine sa 3 nepoznate. 
# Napisati kod koji rešava dati sistem 

using  LinearAlgebra;

function main()
    # A * x = B
    A = [3 2 -3; 1 2 -1; 2 2 1]
    B = [3; 5; 10]

    x = inv(A) * B
    display(x)
end

main()
