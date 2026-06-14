iscoprime(P, i) = !any(x -> i % x == 0, P)

# The remainder operator in Julia is the % operator. 
# This operator behaves similarly to the % in languages such as C and C++.
# a % b is the signed remainder left over after dividing a by b.

function sito(n)
    P = Int[]
    for i in 2:n
        if iscoprime(P, i)
            push!(P, i)
        end
    end

    return P
end