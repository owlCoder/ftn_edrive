mutable struct Čvor
        boja::Char
        udaljenost::Int
        prethodni::Int
end

mutable struct graf
    AdjMatrix::Array{Int, 2}
    V::Array{Čvor, 1}
end

function prazanGraf(n)
    AdjMatrix = zeros(n, n)
    V = Array{Čvor}(undef, n)

    for i in 1:n
        V[i] = Čvor('W', 0, 0)
    end
    return graf(AdjMatrix, V)
end

function neprazanGraf(AdjMatrix)
    n = size(AdjMatrix, 1)
    V = Array{Čvor}(undef, n)

    for i in 1:n
        V[i] = Čvor('W', 0, 0)
    end
    return graf(copy(AdjMatrix), V)
end

function štampanjeGrafa(Graf)
    n = size(Graf.AdjMatrix, 1)

    for i in 1:n
        for j in 1:n
            print(" $(Graf.AdjMatrix[i, j])")
        end
    println()
    end

    for i in 1:n
        println("$(Graf.V[i].boja) $(Graf.V[i].udaljenost) $(Graf.V[i].prethodni) ")
    end
end

function pronađiPutanju(Graf, početak, kraj)
    putanja = Int[]
    tmp = kraj

    while tmp != početak
        putanja = [tmp; putanja]
        tmp = Graf.V[tmp].prethodni
    end
    return [početak; putanja]
end