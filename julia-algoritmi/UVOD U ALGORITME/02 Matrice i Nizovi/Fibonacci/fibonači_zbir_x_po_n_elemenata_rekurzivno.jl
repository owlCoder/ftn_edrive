# Zadatak 2.8 Napisati funkciju koja kao ulazni parametar ima vektor A, a kao izlazni
# vektor koji sadrži sumu svih elemenata vektora A do odgovarajućeg elementa (prvi
# element, suma prva 2 elementa, suma prva 3 elementa itd...). . Zadatak uraditi
# na 2 načina: pomoću petlji i bez korišćenja petlji.


using Test

function fibonaci(A)
    suma = []
    n = size(A, 1)

    push!(suma, A[1])

    if n > 2
        # sumiraj redom
        for i in 2:n
            push!(suma, (suma[i - 1] + A[i]))
        end
    end

    return suma
end

function fibonaci_rec!(A, n, suma)
    if n > 1
        fibonaci_rec!(A, n - 1, suma)
        push!(suma, (A[n] + suma[n - 1]))
    else
        push!(suma, A[1])
    end    
end

function main()
    A1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    A2 = vec(collect(1:11))
    A3 = [1, 2, 78, 54, 61, 27]

    suma_test1 = []
    suma_test2 = []
    suma_test3 = []

    @test fibonaci(A1) == ([1, 3, 6, 10, 15, 21, 28, 36, 45])
    @test fibonaci(A2) == ([1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66])
    @test fibonaci(A3) == ([1, 3, 81, 135, 196, 223])

    @test fibonaci_rec!(A1, size(A1, 1), suma_test1) == ([1, 3, 6, 10, 15, 21, 28, 36, 45])
    @test fibonaci_rec!(A2, size(A2, 1), suma_test2) == ([1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66])
    @test fibonaci_rec!(A3, size(A3, 1), suma_test3) == ([1, 3, 81, 135, 196, 223])
end

main()
