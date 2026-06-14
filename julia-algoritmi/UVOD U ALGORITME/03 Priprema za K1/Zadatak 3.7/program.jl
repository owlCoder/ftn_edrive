# Napisati funkciju koja kao ulazne parametre ima skalare a i b, a kao izlazne skalare m i n.
# Skalar m predstavlja vrednost izraza

function vrednostIzraza(a, b)
    m = 0
    n = 0

    m = ceil( (sin(pi / 2 + a) 
              / a) * sqrt(abs(a + 1)) * exp(b) )

    n = abs( factorial(a) 
              / (cos(pi / 2 - a) + a^(b + 1)))

    return m, n
end