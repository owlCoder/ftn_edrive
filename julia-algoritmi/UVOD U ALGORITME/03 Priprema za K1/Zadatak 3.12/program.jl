# Zadatak 3.11. Napisati funkciju koja računa sumu prvih n prirodnih brojeva.

function suma_n_brojeva_petlja(n)
    suma = 0
    for i in 1:n
        suma += i
    end

    return suma    
end

function suma_n_brojeva_bez_petlje(n)
    suma = sum(Int64, collect(1:n))
    return suma
end