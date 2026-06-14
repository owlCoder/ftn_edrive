# Ulazni parametri skalari a, b, c
# izlaz skalari m i n

function zadatak1(a, b, c)
    i1 = sqrt(b + (c^(b - a)))
    i2 = (1 + a) / (b^2 + factorial(c))
    m = floor(i1 * i2)

    i3 = abs(b * c - b^c)
    i4 = ceil(a * b + (pi / 4) )
    n = cos(i3) - sin(i4)

    return m, n
end

m, n = zadatak1(1, 2, 3)

println("m = $m, n = $n")
