# Zadatak 9: Napisati funkciju, po uzoru na funkciju prod, koja određuje proizvod
# svih elemenata vektora.
function _prod(v)
    p = 1

    for i in 1:length(v)
        p *= v[i]
    end

    return p
end

v = [1, 2, 3, 4, 1, 2]
println("Prod = ", _prod(v))