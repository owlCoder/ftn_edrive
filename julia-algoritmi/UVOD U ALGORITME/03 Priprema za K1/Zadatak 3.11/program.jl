# Zadatak 3.10. Napisati funkciju koja vraća vektor svih neparnih celih brojeva u intervalu
# od a do b.

function niz_neparnih_celih_brojeva(a, b)
    if a > b      # slučaj da su granice zamenjene
        a, b = b, a
    end
    
    if a % 2 == 0 # ako je paran -> prvi sledeći neparan
        a += 1
    end

    if b % 2 == 0
        b -= 1
    end
    
    interNiz = []
    
    for i in a:2:b
        push!(interNiz, i)
    end

    return interNiz
end