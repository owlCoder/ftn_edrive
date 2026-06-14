# Zadatak 3.15. Napisati funkciju koja vraća vektor prostih brojeva čiji je proizvod jednak
# celom broju n.

function niz_prostih_brojeva(n)
    niz = []
    for i in 2:n
        while(n % i == 0)
            n /= i
            push!(niz, i)
        end
    end

    return vec(niz)
end