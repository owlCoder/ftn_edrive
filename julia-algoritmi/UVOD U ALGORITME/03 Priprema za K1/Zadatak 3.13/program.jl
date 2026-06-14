# Napisati funkciju koja računa proizvod prvih n neparnih prirodnih
# brojeva.

function proizvod_n_neparnih(n)
    proizvod = 1
    for i in 1:2:n
        proizvod *= i
    end

    return proizvod    
end